class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer  "forum_id"
      t.integer  "user_id"
      t.string   "subject"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "locked",       default: false,            null: false
      t.boolean  "pinned",       default: false
      t.boolean  "hidden",       default: false
      t.datetime "last_post_at"
      t.string   "state",        default: "pending_review"
      t.integer  "views_count",  default: 0
      t.string   "slug"
      t.timestamps null: false
    end
  end
end
