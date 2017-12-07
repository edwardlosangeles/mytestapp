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


end
