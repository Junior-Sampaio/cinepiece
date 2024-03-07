require 'csv'

class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created!"
    else
      render :new
    end
  end

  def import
    file_path = Rails.root.join('spec', 'fixtures', 'files', 'movies.csv')
    if File.exist?(file_path)
      File.open(file_path) do |file|
        CSV.foreach(file, headers: true) do |row|
          Movie.create(title: row['title'], director: row['director'])
        end
      end
      redirect_to movies_path, notice: "Successfully imported movies!"
    else
      flash[:alert] = "File not found."
      redirect_to movies_path
    end
  end  
  
  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
