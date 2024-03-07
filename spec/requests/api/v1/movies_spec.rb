require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  describe "POST /movies/import" do
    it "imports movies from CSV file" do
      allow_any_instance_of(MoviesController).to receive(:authenticate_user!).and_return(nil)

      file = fixture_file_upload('movies.csv', 'text/csv') 
      expect {
        post "/movies/import", params: { file: file }
      }.to change(Movie, :count).by(2)

      allow_any_instance_of(MoviesController).to receive(:authenticate_user!).and_call_original
    end
  end
end
  

