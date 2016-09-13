module LabelsHelper

  def print_self(label)
    colour_name_downcase = label.colour_name.downcase
    return "<span class='label label-#{colour_name_downcase}'>#{label.name}</span>".html_safe
  end

  def hexa_color(type)
    case type
    when "Default"
      "#777777"
    when "Primary"
      "#337AB7"
    when "Success"
      "#5CB85C"
    when "Info"
      "#5BC0DE"
    when "Warning"
      "#F0AD4E"
    when "Danger"
      "#D9534F"
    else
      "#777777"
    end
  end
end
