class ContactMailer < ActionMailer::Base
  default to: "milesstarkenburg@gmail.com"
  default from: "donotreply@gringo.io"

  def contact_message message
    @message = message
    mail(subject: "[GRINGO.IO] #{message.subject}")
  end

end
