class Label < ActiveRecord::Base
  validates_presence_of :name, :colour
  has_many :user_labels
  has_many :users, through: :user_labels
  validates :name, uniqueness: { scope: :colour, message: " and colour already exist"  }

  COLOURS = {'Default' => 0, 'Primary' => 1, 'Success' => 2, 'Info' => 3, 'Warning' => 4, 'Danger' => 5}

  def colour_name
    COLOURS.key(self.colour.to_i)
  end

end
