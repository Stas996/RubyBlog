class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy

  def article
    commentable.is_a?(Article) ? commentable : commentable.article
  end
end
