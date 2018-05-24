class ExampleMailer < ApplicationMailer
	 default from: "pmohansaikrishna@gmail.com"#this is the senders email address
	 def sample_email(user)
       @user = user
       mail(to: @user.email, subject: 'Sample Email')
     end
end
