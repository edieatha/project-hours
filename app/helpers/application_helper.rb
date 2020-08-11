module ApplicationHelper
  def header_links
    if logged_in?
      link_to 'Home', current_user, class: 'text-white'
    end
  end
end
