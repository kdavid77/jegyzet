class Post < ActiveRecord::Base
  default_scope -> {order('created_at DESC') }
  validates :title, presence:true, length: {maximum: 140}
end
