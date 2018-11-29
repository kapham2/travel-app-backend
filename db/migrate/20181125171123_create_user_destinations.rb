class CreateUserDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_destinations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :destination, foreign_key: true
      t.boolean :visited

      t.timestamps
    end
  end
end
