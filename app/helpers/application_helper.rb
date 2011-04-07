module ApplicationHelper

  def language_switcher
    content_tag :span, :id => "language_switcher" do
      links = ""
      links += link_to image_tag('gb.gif'), url_for(:locale => 'en') unless (I18n.locale.to_s == 'en')
      links += link_to image_tag('br.gif'), url_for(:locale => 'br') unless (I18n.locale.to_s == 'br')
      links.html_safe
    end
  end
end
