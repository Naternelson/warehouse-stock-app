class UsersController < ApplicationController 
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create user_params 
        if @user && @user.valid?
            token = encode_token(user_id: @user.id)
            render json: { @user: UserSerializer.new(@user), jwt: token }, status: :created
        else 
            render json: { error: 'failed to create user', messages: @user.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        id = current_user.id
        current_user.destroy 
        if !current_user do 
            render json: { messages: ["User with an id of #{id} successfully deleleted from the database"]}
        else 
            render json: { errors: current_user.errors.full_messages}
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password, :password_confirmation)
    end
end
