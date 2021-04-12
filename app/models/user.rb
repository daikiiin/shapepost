class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :training_status
  belongs_to :training_goal

end
