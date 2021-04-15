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

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  with_options presence: true do
    validates :nickname
    validates :height
    validates :weight
    validates :age
  end
  validates :height, numericality: {greater_than_or_equal_to: 100, less_than_or_equal_to: 1000}, format: { with: /\A[0-9]+\z/}
  validates :weight, numericality: {less_than_or_equal_to: 10000}, format: { with: /\A[0-9]+\z/}
  validates :age, numericality: {less_than_or_equal_to: 200}, format: { with: /\A[0-9]+\z/}
  with_options numericality: { other_than: 1 , message:'を選択して下さい'} do
    validates :sex_id         
    validates :training_status_id      
    validates :training_goal_id   
  end
end
