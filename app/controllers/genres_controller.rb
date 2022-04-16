class GenresController < ApplicationController
  before_action :authenticate_user!

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
    @genres = @genre.give_items.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
    render 'edit'
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = '分類情報削除しました'
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
