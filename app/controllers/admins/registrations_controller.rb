# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!
  before_action :configure_account_update_params, only: [:update, :profile_edit, :profile_update]
  before_action :configure_permitted_parameters, if: :devise_controller?


  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
   def edit
     super
     #@admin=Admin.find(params[:id])
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end
   
   
  def profile_edit
   
  end
   
  def profile_update
    current_admin.assign_attributes(account_update_params)
    current_admin.avator.attach(account_update_params[:avator])
    if current_admin.save
    flash[:success]= 'プロフィールを更新しました'
    	redirect_to admin_url(current_admin.id)
    else 
     render "profile-edit"
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admins_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avotor])
  end
  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:admins_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:avator])
     devise_parameter_sanitizer.permit(:account_update, keys: [:admin_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:introduction1])
     devise_parameter_sanitizer.permit(:account_update, keys: [:introduction2])
     devise_parameter_sanitizer.permit(:account_update, keys: [:admins_category])
     devise_parameter_sanitizer.permit(:account_update, keys: [:facility_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:homeadress])
     devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
     devise_parameter_sanitizer.permit(:account_update, keys: [:open])
     devise_parameter_sanitizer.permit(:account_update, keys: [:close])
     devise_parameter_sanitizer.permit(:account_update, keys: [:supplementary_info])
     devise_parameter_sanitizer.permit(:account_update, keys: [:prefecture_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:cityname])
   end
  
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  def after_sign_up_path_for(resource)
    admin_path(current_admin.id)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
