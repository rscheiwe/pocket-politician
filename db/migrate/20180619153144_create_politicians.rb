class CreatePoliticians < ActiveRecord::Migration[5.1]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :party # :in => %w(d r D R)
      t.string :office
      t.string :gender # :in => %w(m f M F)
      t.string :cid
    end
  end
end
