# Users
module Users
  # OmniauthCallbacksController
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # Find or create a user by google oauth credentials
    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)
      update_user
      set_notice_and_redirect
    end

    private

    def update_user
      @user.update_attribute(:refresh_token, token_from_env)
    end

    def set_notice_and_redirect
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def token_from_env
      oauth = request.env['omniauth.auth']
      if oauth.credentials
        oauth.credentials.refresh_token
      else
        oauth.info.credentials.refresh_token
      end
    end
  end
end
