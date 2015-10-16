class Topic < ActiveRecord::Base
 belongs_to :forum
has_many :posts, :dependent => :destroy
accepts_nested_attributes_for :posts

self.per_page = 15
end
