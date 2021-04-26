FactoryBot.define do
  factory :post do
    name                        {"テスト"}
    explain                     {"テストの説明文を記述する。"}
    training_status_id          {2}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/image/test_imageのコピー.png'), filename: 'test_imageのコピー.png')
    end
  end
end
