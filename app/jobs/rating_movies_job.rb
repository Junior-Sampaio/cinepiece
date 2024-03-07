class RatingMoviesJob < ApplicationJob
  queue_as :default
  
  def perform(user_id, scores, movie_ids)
    user = User.find(user_id)
    
    movie_ids.each do |movie_id|
      user_movie = user.user_movies.find_or_initialize_by(movie_id: movie_id)
      user_movie.update(score: scores[movie_id])
    end
  end
end