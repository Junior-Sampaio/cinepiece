require 'csv'
class ImportMoviesJob < ApplicationJob
    queue_as :default
  
    def perform(csv_data)
      csv = CSV.parse(csv_data, headers: true)
      
      csv.each do |row|
        movie = Movie.new(title: row['title'], director: row['director'])
        movie.save
      end
    end
  end
  