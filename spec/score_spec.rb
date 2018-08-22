require 'spec_helper'

RSpec.describe Rowling::Score do
  describe '.parse' do
    let(:game_file_path) { fixture_path('sample_game.txt') }
    let(:expected_game_hash) { YAML.load_file fixture_path('sample_game_hash.yaml') }

    it 'parses a game' do
      game_hash = Rowling::Score.parse(game_file_path)

      expect(game_hash).to eq expected_game_hash
    end
  end

  describe '.score' do
    let(:game_hash) { YAML.load_file fixture_path('sample_game_hash.yaml') }
    let(:expected_game_score) { YAML.load_file fixture_path('sample_game_score.yaml') }

    it 'scores a game' do
      game_score = Rowling::Score.score(game_hash)

      expect(game_score).to eq expected_game_score
    end
  end
end
