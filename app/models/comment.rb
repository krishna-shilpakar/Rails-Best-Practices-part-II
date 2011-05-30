class Comment < ActiveRecord::Base
  belongs_to :user

  validates_length_of :text, :minimum => 4
  def commenter_address
    "#{self.user.address.city},#{self.user.address.country}"
  end

  def self.recent(count)
    order("created_at DESC").limit(count)
  end

  end
end

