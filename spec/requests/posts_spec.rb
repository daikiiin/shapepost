# require 'rails_helper'
# describe PostsController, type: :request do

#   before do
#     @post = FactoryBot.create(:post)
#   end

#   describe 'GET #index' do
#     it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
#       get authenticated_root_path
#       expect(response.status).to eq 200
#     end
#     it 'indexアクションにリクエストするとレスポンスに投稿済みの名前が存在する' do 
#       get authenticated_root_path
#       expect(response.body).to include(@post.)
#     end
#     it 'indexアクションにリクエストするとレスポンスに投稿済みの画像URLが存在する' do 
#     end
#   end
# end