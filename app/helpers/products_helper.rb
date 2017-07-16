module ProductsHelper
	
  def cache_key_for_products
    count          = Product.count
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"

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


end
