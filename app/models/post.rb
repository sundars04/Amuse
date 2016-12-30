# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  link        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Post < ApplicationRecord
  belongs_to :user

  # Sexy Validations
  validates :title, :presence => true, 
                    :length   => { :minimum => 3 }
  scope :sorted, -> { order("created_at Desc") }
end
