class User < ApplicationRecord
  has_many :edits, dependent: :destroy

  #nameカラムが空白の時、登録をブロックする
  validates:name,{presence: true}
  #emailカラムが空白の時と重複した時に登録をブロックする
  validates:email,{presence: true, uniqueness: true}
  #passworカラムが空白の時、登録をブロックする
  validates:password,{presence: true}

  def posts
    return Post.where(user_id: self.id)
  end
  def edits
    return Edit.where(editer_id: self.id)
  end

end
