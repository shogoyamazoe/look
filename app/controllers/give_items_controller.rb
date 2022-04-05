class GiveItemsController < ApplicationController
  before_action :authenticate_user!, except:[:search]

  def index
    @give_items = GiveItem.all
  end

  def new
    @give_item = GiveItem.new
  end

  def create
    @give_item = GiveItem.new(give_item_params)
    @give_item.user_id = current_user.id  
    if @give_item.save!
      redirect_to give_item_path(@give_item)
    else
    render 'new'
    end
  end

  def show
    @give_item = GiveItem.find(params[:id])
    
  end

  def edit
    @give_item = GiveItem.find(params[:id])
  end

  def update
    @give_item = GiveItem.find(params[:id])
    if @give_item.update(give_item_params)
      redirect_to give_items_path
    else
      render 'new'
    end
  end

  def destroy
    @give_item = GiveItem.find(params[:id])
    @give_item.destroy
    flash[:notice] = 'アイテムを削除しました'
    redirect_to :give_items
  end

  def postuser
    @user = current_user
    @give_items = @user.give_items
  end

  private
  def give_item_params
    params.require(:give_item).permit(:user_id, :give_person_id, :family_person_id, :give_item_id, :give_item_name, :give_day, :reason, :introduction, :product, :price, :genre_id, :image)
  end
end
