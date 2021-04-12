class TrainingStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '毎日' },
    { id: 3, name: '週に５日以上' },
    { id: 4, name: '週に３〜４日' },
    { id: 5, name: '週に１〜２日' },
    { id: 6, name: '全くしなかった' },
    { id: 7, name: '運動・スポーツはしたが頻度がわからない' }
  ]

  include ActiveHash::Associations
  has_many :posts
  has_many :users

end