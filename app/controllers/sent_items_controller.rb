class SentItemsController < ApplicationController
  before_action :authenticate_user!, except:[:search]

  def index
    @sent_items = SentItem.all
  end

  def new
    @sent_item = SentItem.new
  end

  def create
    @sent_item = SentItem.new(sent_item_params)
    @sent_item.user_id = current_user.id  
    if @sent_item.save!
      redirect_to sent_item_path(@sent_item)
    else
    render 'new'
    end
  end

  def show
    @sent_item = SentItem.find(params[:id])
    
  end

  def edit
    @sent_item = SentItem.find(params[:id])
  end

  def update
    @sent_item = SentItem.find(params[:id])
    if @sent_item.update(sent_item_params)
      redirect_to sent_items_path
    else
      render 'new'
    end
  end
  
  def destroy
    @sent_item = SentItem.find(params[:id])
    @sent_item.destroy
    flash[:notice] = 'アイテムを削除しました'
    redirect_to :sent_items
  end

  private
  def sent_item_params
    params.require(:sent_item).permit(:user_id, :sent_person_id, :family_person_id, :sent_day, :reason, :introduction, :product, :price, :genre_id, :image)
  end
end