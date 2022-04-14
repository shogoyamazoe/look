class SentReturnsController < ApplicationController
  before_action :authenticate_user!, except:[:search]

  def index
    @sent_returns = SentReturn.all
  end

  def new
    @sent_return = SentReturn.new
    sent_item_return =  SentItem.find(params[:format])
    @sent_return.sent_item_id = sent_item_return.id
  end

  def create
    @sent_return = SentReturn.new(sent_return_params)

    @sent_return.user_id = current_user.id
    if @sent_return.save!
      redirect_to sent_return_path(@sent_return)
    else
    render 'new'
    end
  end

  def show
    @sent_return = SentReturn.find(params[:id])
    
  end

  def edit
    @sent_return = SentReturn.find(params[:id])
  end

    def update
    @sent_return = SentReturn.find(params[:id])
    if @sent_return.update(sent_return_params)
      redirect_to sent_returns_path(@sent_return)
    else
    render 'edit'
    end
  end

  def destroy
    @sent_return = SentReturn.find(params[:id])
    @sent_return.destroy
    flash[:notice] = 'アイテムを削除しました'
    redirect_to :sent_returns
  end

  def postuser
    @user = current_user
    @sent_returns = @user.sent_returns
  end

  private
  def sent_return_params
    params.require(:sent_return).permit(:sent_item_id, :return_day, :introduction, :product, :price, :genre_id, :image, :user_id)
  end
end
