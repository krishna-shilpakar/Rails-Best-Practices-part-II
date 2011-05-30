class Comment < ActiveRecord::Base
  belongs_to :user
  validates_length_of :text, :minimum => 4
  scope :recent, lambda {|count ||= nil|  order("created_at DESC").limit(count)}
  def commenter_address
    "#{self.user.city},#{self.user.country}"
  end
end

