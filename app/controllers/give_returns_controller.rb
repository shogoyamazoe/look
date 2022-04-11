class GiveReturnsController < ApplicationController
  before_action :authenticate_user!, except:[:search]

  def index
    @give_returns = GiveReturn.all
  end

  def new
    @give_return = GiveReturn.new
    give_item_return =  GiveItem.find(params[:format])
    @give_return.give_item_id = give_item_return.id
  end

  def create
    @give_return = GiveReturn.new(give_return_params)
    @give_return.user_id = current_user.id
    if @give_return.save!
      redirect_to give_return_path(@give_return)
    else
    render 'new'
    end
  end

  def show
    @give_return = GiveReturn.find(params[:id])
  end

  def index_show
    @give_returns = GiveReturn.all
  end

  def edit
    @give_return = GiveReturn.find(params[:id])
  end

  def destroy
    @give_return = GiveReturn.find(params[:id])
    @give_return.destroy
    flash[:notice] = 'アイテムを削除しました'
    redirect_to :give_returns
  end

  def postuser
    @user = current_user
    @give_returns = @user.give_returns
  end

  private
  def give_return_params
    params.require(:give_return).permit(:give_item_id, :return_day, :introduction, :product, :price, :genre_id, :image, :user_id)
  end
end
