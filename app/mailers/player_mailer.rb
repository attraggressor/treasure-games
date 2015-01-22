class PlayerMailer < ActionMailer::Base
  default from: "findmegently@gmail.com"

  def treasure_notice(email)
    @content = "Hey, you’ve found a treasure, congratulations!"
    mail(to: email, subject: 'Treasure Games')
  end
end
