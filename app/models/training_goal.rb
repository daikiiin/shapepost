class TrainingGoal < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '体重を減らす' },
    { id: 3, name: '体脂肪を減らす' },
    { id: 4, name: 'BMIを減らす' },
    { id: 5, name: '間食の回数を減らす' },
    { id: 6, name: '掴める脂肪が確実に減ったなと感じたい' },
    { id: 7, name: '痩せた？って聞かれたい' },
    { id: 8, name: 'なんか体が軽くなったと感じたい' },
    { id: 9, name: '美肌になりたい' },
    { id: 10, name: '筋肉質になりたい' },
    { id: 11, name: '服のサイズを気にしなくなりたい' },
    { id: 12, name: 'ちゃんと買う前に栄養成分表示のラベルを見れるようになりたい' },
    { id: 13, name: '上記全てを目標にする' }

  ]

  include ActiveHash::Associations
  has_many :users

end