class SentPersonsController < ApplicationController
  before_action :authenticate_user!, except:[:search]
  
  def index
    @sent_persons = SentPerson.all
  end

  def new
    @sent_person = SentPerson.new
  end

  def create
    @sent_person = SentPerson.new(sent_person_params)
    if @sent_person.save!
      redirect_to sent_persons_path
    else
    render 'new'
    end
  end

  def show
    @sent_person = SentPerson.find(params[:id])
    @sent_persons = @sent_person.sent_items.all
  end

  def edit
    @sent_person = SentPerson.find(params[:id])
  end

  def update
    @sent_person = SentPerson.find(params[:id])
    if @sent_person.update(sent_person_params)
      redirect_to sent_persons_path
    else
    render 'edit'
    end
  end
  
  def destroy
    @sent_person = SentPerson.find(params[:id])
    @sent_person.destroy
    flash[:notice] = 'あげた人情報削除しました'
    redirect_to :sent_persons
  end

  def postuser
    @user = current_user
    @sent_persons = @user.sent_persons
  end

  private
  def sent_person_params
    params.require(:sent_person).permit(:sent_person, :involvement)
  end
end