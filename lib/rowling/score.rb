module Rowling
  class Score
    def self.parse_and_score(game_file_path)
      score parse(game_file_path)
    end

    def self.parse(game_file_path)
      puts "TODO: Parse game file"
    end

    def self.score(game)
      puts "TODO: Score game"
    end
  end
end
