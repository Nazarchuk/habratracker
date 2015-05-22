class Post < ActiveRecord::Base
  validates :href, uniqueness: true
  validates :title, uniqueness: true
end
