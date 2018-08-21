require 'spec_helper'

RSpec.describe Rowling::Scorer do
  it "scores a game" do
    expect(Rowling::Scorer.score("game")).to eq "AWESOME GAME SCORE"
  end
end
