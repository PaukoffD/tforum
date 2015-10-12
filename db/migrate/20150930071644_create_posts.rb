class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
     t.integer  "topic_id"
     t.text     "text"
     t.integer  "user_id"
     t.datetime "created_at"
     t.datetime "updated_at"
     t.integer  "reply_to_id"
     t.string   "state",       default: "pending_review"
     t.boolean  "notified",    default: false
     t.timestamps null: false
    end
  end
end
