require 'spec_helper'

RSpec.describe Rowling::Score do
  describe '.parse' do
    let(:game_file_path) { fixture_path('sample_game.txt') }
    let(:expected_parsed_game) { YAML.load_file fixture_path('sample_game.parsed.yaml') }

    it 'parses a game' do
      parsed_game = Rowling::Score.parse(game_file_path)

      expect(parsed_game).to eq expected_parsed_game
    end
  end

  describe '.score' do
    it 'scores a game'
  end
end
