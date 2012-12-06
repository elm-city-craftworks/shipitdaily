Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  else
    provider :developer, :fields => [:nickname], :uid_field => :nickname
  end
end
