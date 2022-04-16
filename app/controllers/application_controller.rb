class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :first_set_search
  before_action :second_set_search

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end 

  def first_set_search
    @first_search = GiveItem.ransack(params[:q])
    @give_items = @first_search.result
  end

  def second_set_search
    @second_search = SentItem.ransack(params[:q])
    @sent_items = @second_search.result
  end

private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
