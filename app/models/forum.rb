class Forum < ActiveRecord::Base
 has_many :topics, :dependent => :destroy

 
 def most_recent_post
  topic = Topic.order("created_at DESC")
  return topic
end
end
