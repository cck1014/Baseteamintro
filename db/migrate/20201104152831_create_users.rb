class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :userid
      t.string :password_digest
      t.string :email
      t.string :teamname

      t.timestamps
    end
  end
end
