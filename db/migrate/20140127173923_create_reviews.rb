class CreateReviews < ActiveRecord::Migration
  def change
    create_table(:reviews) do |t|
      # all users
      t.text :user_review
      # hosts only
      t.text :cafe_review

      t.timestamps
    end
  end
end

