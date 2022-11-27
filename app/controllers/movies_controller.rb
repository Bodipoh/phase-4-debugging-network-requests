class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movies = Movie.create(movies_params)
    render json: movies, status: :created
  end

  def update
    movies = Movie.find_by(id: params[:id])
    movies.update(movies_params)
     render json: movies, status: :accepted
  end

  def destroy
    movies = Movie.find_by(id: params[:id])
    movies.destroy
    head :no_content
  end


  private
  
  def movies_params
    params.permit(:name, :image, :likes)
  end

end
