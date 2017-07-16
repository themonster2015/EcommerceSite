require 'rails_helper'
describe Product do
	before do
  #here you put your code to generate test content
   @product = Product.create!(name: "race bike")
   @user = User.create!(email: "aaa@gmail.com", password: "2324544")
   @product.comments.create!(rating: 1, user: @user, body: "Terrible")
	@product.comments.create!(rating: 3, user: @user, body: "average")
	@product.comments.create!(rating: 5, user: @user, body: "excellent")
	end
	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3
	end
	it "should not return valid" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

end