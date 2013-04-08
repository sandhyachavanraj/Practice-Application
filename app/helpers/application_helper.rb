module ApplicationHelper
	def avatar_url(profile)
		gravatar_id = Digest::MD5.hexdigest(profile.user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png"
	end

  def sortable(column, title = nil)
    title ||= column.titleize
#    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}#, {:class => css_class}
  end
end
