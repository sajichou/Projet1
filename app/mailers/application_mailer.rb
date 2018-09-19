class ApplicationMailer < ActionMailer::Base
  #default from: 'contact@lakamaraderie.fr'
  default from: "TopNote <contact@topnote.fr>"
  #add_template_helper(EmailHelper)
  layout 'mailer'
end
