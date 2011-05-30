class Post < ActiveRecord::Base
 has_many :comments
belongs_to :user


def to_params
  "#{self.id} - #{self.title.parameterize}"
end

def recent_commenters
    self.comments.recent(5).includes(:user).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
 end

end

