class RateMoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    rate_movie_params = params.permit(score: {}, movie_ids: [])
    scores = rate_movie_params[:score]
    movie_ids = rate_movie_params[:movie_ids].reject(&:blank?)
    user_id = current_user.id
    
    RatingMoviesJob.perform_later(user_id, scores, movie_ids)
    
    redirect_to movies_path, notice: "Movies rated successfully."
  end

  def update
    @user_movie = current_user.user_movies.find_by(movie_id: params[:user_movie][:movie_id])
    
    if @user_movie.update(score: params[:user_movie][:score])
      redirect_to movies_path, notice: "Rating updated successfully."
    else
      redirect_to movies_path, alert: "Failed to update rating."
    end
  end

  def rate_several_movies
    @movies = Movie.all
  end

  private

  def rate_movie_params
    params.permit(score: {}, movie_ids: [])
  end
end