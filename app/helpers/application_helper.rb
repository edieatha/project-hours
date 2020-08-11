module ApplicationHelper
  def header_links
    if logged_in?
      link_to 'Home', current_user, class: 'text-white'
    end
  end
  
  def nav_links
    if logged_in?
      link_to "Log out", logout_path, class: "navbar-text nav-link text-decoration-none nav-item",
                        method: :delete
    else
      link_to "Sign up", signup_path, class: "mx-2 nav-item navbar-text nav-link text-decoration-none"
    end
  end
end
