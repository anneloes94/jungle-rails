require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    category = Category.new(name: "Apparel")
    product = Product.new(id: 200, name: "Carniverous clothes hanger", price: 20, quantity: 2, category: category)

    it 'saves correctly when all fields are set' do
      product.save 
      expect(Product.find_by(name: "Carniverous clothes hanger")).not_to be_nil
    end

    it 'does not save correctly once name is not set and validated' do
      product.name = nil
      product.save
      expect(Product.find_by(id: 200)).to be_nil
    end

    it 'does not save correctly once price is not set and validated' do
      product.price = nil
      product.save
      expect(Product.find_by(name: "Carniverous clothes hanger")).to be_nil
    end

    it 'does not save correctly once quantity is not set and validated' do
      product.quantity = nil
      product.save
      expect(Product.find_by(name: "Carniverous clothes hanger")).to be_nil

    end

    it 'does not save correctly once category is not set and validated' do
      product.category = nil
      product.save
      expect(Product.find_by(name: "Carniverous clothes hanger")).to be_nil
    end
  end
end

