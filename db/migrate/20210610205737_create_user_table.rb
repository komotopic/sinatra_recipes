class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.text :user_name
      u.text :email

    end
  end
end
