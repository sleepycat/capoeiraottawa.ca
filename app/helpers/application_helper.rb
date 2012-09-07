module ApplicationHelper

  def pages_links
    # XXX - clean this up.
    links = []
    Page.order('sort_order').each do |page|
      links << link_to(page.title.capitalize, page_path(page.title)).html_safe
    end
    links.join('<li>').html_safe
  end

  def action_links_for obj, options = {}
    if current_user
      content_tag :span, :class => "action_links" do
        content = ""
        content += link_to(t('show'), polymorphic_path(obj)) unless options[:show] == false
        content += link_to( t('edit'), edit_polymorphic_path(obj)) if current_user.has_role? :admin
        content += link_to t('destroy'), obj, :confirm => I18n.t('are_you_sure'), :method => :delete if current_user.has_role? :admin
        content.html_safe
      end
    end
  end

  def language_switcher
    content_tag :span, :id => "language_switcher" do
      links = ""
      links += link_to image_tag('fr.png'), url_for(:locale => 'fr') unless (I18n.locale.to_s == 'fr')
      links += link_to image_tag('gb.gif'), url_for(:locale => 'en') unless (I18n.locale.to_s == 'en')
      links += link_to image_tag('br.gif'), url_for(:locale => 'br') unless (I18n.locale.to_s == 'br')
      links.html_safe
    end
  end
end
