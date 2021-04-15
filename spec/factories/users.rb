FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    height                {"160"}
    weight                {"80"}
    age                   {"30"}
    sex_id                {2}
    training_status_id    {2}
    training_goal_id      {2}
  end
end