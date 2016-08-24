require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "Validations" do
    it 'requires title present' do
      pro = Product.new
      pro.valid?
      expect(pro.errors).to have_key(:title)
    end

    it 'requires price present' do
      pro = Product.new
      pro.valid?
      expect(pro.errors).to have_key(:price)
    end

    it 'requires description present' do
      pro = Product.new
      pro.valid?
      expect(pro.errors).to have_key(:description)
    end

    it 'requires title to be unique' do
      Product.create({title: "this is my test", description:'this is my test description', price:3})
      pro = Product.new title: "this is my test"
      pro.valid?
      expect(pro.errors).to have_key(:title)
    end

    it 'requires price to be more than 0' do
      pro = Product.new price: 0
      pro.valid?
      expect(pro.errors).to have_key(:price)
    end

    it 'returns a titleized version of the title' do
      pro = Product.new title: "hello world"
      outcome = pro.titleized_title
      expect(outcome).to eq("Hello World")
    end

  end


end
