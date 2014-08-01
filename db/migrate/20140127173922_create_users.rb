class CreateUsers < ActiveRecord::Migration
  # has_many :reviews

  def change
    create_table(:users) do |t|
      # all users
      t.string :username
      t.string :oauth_token
      t.string :oauth_secret

      t.string   :name
      t.string   :email
      t.string   :password_hash
      t.integer  :patron_rating
      t.text     :about_me

      # hosts only
      t.text    :cafe_name
      t.text    :cafe_location
      t.text    :cafe_rating
      t.text    :cafe_about
      t.boolean :outdoor_area, default: false
      t.boolean :smoking_ok,   default: false

      t.timestamps
    end
  end
end
