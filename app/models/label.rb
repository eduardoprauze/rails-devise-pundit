class Label < ActiveRecord::Base
  validates_presence_of :name, :colour

  COLOURS = {'Default' => 0, 'Primary' => 1, 'Success' => 2, 'Info' => 3, 'Warning' => 4, 'Danger' => 5}

  def colour_name
    COLOURS.key(self.colour.to_i)
  end

end
