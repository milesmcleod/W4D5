module ApplicationHelper

  def auth_token
    token = "<input type=\"hidden\" name=\"authenticity_token\" value=\""
    token += form_authenticity_token
    token += "\">"
    token.html_safe
  end

  def ugly_lyrics(lyrics)
    array = lyrics.split(". ")
    html = "<pre>"
    array.each do |row|
      html << " &#9835 #{h(row.downcase)}\n\n"
    end
    html << "</pre>"
    html.html_safe
  end


end
