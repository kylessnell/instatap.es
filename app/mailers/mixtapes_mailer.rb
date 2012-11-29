class MixtapesMailer < ActionMailer::Base
  default from: "mixtapes.yo@gmail.com"

  def mixtape_delivery(recipient_email)
    mail(:to => recipient_email, :subject => "New Mixtape Just For You!")
  end
end