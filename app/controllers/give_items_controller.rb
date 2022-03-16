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
    if @give_item.save
      redirect_to give_item_path(@give_item)
    else
    render 'new'
    end
  end

  def show
    @give_item = GiveItem.find(params[:id])
    @user = User.find(params[:id])
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
    params.require(:give_item).permit(:registration_date, :reason, :introduction, :give_item_name, :user_id, :give_item_price, :give_item_genre_id, :give_item_image, give_people_attributes:[:give_person_name] ,
    sent_people_attributes:[:sent_person_name, :_destroy,:id]) 
  end
end
