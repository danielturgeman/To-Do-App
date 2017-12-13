class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :login_token
      t.datetime :token_generated_at

      t.timestamps
    end
    add_index :accounts, :email, unique: true
  end
end
