Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["facebook"], ENV["facebookSecret"],
  :scope => 'email', :display => 'popup'
  provider :twitter, ENV["twitterAPI"], ENV["twitterSecret"]
end
