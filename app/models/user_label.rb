class UserLabel < ActiveRecord::Base
  belongs_to :user
  belongs_to :label

  validates_presence_of :user_id, :label_id
end
