class CreateRepresentatives < ActiveRecord::Migration[5.1]
  def change

    create_table :representatives do |t|
      t.string :name
      t.string :party
      t.string :office
      t.integer :money
      t.string :cid
    end

  end
end
