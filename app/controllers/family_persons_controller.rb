class FamilyPersonsController < ApplicationController
 

  def index
    @family_persons = FamilyPerson.all
  end

  def new
    @family_person = FamilyPerson.new
  end

  def create
    @family_person = FamilyPerson.new(family_person_params)
    if @family_person.save!
      redirect_to family_persons_path
    else
    render 'new'
    end
  end

  def show
    @family_person = FamilyPerson.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @family_person = FamilyPerson.find(params[:id])
    @family_person.destroy
    flash[:notice] = '家族情報削除しました'
    redirect_to :family_persons
  end

  def postuser
    @user = current_user
    @family_persons = @user.family_persons
  end

  private
  def family_person_params
    params.require(:family_person).permit(:family_person)
  end


end
