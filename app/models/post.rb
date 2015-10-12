class Post < ActiveRecord::Base
 belongs_to :topic
 delegate :forum, :to => :topic
end
