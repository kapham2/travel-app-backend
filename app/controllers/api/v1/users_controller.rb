class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def index
        render json: User.all
    end

    def show
        @jordans_user = current_user
        # render json: current_user, include: [:destinations], status: :accepted
        # render json: current_user, methods: [:visited_destinations, :saved_destinations], status: :accepted
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

    def create
        # @user = User.create(user_params)
        @user = User.new(user_params)
        # if @user.valid?
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: @user , token: @token }, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
