require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category_Test'
      @product.name = 'Product_Test' # invalid state
      @product.price_cents = 1234
      @product.quantity = 2
      @product.category_id = @category
      expect(@product.valid?).to be true
    end

    it "name is present" do
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
  
      @product.name = 'Product_Test' # this is the product.name in the valid state
      @product.valid? 
      expect(@product.errors[:name]).not_to include("can't be blank")
    end

    it "price_cents is present" do
      @product = Product.new
      @product.price_cents = nil # invalid state
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
  
      @product.price_cents = 1234 # valid state
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to include("can't be blank")
    end

    it "quantity is present" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")

      @product.quantity = 2
      @product.valid?
      expect(@product.errors[:quantity]).not_to include("can't be blank")
    end

    it "category is present" do
      @category = Category.new
      @product.category_id = nil 
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")

    end
  end
end