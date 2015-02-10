module UsersHelper
  # returns Gravatar for a given User
  def gravatar_for(user, options = { size: 80 })
    gravatar_md5 = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_md5}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
