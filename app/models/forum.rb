class Forum < ActiveRecord::Base
 has_many :topics, :dependent => :destroy
 has_many :posts,      :through => :topics, :dependent => :destroy
 
 def most_recent_post
  topic = Topic.order("created_at DESC")
 return topic
end

def last_topic
 topics.order(:created_at).last
end

end
