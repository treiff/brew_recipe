module ApplicationHelper
  # Return full title on per-page basis.
  def full_title(page_title)
    base_title = "Brew Blog"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Return url for users avatar if available
  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      gravatar_id = Digest::MD5::hexdigest(user.email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
  end
end
