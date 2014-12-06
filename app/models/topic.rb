class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :topic_categoryships, dependent: :destroy
  has_many :categories, through: :topic_categoryships
  has_many :replies, dependent: :destroy
end
