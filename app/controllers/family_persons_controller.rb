class FamilyPersonsController < ApplicationController
  before_action :authenticate_user!, except:[:search]
  
  def index
    @family_persons = FamilyPerson.all
  end

  def new
    @family_person = FamilyPerson.new
  end

  def create
    @family_person = FamilyPerson.new(family_person_params)
    if @family_person.save
    redirect_to family_persons_path
    flash[:notice] = '家族情報 作成しました'
    else
    render 'new'
    end
  end

  def edit
    @family_person = FamilyPerson.find(params[:id])
  end

  def show
    @family_person = FamilyPerson.find(params[:id])
    @family_persons = @family_person.give_items.all
  end

  def update
    @family_person = FamilyPerson.find(params[:id])
    if @family_person.update(family_person_params)
      redirect_to family_persons_path
      flash[:notice] = '家族情報 更新しました'
    else
    render 'edit'
    end
  end

  def destroy
    @family_person = FamilyPerson.find(params[:id])
    @family_person.destroy
    flash[:notice] = '家族情報 削除しました'
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
