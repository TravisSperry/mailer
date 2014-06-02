namespace :mail do
  desc "Send Monthly Newsletter"
  task monthly_mailer: :environment do
    monthly_mailer
  end

  def monthly_mailer
    @contacts = Contact.where("email_opt_in = ?", true)
    @contacts.each do |contact|
      PonyExpress.monthly_mailer(contact).deliver
    end
  end
end
