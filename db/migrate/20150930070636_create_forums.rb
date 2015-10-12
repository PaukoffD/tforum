class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.integer "category_id"
      t.integer "views_count", default: 0
      t.string  "slug"
      t.timestamps null: false
    end
  end
end
