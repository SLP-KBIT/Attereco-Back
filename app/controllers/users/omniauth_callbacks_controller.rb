class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkus
    @user = User.find_for_linkus(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'linkus'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.linkus_data'] = request.env['omniauth.auth']
      redirect_to new_user_session_url, alert: @user.errors
    end
  end
end
