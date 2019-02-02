class AddBlogPostToUserDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_destinations, :blog_post, :string
  end
end
