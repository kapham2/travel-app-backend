class Destination < ApplicationRecord
    has_many :user_destinations
    has_many :users, through: :user_destinations

    def users_visited
        self.user_destinations.where(visited: true).map do |visited_destination|
            visited_destination.user
        end
    end

    def users_saved
        self.user_destinations.where(visited: false).map do |visited_destination|
            visited_destination.user
        end
    end
end
