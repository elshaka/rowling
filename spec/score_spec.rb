require 'spec_helper'

RSpec.describe Rowling::Score do
  describe '.parse' do
    it "parses a game file" do
      expect(Rowling::Score.parse("gamefile")).to eq "AWESOME PARSED GAME"
    end
  end

  describe '.score' do
    it "scores a game" do
      expect(Rowling::Score.score("game")).to eq "AWESOME GAME SCORE"
    end
  end
end
