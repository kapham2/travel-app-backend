class Destination < ApplicationRecord
    has_many :user_destinations
    has_many :users, through: :user_destinations
    
    def users_visited_with_avatar
        users_visited = self.user_destinations.where(visited: true).map do |visited_destination|
            visited_destination.user
        end
        
        users_visited.map do |user|
            new_user = user.attributes
            new_user["avatar_url"] = user.avatar_url
            new_user
        end
    end
    
    def users_saved_with_avatar
        users_saved = self.user_destinations.where(visited: false).map do |visited_destination|
            new_user = visited_destination.user
        end
        
        users_saved.map do |user|
            new_user = user.attributes
            new_user["avatar_url"] = user.avatar_url
            new_user
        end
    end

    def photo_url
        "/destinations/#{self.city.downcase.split(" ").join}.jpg"
    end
end
