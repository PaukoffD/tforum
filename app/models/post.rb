class Post < ActiveRecord::Base
 belongs_to :topic
 delegate :forum, :to => :topic
 
 def last_topic_user
 post=Post.find_by(topic_id: topic.id)
 #post=@post.last
 #@post = Post.find_by topic_id: topic.id
 user=User.find(post.user_id)
 user1 = user.name
 return user1
end
end
