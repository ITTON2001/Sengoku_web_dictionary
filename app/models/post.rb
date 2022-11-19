class Post < ApplicationRecord
  has_many :edits, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :post_name, {presence: true}
  validates :mini_content, {length: {maximum: 50}}
  validates :content, {presence: true}
  validates :map_id, {presence: true}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
  def edits
    return Edit.where(post_id: self.id)
  end

end
