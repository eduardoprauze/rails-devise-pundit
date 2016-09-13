module UsersHelper

  def print_self(label)
    colour_name_downcase = label.colour_name.downcase
    return "<span class='label label-#{colour_name_downcase}'>#{label.name}</span>".html_safe
  end
end
