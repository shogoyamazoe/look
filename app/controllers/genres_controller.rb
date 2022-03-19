class GenresController < ApplicationController
 

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save!
      redirect_to genres_path
    else
    render 'new'
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = '家族情報削除しました'
    redirect_to :genres
  end

  def postuser
    @user = current_user
    @genres = @user.genres
  end

  private
  def genre_params
    params.require(:genre).permit(:genre)
  end



end
