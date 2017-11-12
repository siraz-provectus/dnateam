class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    user = User.find_for_vkontakte_oauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Добро пожаловать"
      sign_in_and_redirect user
    else
      session["devise.vkontakte_data"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
end