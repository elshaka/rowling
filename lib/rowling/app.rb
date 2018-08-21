module Rowling
  class App
    def self.run(game_file_path)
      Rowling::Display.display Rowling::Score.parse_and_score(game_file_path)
    end
  end
end
