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
            followers: @jordans_user.followers_with_avatar_url,
            following: @jordans_user.following_with_avatar_url,
            more_users: @jordans_user.more_users_with_avatar_url,
            avatar_url: @jordans_user.avatar_url
        }, status: :accepted

        # render json: @jordans_user, 
        #     methods: [:avatar_url, :visited_destinations, :saved_destinations, :more_destinations, :more_users],
        #     include: [
        #         { followers: { methods: [:avatar_url] } },
        #         { following: { methods: [:avatar_url] } }
        #     ], status: :accepted
    end

    def show_other_user
        @user = User.find(params[:id])
        render json: {
            user: @user, 
            visited_destinations: @user.visited_destinations, 
            saved_destinations: @user.saved_destinations,
            more_destinations: @user.more_destinations,
            followers: @user.followers_with_avatar_url,
            following: @user.following_with_avatar_url,
            more_users: @user.more_users_with_avatar_url,
            avatar_url: @user.avatar_url
        }
    end

    def show_other_users_by_username
        @user = User.find_by(username: params[:username])
        if @user
            render json: {
                user: @user, 
                visited_destinations: @user.visited_destinations, 
                saved_destinations: @user.saved_destinations,
                more_destinations: @user.more_destinations,
                followers: @user.followers_with_avatar_url,
                following: @user.following_with_avatar_url,
                more_users: @user.more_users_with_avatar_url,
                avatar_url: @user.avatar_url
            }
        else
            render json: { error: 'Invalid path' }, status: :not_found
        end
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
                followers: @user.followers_with_avatar_url,
                following: @user.following_with_avatar_url,
                more_users: @user.more_users_with_avatar_url,
                token: @token,
                avatar_url: @user.avatar_url
            }, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    def update
        @user = User.find(params[:id])
        @user.avatar.purge
        @user.avatar.attach(user_params[:avatar])
        render json: { avatar_url: url_for(@user.avatar) }
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :avatar)
    end
end
