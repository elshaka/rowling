require 'csv'

module Rowling
  class Score
    def self.parse_and_score(game_file_path)
      score parse(game_file_path)
    end

    def self.parse(game_file_path)
      plays = CSV.read(game_file_path, col_sep: "\t")
      plays.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |play, game|
        name = play[0]
        pins = play[1]
        pins = pins.to_i unless pins == 'F'

        # 1st frame
        if game[name].empty?
          game[name] << [pins]
        # 10th frame
        elsif game[name].count == 10
          game[name].last << pins
        # Other frames
        else
          last_frame = game[name].last
          if last_frame.count == 2 || last_frame.first == 10
            game[name] << [pins]
          else
            last_frame << pins
          end
        end
      end
    end

    def self.score(game)
      puts "TODO: Score game"
    end
  end
end
