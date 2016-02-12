class RegistrationsController < Devise::RegistrationsController
  include KeyUtilities
  after_filter :add_api_key, :only => :create

  # use defaults from devise
  def new; super; end
  def edit; super; end
  def create
    # flash[:error] = "You may not sign up without an invitation from the admin!"
    redirect_to new_user_registration_path, :alert => "You may not sign up without an invitation from the admin!"
  end

  private

    # adds an api key to the new user
    def add_api_key
      @user = current_user
      if @user.present?
        @user.api_key = generate_api_key(16, 'user')
        @user.save
      end
    end

end

