class MixtapesMailer < ActionMailer::Base
    default :from => "instatap.es@gmail.com"

    def mixtape_delivery(author_name, recipient_email)
      mail( :to => recipient_email,
      :subject => "#{author_name} has shared an Instatape with you!" )
    end
  end