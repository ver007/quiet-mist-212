class Usermailer < ActionMailer::Base
  default from: "info@campusmachine.com"
  
  def test_mail(user)
    @user=user
    mail(:to => user.email, :subject => "Book reserve request")
  end

  def reserve_notify(bo)
  	@user = bo.user
    mail(:to => bo.user.email, :subject => "Book reserve request")
    # TODO: don't use attachments- that probably makes deliverability worse
    attachments["machinelogo2.jpg"]=File.read("#{Rails.root}/app/assets/images/machinelogo2.jpg")
  end

  def decline_notify(user)
  	@user=user
  	 mail(:to => user.email, :subject => "Book reserve request")
  end
  
  def accept_notify(user)
  	@user=user
  	mail(:to => user.email, :subject => "Book reserve request")
  end
  
  def invite_notify(user)
  end
  
  def accept_invite_notify
  end
  	
end
