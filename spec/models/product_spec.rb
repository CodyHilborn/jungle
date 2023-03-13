require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully when all valid fields are present' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(
        name: "Sheoldred",
        price: 69.99,
        quantity: 17,
        category: @category
      )
      expect(@product).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(
        name: nil,
        price: 69.99,
        quantity: 17,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(
        name: "Sheoldred",
        price: nil,
        price_cents: nil,
        quantity: 17,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to include("Price cents is not a number")
      expect(@product.errors.full_messages[1]).to include("Price is not a number")
      expect(@product.errors.full_messages[2]).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(
        name: "Sheoldred",
        price: 69.99,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a category' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(
        name: "Sheoldred",
        price: 69.99,
        quantity: 17,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to include("Category must exist")
      expect(@product.errors.full_messages[1]).to include("Category can't be blank")
    end
  end
end
