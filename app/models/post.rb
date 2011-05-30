class Post < ActiveRecord::Base
  has_many :comments, :counter_cache => true # it requires to add comments_count in post model
  belongs_to :user
  validates_presence_of :title, :text

  def to_params
    "#{self.id} - #{self.title.parameterize}"
  end

  def recent_commenters
    self.comments.recent(5).includes(:user).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
  end

end

