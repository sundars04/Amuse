# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  link               :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ApplicationRecord
  belongs_to :user

  # Sexy Validations
  validates :title, :presence => true, 
                    :length   => { :minimum => 3 }

  scope :sorted, -> { order("created_at Desc") }
  has_attached_file :image, styles: { medium: "700x500>", small: "350x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
