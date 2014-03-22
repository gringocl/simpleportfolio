class ContactMailer < ActionMailer::Base
  default to: "milesstarkenburg@gmail.com"

  def contact_message message
    @message = message
    mail(subject: "[GRINGO.IO] #{message.subject}")
  end

end
