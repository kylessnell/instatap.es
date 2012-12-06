# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :user_name            => "mixtapes.yo",
#   :password             => "testies1234",
#   :authentication       => "plain",
#   :enable_starttls_auto => true
# }

# ActionMailer::Base.default_url_options[:host] = "localhost:3000"

#ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?


ActionMailer::Base.smtp_settings = {
     :authentication => :plain,
     :address => "smtp.mailgun.org",
     :port => 587,
     :domain => "instap.es.mailgun.org",
     :user_name => "postmaster@instap.es.mailgun.org",
     :password => "phattrax"
}