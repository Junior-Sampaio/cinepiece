class Movie < ApplicationRecord
  validates :title, presence: true
  validates :director, presence: true

  has_many :user_movies
  has_many :users, through: :user_movies

  def average_score
    user_movies.average(:score).to_f
  end
end
