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

    def more_users
        User.all.to_a.select do |user|
            !self.following.to_a.include?(user) && user != self
        end
    end

end
