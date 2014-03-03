namespace :mail do
  desc "Send Event Mailer"
  task event_email: :environment do
    emails = %w(
      educlass@columbuszoo.org
      lbareclay@yahoo.com
      continuinged@ccad.edu
      info@granvillerex.org
      arts@mcconnellarts.org
      arkow.1@napls.us
      info@fpconservatory.org
      cfallon@maginificentmanners.com
      info@attheworks.org
      dance@balletmet.org
      chris@christianhowes.com
      info@ohionature.org
      al@canoecreation.org
      suziemuzic@gmail.com
      information@thewilds.org
      )

    emails.each do |email|
      PonyExpress.event_email(email).deliver
    end
  end
end