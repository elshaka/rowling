require 'spec_helper'

RSpec.describe Rowling::Parser do
  it "parses a game" do
    expect(Rowling::Parser.parse("something")).to eq "AWESOME PARSED GAME"
  end
end
