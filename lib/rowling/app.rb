module Rowling
  class App
    def self.run(game_file_path)
      game = Rowling::Parser.parse(game_file_path)
      score = Rowling::Scorer.score(game)
      Rowling::Display.display(score)
    end
  end
end