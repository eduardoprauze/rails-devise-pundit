class UserLabel < ActiveRecord::Base
  belongs_to :user
  belongs_to :label
end
