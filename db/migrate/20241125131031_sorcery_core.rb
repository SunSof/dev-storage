class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")
    create_table :users, id: :uuid, default: "gen_random_uuid()" do |t|
      t.integer :role, null: false, default: 0
      t.string :email, null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end
  end
end
