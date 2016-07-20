class CreateBasicAuthenticationInfos < ActiveRecord::Migration
  def change
    create_table :basic_authentication_infos do |t|
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
