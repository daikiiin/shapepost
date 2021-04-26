require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_name = Faker::Lorem.sentence
    @post_explain = Faker::Lorem.sentence
  end
  context '投稿ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    sign_in(@user)    
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('Posting Your Body')
    # 投稿ページに移動する
    visit new_post_path
    # フォームに情報を入力する
    fill_in 'post_name', with: @post_name
    select  "毎日", from: 'post[training_status_id]'
    image_path = Rails.root.join('public/image/test_imageのコピー.png')  
    attach_file('post[image]', image_path, make_visible: true)   
    fill_in 'post_explain', with: @post_explain
    # 送信するとPostモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Post.count }.by(1)
    # 投稿表示画面に遷移する
    visit authenticated_root_path
    # 投稿表示画面には先ほど投稿した内容が存在することを確認する（画像）
    expect(page).to have_selector ("img")
    # 投稿表示画面には先ほど投稿した内容が存在することを確認する（名前）
    expect(page).to have_content(@post_name)
    # 投稿表示画面には先ほど投稿した内容が存在することを確認する（説明）
    expect(page).to have_content(@post_explain)
    # 投稿表示画面には先ほど投稿した内容が存在することを確認する（運動頻度）
    expect(page).to have_content("毎日")
    # 投稿表示画面には先ほど投稿した内容が存在することを確認する（投稿時間）
    expect(page).to have_content("投稿日")
  end
end
  context '投稿ができないとき'do
  it 'ログインしていないと新規投稿ページに遷移できない' do
    # トップページに遷移する
    visit new_user_session_path
    # 新規投稿ページへのリンクがない
    expect(page).to have_no_content('投稿する')
  end
 end 
end

RSpec.describe '編集', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context '編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したものの編集ができる' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@post1.user)
      # 投稿1に「編集」ボタンがあることを確認する
      find(".dropdown-toggle").click
      # 編集画面に移動
      find_link("編集", href: edit_post_path(@post1)).click
      # すでに投稿済みの内容がフォームに入っていることを確認する
       expect(
         find('#post_name').value
       ).to eq(@post1.name)
       expect(
          find("option[value='2']").value
        ).to eq("#{@post1.training_status_id}")
        expect(
          find('#post_explain').value
        ).to eq(@post1.explain)   
      # 投稿内容を編集する
      fill_in 'post_name', with: "#{@post1.name}+編集したテキスト"
      fill_in 'post_explain', with: "#{@post1.explain}+編集した"
      # 編集してもPostモデルのカウントは変わらないことを確認する
      expect{
      find('input[name="commit"]').click
      }.to change { Post.count }.by(0)
      # トップページに遷移する
      visit authenticated_root_path
      # トップページには先ほど変更した内容の投稿が存在することを確認する（画像）
      expect(page).to have_selector "img"
      # トップページには先ほど変更した内容の投稿が存在することを確認する（テキスト）
      expect(page).to have_content("#{@post1.name}+編集したテキスト")
      # トップページには先ほど変更した内容の投稿が存在することを確認する（運動頻度）
      expect(page).to have_content("毎日")
      # トップページには先ほど変更した内容の投稿が存在することを確認する（説明）
      expect(page).to have_content("#{@post1.explain}+編集した")
    end
  end
  context '編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したものの編集画面には遷移できない' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@post1.user)
      # 投稿2に「編集」ボタンがないことを確認する
      expect(
        all('.dropdown')[0].hover
      ).to have_no_link '編集', href: edit_post_path(@post2)
    end
    it 'ログインしていないと編集画面には遷移できない' do
      # トップページにいる
      visit unauthenticated_root_path
      expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe '削除', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
  end
  context '削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # 1を投稿したユーザーでログインする
      sign_in(@post1.user)
      # 「削除」ボタンがあることを確認する
      find(".dropdown-toggle").click
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect{
       find_link('削除', href: post_path(@post1)).click
    }.to change { Post.count }.by(-1)
      # トップページに遷移する
      visit authenticated_root_path
      # トップページには1の内容が存在しないことを確認する（画像）
      expect(page).to have_no_selector "img"
      # トップページには1の内容が存在しないことを確認する（テキスト）
      expect(page).to have_no_content("#{@post1.name}")
      # トップページには先ほど変更した内容の投稿が存在することを確認する（運動頻度）
      expect(page).to have_no_content("毎日")
      # トップページには先ほど変更した内容の投稿が存在することを確認する（説明）
      expect(page).to have_no_content("#{@post1.explain}")
    end
  end
end
RSpec.describe '削除', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context '削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したものの削除ができない' do
      # 投稿したユーザーでログインする
      sign_in(@post1.user)
      # 投稿2に「削除」ボタンが無いことを確認する
      expect(
        all('.dropdown')[0].hover
      ).to have_no_link '削除', href: post_path(@post2)
    end
    it 'ログインしていないと削除ボタンがない' do
      # トップページに移動する
      visit unauthenticated_root_path
      expect(page).to have_no_content('削除')
    end
  end
end

RSpec.describe '詳細', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  it 'ログインしたユーザーは詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@post.user)
    # 詳細画面に移動
    find_link("詳細ページ", href: post_path(@post)).click
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_selector "img"
    expect(page).to have_content("#{@post.name}")
    expect(page).to have_content("#{@post.explain}")
    expect(page).to have_content("毎日")
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態では詳細ページに遷移できない' do
    # トップページに移動する
    visit unauthenticated_root_path
    expect(page).to have_no_content('詳細ページ')
  end
end
RSpec.describe 'マイページ', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  it 'ログインしたユーザーは詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@post.user)
    # 詳細画面に移動
    find(".detail1").click
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_selector "img"
    expect(page).to have_content("#{@post.name}")
    expect(page).to have_content("#{@post.explain}")
    expect(page).to have_content("毎日")
  end
  it 'ログインしていない状態では詳細ページに遷移できない' do
    # トップページに移動する
    visit unauthenticated_root_path
    expect(page).to have_no_content('view mypage')
  end
end