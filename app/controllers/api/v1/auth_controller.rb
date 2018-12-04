class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def login
        @user = User.find_by(username: login_params[:username])
        if @user && @user.authenticate(login_params[:password])
            @token = encode_token(user_id: @user.id)
            render json: { 
                user: @user,
                visited_destinations: @user.visited_destinations, 
                saved_destinations: @user.saved_destinations,
                more_destinations: @user.more_destinations,
                followers: @user.followers_with_avatar_url,
                following: @user.following_with_avatar_url,
                more_users: @user.more_users_with_avatar_url,
                token: @token,
                avatar_url: @user.avatar_url
            }, status: :accepted
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def login_params
        params.require(:user).permit(:username, :password)
    end
end
