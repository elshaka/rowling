require 'csv'

module Rowling
  class Score
    def self.parse_and_score(game_file_path)
      score parse(game_file_path)
    end

    def self.parse(game_file_path)
      throws = CSV.read(game_file_path, col_sep: "\t")
      throws.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |_throw, game|
        player = _throw[0]
        pins = _throw[1]
        pins = pins.to_i unless pins == 'F'

        # 1st frame
        if game[player].empty?
          game[player] << [pins]
        # 10th frame
        elsif game[player].count == 10
          game[player].last << pins
        # Other frames
        else
          last_frame = game[player].last
          if last_frame.count == 2 || last_frame.first == 10
            game[player] << [pins]
          else
            last_frame << pins
          end
        end
      end
    end

    def self.score(game)
      game_score = game.keys.each_with_object({}) do |player, game_score|
        game_score[player] = game[player].each_with_index.map do |frame, frame_index|
          score = frame_score(frame)

          unless tenth_frame?(frame_index)
            if strike?(frame)
              unless ninth_frame?(frame_index)
                if strike?(game[player][frame_index + 1])
                  score += 10 + game[player][frame_index + 2][0].to_i
                else
                  score += frame_score(game[player][frame_index + 1])
                end
              else
                score += game[player][frame_index + 1][0].to_i + game[player][frame_index + 1][1].to_i
              end
            elsif split?(frame)
              score += game[player][frame_index + 1][0].to_i
            end
          end

          { "pins" => frame, "score" => score }
        end
      end

      game_score.values.each do |frames|
        frames.each_with_index do |frame, frame_index|
          next if first_frame?(frame_index)
          frame["score"] += frames[frame_index - 1]["score"]
        end
      end

      game_score
    end

    def self.frame_score(frame)
      frame.reduce(0) { |score, pins| score + pins.to_i }
    end

    def self.strike?(frame)
      frame[0] == 10
    end

    def self.split?(frame)
      frame.count== 2 && frame_score(frame) == 10
    end

    def self.first_frame?(frame_index)
      frame_index == 0
    end

    def self.ninth_frame?(frame_index)
      frame_index == 8
    end

    def self.tenth_frame?(frame_index)
      frame_index == 9
    end
  end
end
