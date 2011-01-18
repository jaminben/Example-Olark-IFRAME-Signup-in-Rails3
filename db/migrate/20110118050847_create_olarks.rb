class CreateOlarks < ActiveRecord::Migration
  def self.up
    create_table :olarks do |t|
      t.string :olark_key
      t.string :olark_secret
      t.text :olark_html
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :olarks
  end
end
