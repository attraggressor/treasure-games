class PlayerMailer < ActionMailer::Base
  default from: "findmegently@gmail.com"

  def treasure_notice(email, location)
    @content = "Hey, you’ve found a treasure, congratulations!
    Location of the treasure: #{location[0]} N, #{location[1]} E"
    mail(to: email, subject: 'Treasure Games')
  end
end
