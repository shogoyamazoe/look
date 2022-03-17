class GivePersonsController < ApplicationController
 

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
    @user = User.find(params[:id])
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
