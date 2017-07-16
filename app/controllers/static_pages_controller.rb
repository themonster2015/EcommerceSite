class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

   def landing_page
    # if params[:q]
    # search_term = params[:q]
    # @products = Product.where("name LIKE ?", "%#{search_term}%")
    # # return our filtered list here
    # else
    #   @products = Product.limit(3)
    # end
    @images = [ "cat.jpg", "cat2.jpg" ]
    if params[:q]
       search_term = params[:q]
       if (Rails.env == "production")
       @products = Product.where("name ilike ?", "%#{search_term}%")
      else
        @products = Product.where("name LIKE ?", "%#{search_term}%")
      end
    else

        @products = Product.all
    end
  end
  
   def acne
   	if params[:q]
       search_term = params[:q]
       if (Rails.env == "production")
       @products = Product.where("name ilike ?", "%#{search_term}%")
      else
        @products = Product.where("name LIKE ?", "%#{search_term}%")
      end
    else

        @products = Product.all
    end
   end

   def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  UserMailer.contact_form(@email, @name, @message).deliver_now
	 end
end 
