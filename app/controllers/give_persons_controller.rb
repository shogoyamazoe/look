class GivePersonsController < ApplicationController
  before_action :authenticate_user!, except:[:search]

  def index
    @give_persons = GivePerson.all
  end

  def new
    @give_person = GivePerson.new
  end

  def create
    @give_person = GivePerson.new(give_person_params)
    if @give_person.save!
      redirect_to give_persons_path
    else
    render 'new'
    end
  end

  def show
    @give_person = GivePerson.find(params[:id])
    @give_persons = @give_person.give_items.all
  end

   def edit
    @give_person = GivePerson.find(params[:id])
  end

    def update
    @give_person = GivePerson.find(params[:id])
    if @give_person.update(give_person_params)
      redirect_to give_persons_path
    else
    render 'new'
    end
  end
  
  def destroy
    @give_person = GivePerson.find(params[:id])
    @give_person.destroy
    flash[:notice] = 'くれた人情報削除しました'
    redirect_to :give_persons
  end

  def postuser
    @user = current_user
    @give_persons = @user.give_persons
  end

  private
  def give_person_params
    params.require(:give_person).permit(:give_person, :involvement)
  end
end
