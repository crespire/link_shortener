class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :fullUrl
      t.string :name
      t.string :slug, unique: true

      t.timestamps

    end
  end
end
