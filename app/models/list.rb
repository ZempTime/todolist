# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class List < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  has_many :tasks
  
end
