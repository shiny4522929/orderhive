#  # frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :user_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

#   # GET /resource/sign_up
  def new
    super
  end

#   # POST /resource
  def create
    @user = User.new(user_params) 
    if @user.save   
      flash[:notice] = 'sign up successfully!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to sign up!'   
      render :new   
    end   
  end 

  # def edit
  #   super
  # end

#   # PUT /resource
  def update
    # @user = User.find(params[:id])
    # @user.update!(configure_account_update_params)
    # render json: @user
    super
  end

#   # DELETE /resource
  # def destroy
  #   super
  # end
  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :phone_number, :department_id)
  end
end

