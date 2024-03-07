require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is not valid without a title" do
    movie = FactoryBot.build(:movie, title: nil)
    expect(movie).to_not be_valid
  end

  it "is not valid without a director" do
    movie = FactoryBot.build(:movie, director: nil)
    expect(movie).to_not be_valid
  end

  it "is valid with both title and director" do
    movie = FactoryBot.build(:movie)
    expect(movie).to be_valid
  end
end
