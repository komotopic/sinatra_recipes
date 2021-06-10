class CreateRecipeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |r|
      r.text :title
      r.text :content
      r.integer :user_id
      r.timestamps null: false
    end
  end
end
