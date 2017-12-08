class StaticPagesController < ApplicationController
  def index
  end
  def contact
  end
  def about
  end

  def landing_page
  	@featured_product = Product.first
  	# debug .erb
		p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": landing page*=*=*=*="
  end


  def thank_you

    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    # ActionMailer::Base.mail(
    #   from: @email,
    #   to: 'edwardlosangeles@gmail.com',
    #   subject: "A new contact form message from #{@name}",
    #   body: @message).deliver_now
    
    UserMailer.contact_form(@email, @name, @message).deliver_now

  end



end
