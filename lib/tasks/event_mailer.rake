namespace :mail do
  desc "Send Event Mailer"
  task event_email: :environment do
    emails = %w(
      director@mathplusacademy.com
      bonnie@advancedreading.com
      Marci.ryan@campmaryorton.org
      rosemary.wallace@campmaryorton.org
      alyssa_king@columbusacademy.org
      susie.underwood@cmaohio.org
      chahn@sinoabc.biz
      mupchurch@columbusschoolforgirls.org
      cbandy@columbusschoolforgirls.org
      ohn@genevahills.com
      agreenwood@genevahills.com
      aboyd@audubon.orgsjervey@audubon.org
      pcrozier@jacols.org
      dgilley@kidscreativestudio.com
      naballetco@aol.com
      dwharton@naparks.org
      summer@ctd.northwestern.edu
      info@theknowingplace.com
      k-broekemeier@onu.edu
      spot@purpledogart.com
      megbrown@thurberhouse.org
      caroccos@gmail.com
      BrightMindsAcademy@Columbus.rr.com
      rleone@ywcacolumbus.org
      )

    emails.each do |email|
      PonyExpress.event_email(email).deliver
    end
  end
end