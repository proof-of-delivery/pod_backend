# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/warehouse_orders", type: :request do
  let(:valid_attributes) do
    {
      doc_no: Faker::Name.name,
      name_of_ship: Faker::Name.name,
      delivery_date: Faker::Date.in_date_period,
      delivery_address: Faker::Name.name,
      customer_id: create(:customer).id
    }
  end

  let(:invalid_attributes) do
    {
      doc_no: Faker::Name.name,
      name_of_ship: Faker::Name.name,
      delivery_date: Faker::Name.name,
      delivery_address: Faker::Name.name,
      customer_id: nil
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # WarehouseOrdersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      WarehouseOrder.create! valid_attributes
      get warehouse_orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      warehouse_order = WarehouseOrder.create! valid_attributes
      get warehouse_order_url(warehouse_order), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new WarehouseOrder" do
        expect do
          post warehouse_orders_url,
            params: {warehouse_order: valid_attributes}, headers: valid_headers, as: :json
        end.to change(WarehouseOrder, :count).by(1)
      end

      it "renders a JSON response with the new warehouse_order" do
        post warehouse_orders_url,
          params: {warehouse_order: valid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new WarehouseOrder" do
        expect do
          post warehouse_orders_url,
            params: {warehouse_order: invalid_attributes}, as: :json
        end.to change(WarehouseOrder, :count).by(0)
      end

      it "renders a JSON response with errors for the new warehouse_order" do
        post warehouse_orders_url,
          params: {warehouse_order: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          doc_no: Faker::Name.name
        }
      end

      it "updates the requested warehouse_order" do
        warehouse_order = WarehouseOrder.create! valid_attributes
        patch warehouse_order_url(warehouse_order),
          params: {warehouse_order: new_attributes}, headers: valid_headers, as: :json
        warehouse_order.reload
        expect(warehouse_order.doc_no).to eq new_attributes[:doc_no]
      end

      it "renders a JSON response with the warehouse_order" do
        warehouse_order = WarehouseOrder.create! valid_attributes
        patch warehouse_order_url(warehouse_order),
          params: {warehouse_order: new_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the warehouse_order" do
        warehouse_order = WarehouseOrder.create! valid_attributes
        patch warehouse_order_url(warehouse_order),
          params: {warehouse_order: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested warehouse_order" do
      warehouse_order = WarehouseOrder.create! valid_attributes
      expect do
        delete warehouse_order_url(warehouse_order), headers: valid_headers, as: :json
      end.to change(WarehouseOrder, :count).by(-1)
    end
  end
end
