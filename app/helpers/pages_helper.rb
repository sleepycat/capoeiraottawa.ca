module PagesHelper
  def action_links
    #TODO - get the confirm option working here.
    "#{ link_to t('edit'), edit_page_path(@page), class: 'action_link' } #{ button_to(t('destroy'), {controller: "pages", action: "destroy", page: @page.title}, {method: :delete, confirm: "Are you sure?", class: "destroy_button action_link"})} #{link_to t('new'), new_page_path, class: 'action_link'}".html_safe
  end
end
