class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@training.wolox.com.ar'
  layout 'mailer'

  def new_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: 'Felicitaciones! El alquiler se ha realizado con éxito.'
  end
end
