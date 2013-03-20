module ApplicationHelper
	def avatar_url(profile)
		gravatar_id = Digest::MD5.hexdigest(profile.user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png"
	end
end
