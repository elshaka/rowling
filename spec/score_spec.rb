require 'spec_helper'

RSpec.describe Rowling::Score do
  describe '.parse' do
    it 'parses a game' do
      game_file_path = fixture_path('sample_game.txt')
      expected_parsed_game = YAML.load_file fixture_path('sample_game.parsed.yaml')

      expect(Rowling::Score.parse(game_file_path)).to eq expected_parsed_game
    end
  end

  describe '.score' do
    it 'scores a game'
  end
end
