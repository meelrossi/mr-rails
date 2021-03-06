class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer_username
  layout 'mailer'

  def new_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: I18n.t('rent_subject')
  end
end
