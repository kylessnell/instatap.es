class MixtapesMailer < ActionMailer::Base
  default from: "mixtapes.yo@gmail.com"

  def mixtape_delivery(recipient_email, author_name)
    mail(:to => recipient_email, :subject => "#{author_name} made you an Instatape!")
  end
end