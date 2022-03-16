class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:search]

  def index
    @items = Item.all  
  end

  def new
    @item = Item.new
  end

  
  def create
    
    @item = Item.new(item_params)
    
    
    #@item.send_user_id = current_user.id  
    if @item.save
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  def show
    
    @item = Item.find(params[:id])
    #if user_signed_in?
    @user = User.find(params[:id])
    #@item.user_id = current_user.id
    #end
    #@postuser = @user.items
    #@reservation = Reservation.new  
   
  end


  def destroy
    @item = item.find(params[:id])
    @item.destroy
    flash[:notice] = "アイテムを削除しました"
    redirect_to :items
  end
 
  def postuser
   @user = current_user
   @items = @user.items
  end
  
  private
  def item_params
    params.require(:item).permit(:registration_date, :reason, :introduction, :item_name, :user_id, :item_price, :item_genre_id, :item_image, give_people_attributes:[:give_person_name] ,
    sent_people_attributes:[:sent_person_name, :_destroy, :id] ) 
  end
end
