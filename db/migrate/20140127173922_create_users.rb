class CreateUsers < ActiveRecord::Migration
  has_many :reviews

  def change
    create_table(:users) do |t|
      # all users
      t.string   :name
      t.string   :email
      t.string   :password_hash
      t.integer  :patron_rating
      t.text     :about_me

      # hosts only
      t.text :cafe_location
      t.text :cafe_rating
      t.text :cafe_about

      t.timestamps
    end
  end
end
