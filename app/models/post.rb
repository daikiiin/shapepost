class Post < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_status

  with_options presence: true do
    validates :name                 
    validates :explain   
    validates :image        
  end
  validates :training_status_id, numericality: { other_than: 1 }
end
