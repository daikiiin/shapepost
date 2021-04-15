class TrainingGoal < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '16未満（痩せすぎ)'},
    { id: 3, name: '16.00〜16.99以下 (痩せ)' },
    { id: 4, name: '17.00〜18.49以下 (痩せぎみ)' },
    { id: 5, name: '18.50〜24.99以下 (普通体重)' },
    { id: 6, name: '25.00〜29.99以下	(前肥満)' },
    { id: 7, name: '30.00〜34.99以下	肥満(1度)' },
    { id: 8, name: '35.00〜39.99以下	肥満(2度)' },
    { id: 9, name: '40.00以上	肥満(3度)' }
  ]

  include ActiveHash::Associations
  has_many :users

end