class Category < ActiveRecord::Base
  validates :categoryname, presence: true, uniqueness: true
  has_many :subcategories, dependent: :destroy
end
