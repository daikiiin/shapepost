require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
       visit unauthenticated_root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
       expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
       visit new_user_registration_path
      # ユーザー情報を入力する
       fill_in 'Nickname', with: @user.nickname
       fill_in 'Email', with: @user.email
       fill_in 'Password', with: @user.password
       fill_in 'Password confirmation', with: @user.password_confirmation
       fill_in 'Height', with: @user.height
       fill_in 'Weight', with: @user.weight
       fill_in 'Age', with: @user.age
       select  "男性", from: 'user[sex_id]'       
       select  "毎日", from: 'user[training_status_id]'       
       select  "16未満（痩せすぎ)", from: 'user[training_goal_id]'       
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
       expect{
        find('input[name="commit"]').click
       }.to change { User.count }.by(1)
      # 投稿表示画面へ遷移したことを確認する
       expect(current_path).to eq(authenticated_root_path)  
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する  
       expect(page).to have_no_content('Sign up')
       expect(page).to have_no_content('Sign in')   
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit unauthenticated_root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: ""
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      fill_in 'Height', with:""
      fill_in 'Weight', with: ""
      fill_in 'Age', with: ""
      select  "--", from: 'user[sex_id]'       
      select  "--", from: 'user[training_status_id]'       
      select  "--", from: 'user[training_goal_id]'  
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
       }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit unauthenticated_root_path
      # 正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 投稿表示画面へ遷移することを確認する
      expect(current_path).to eq(authenticated_root_path)        
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('Sign up')
      expect(page).to have_no_content('Sign in')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit unauthenticated_root_path
      # ユーザー情報を入力する
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
