class InvitationsController < Devise::InvitationsController
   
  before_filter :update_sanitized_params, only: :update
   # GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    render :edit, :layout => true
  end

  # PUT /resource/invitation
  def update
    self.resource = resource_class.accept_invitation!(resource_params)

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)

      redirect_to '/login', :alert => "Welcome! Please login with your new password." 
    else
      respond_with_navigational(resource){ render :edit, :layout => true }
    end
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:login, :password, :password_confirmation, :invitation_token)
    end
  end
  private 

  def resource_params
     params.permit(user: [:login, :email, :invitation_token, :password_confirmation, :password])[:user]
   end
end