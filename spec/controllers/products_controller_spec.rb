require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#new' do

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'instantiates a new product instance variable' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      def valid_request
        post :create, params: {product: {title: 'title',
                              description: 'description',
                              price: 10000}}
      end

    it 'saves a record to the database' do
      count_before = Product.count
      valid_request
      count_after = Product.count
      expect(count_after).to eq(count_before +1)
    end
    it 'redirects to the product show page' do
      valid_request
      expect(response).to redirect_to(product_path(Product.last))
    end

    it 'sets a flash message' do
      valid_request
      expect(flash[:notice]).to be
    end
end
    context 'with invalid parameters'
    def invalid_request
      post :create, params: {product: {title:''}}
    end
      # def invalid_request
      #   post :create, params: {campaign: {title: ''}}
      # end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
        # invalid_request
        # expect(response).to render_template(:new)
    it 'doesnt save the record to the database' do
      count_before = Product.count
      invalid_request
      count_after = Product.count
      expect(count_after).to eq(count_before)
    end
  end

  describe '#edit' do
    def product
      @product ||= Product.create title:'titleeee',
                                  description:'descriptionnnn',
                                  price:10000000
    end

    it "render edit form" do
      get :edit, params: {id: product.id}
      expect(response).to render_template(:edit)
    end
  end
  describe '#update' do
    context 'with valid parameters' do
      def product
        @product ||= Product.create title:'title',
                                    description:'description',
                                    price:10000000

      end
    it 'saves a record to the database' do
      put :update, params: {id: product.id, product: {title: 'Ron'}}
      expect(product.reload.title).to eq('Ron')
    end
    it 'redirects to the product show page' do
      valid_request
      expect(response).to redirect_to(product_path(Product.last))
    end

    it 'sets a flash message' do
      valid_request
      expect(flash[:notice]).to be
    end
  end
    context 'with invalid parameters'
    def invalid_request
      post :create, params: {product: {title:''}}
    end
      # def invalid_request
      #   post :create, params: {campaign: {title: ''}}
      # end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
        # invalid_request
        # expect(response).to render_template(:new)
    it 'doesnt save the record to the database' do
      count_before = Product.count
      invalid_request
      count_after = Product.count
      expect(count_after).to eq(count_before)
    end
  end
end
