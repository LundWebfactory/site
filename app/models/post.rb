class Post < ActiveRecord::Base
  belongs_to :users
  default_scope -> { order('created_at DESC') }
  validates :itemname, presence: true
  validates :user_id, presence: true
end
