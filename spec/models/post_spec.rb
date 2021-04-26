require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿内容の保存' do
    context '投稿できる場合' do
      it '全て入力すれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'nicknameが空では投稿できない' do
        @post.name = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Name can't be blank")
      end  
      it '週の運動頻度が空では投稿できない' do
        @post.training_status_id = "1"
        @post.valid?
        expect(@post.errors.full_messages).to include("Training status を選択して下さい")
      end 
      it '画像が空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end 
      it '補足が空では投稿できない' do
        @post.explain = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Explain can't be blank")
      end 
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end