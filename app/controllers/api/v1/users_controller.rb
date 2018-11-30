class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        render json: User.all
    end

    def show
        @jordans_user = current_user
        # render json: @jordans_user, include: [:destinations], status: :accepted
        # render json: @jordans_user, methods: [:visited_destinations, :saved_destinations], status: :accepted
        render json: { 
            user: @jordans_user, 
            visited_destinations: @jordans_user.visited_destinations, 
            saved_destinations: @jordans_user.saved_destinations,
            more_destinations: @jordans_user.more_destinations,
            followers: @jordans_user.followers,
            following: @jordans_user.following,
            more_users: @jordans_user.more_users
        }, status: :accepted
    end

    def show_other_user
        @user = User.find(params[:id])
        render json: {
            user: @user, 
            visited_destinations: @user.visited_destinations, 
            saved_destinations: @user.saved_destinations,
            more_destinations: @user.more_destinations,
            followers: @user.followers,
            following: @user.following,
            more_users: @user.more_users
        }
    end

    def create
        # @user = User.create(user_params)
        @user = User.new(user_params)
        # if @user.valid?
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { 
                user: @user,
                visited_destinations: @user.visited_destinations,
                saved_destinations: @user.saved_destinations,
                more_destinations: @user.more_destinations,
                followers: @user.followers,
                following: @user.following,
                more_users: @user.more_users, 
                token: @token 
            }, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
