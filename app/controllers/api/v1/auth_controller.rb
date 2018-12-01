class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def login
        @user = User.find_by(username: login_params[:username])
        if @user && @user.authenticate(login_params[:password])
            @token = encode_token(user_id: @user.id)
            if (@user.avatar.attached?)
                render json: { 
                    user: @user,
                    visited_destinations: @user.visited_destinations, 
                    saved_destinations: @user.saved_destinations,
                    more_destinations: @user.more_destinations,
                    followers: @user.followers,
                    following: @user.following,
                    more_users: @user.more_users,
                    token: @token,
                    avatar_url: url_for(@user.avatar)
                }, status: :accepted
            else
                render json: { 
                    user: @user, 
                    visited_destinations: @user.visited_destinations, 
                    saved_destinations: @user.saved_destinations,
                    more_destinations: @user.more_destinations,
                    followers: @user.followers,
                    following: @user.following,
                    more_users: @user.more_users,
                    token: @token
                }, status: :accepted
            end
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def login_params
        params.require(:user).permit(:username, :password)
    end
end
