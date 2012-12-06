class MixtapesMailer < ActionMailer::Base
  default from: "mixtapes.yo@gmail.com"

  def mixtape_delivery(recipient_email, author_name)
    @recipient_name = params[:recipient_name]
    @author_name = params[:author_name]
    @recipient_email = params[:recipient_email]
    @mixtape = Mixtape.find_by_url(params[:url])
    mail(:to => recipient_email, :subject => "#{author_name} made you an Instatape!")
  end
end