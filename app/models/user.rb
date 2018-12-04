include Rails.application.routes.url_helpers
Rails.application.routes.default_url_options[:host] = 'localhost:3333'
class User < ApplicationRecord
    has_many :user_destinations
    has_many :destinations, through: :user_destinations
    has_secure_password
    has_many :follower_relationships, foreign_key: :following_id, class_name: "Follow"#, dependent: :destroy
    has_many :followers, through: :follower_relationships, source: :follower
    has_many :following_relationships, foreign_key: :follower_id, class_name: "Follow"#, dependent: :destroy
    has_many :following, through: :following_relationships, source: :following
    has_one_attached :avatar
    validates :username, :password, presence: true
    validates :username, uniqueness: { case_sensitive: false }

    def visited_destinations
        self.user_destinations.where(visited: true).map do |visited_destination|
            visited_destination.destination
        end
    end

    def saved_destinations
        self.user_destinations.where(visited: false).map do |visited_destination|
            visited_destination.destination
        end
    end

    def more_destinations
        Destination.all.to_a.select do |destination|
            !self.destinations.to_a.include?(destination)
        end
    end

    def followers_with_avatar_url
        self.followers.map do |user|
            new_user = user.attributes
            new_user["avatar_url"] = avatar_url_for(user)
            new_user
        end
    end

    def following_with_avatar_url
        self.following.map do |user|
            new_user = user.attributes
            new_user["avatar_url"] = avatar_url_for(user)
            new_user
        end
    end

    def more_users_with_avatar_url
        more_users = User.all.to_a.select do |user|
            !self.following.to_a.include?(user) && user != self
        end

        more_users.map do |user|
            new_user = user.attributes
            new_user["avatar_url"] = avatar_url_for(user)
            new_user
        end

    end

    def avatar_url_for(user)
        if (user.avatar.attached?)
            url_for(user.avatar)
        else
            "/users/dog#{user.id % 10}.jpg"
        end
    end

    def avatar_url
        if (self.avatar.attached?)
            url_for(self.avatar)
        else
            "/users/dog#{self.id % 10}.jpg"
        end
    end        
end
