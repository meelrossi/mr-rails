class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@training.wolox.com.ar'
  layout 'mailer'

  def new_rent_notification(rent)
    @rent = rent
    I18n.with_locale(rent.user.locale) do
      mail to: rent.user.email, subject: I18n.t('rent_subject')
    end
  end
end
