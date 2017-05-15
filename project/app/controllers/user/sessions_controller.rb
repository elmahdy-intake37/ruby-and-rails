class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  # def update
  #    id = params[:id].to_i
  #    session[:id] = User::ROLES.has_key?(id) ? id : 0
  #    flash[:success] = "Your new role #{User::ROLES[id]} was set!"
  #    redirect_to root_path
  #  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
