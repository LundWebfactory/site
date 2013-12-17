class Subcategory < ActiveRecord::Base
  validates :subcategoryname, presence: true, uniqueness: true
  belongs_to :categories
end
