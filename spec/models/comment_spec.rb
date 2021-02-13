require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do #beforeの後に共通している部分を前もって定義しておく
    @comment = FactoryBot.build(:comment)
  end

  it 'textカラムが空の場合コメントは保存できない' do
    @comment.text = ''
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Text can't be blank")
  end

  it 'ユーザーが紐付いていないとコメントは保存できない' do
    @comment.user = nil #nilは存在しないという意味　つまり紐付いていない
    @comment.valid?
    expect(@comment.errors.full_messages).to include("User must exist")
   end
 
   it 'ツイートが紐付いていないとコメントは保存できない' do
    @comment.tweet = nil #nilは存在しないという意味　つまり紐付いていない
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Tweet must exist")
   end
end
