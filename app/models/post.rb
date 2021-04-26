class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_status

  with_options presence: true do
    validates :name                 
    validates :explain   
    validates :image        
  end
  validates :training_status_id, numericality: { other_than: 1, message:'を選択して下さい' }
end
