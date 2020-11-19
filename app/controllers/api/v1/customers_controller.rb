class Api::V1::CustomersController < Api::V1::BaseController
  protect_from_forgery :except => [:create]
  before_action :load_customer, only: [:update, :destroy]

  def index
    @customers = Customer.all
    collection = ActiveModel::Serializer::CollectionSerializer.new(@customers, serializer: CustomerSerializer)
    api_success(200, "All Customers", collection)
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      api_success(200, "Customer created successfully", CustomerSerializer.new(@customer))
    else
      api_error(400, @customer.error_full_messages.join(','))
    end
  end

  def update
    if @customer.update(customer_params)
      api_success(200, "Customer update successfully", CustomerSerializer.new(@customer))
    else
      api_error(400, @customer.error_full_messages.join(','))
    end
  end

  def destroy
    if @customer.destroy
      api_success(200, "Customer delete successfully", @customer)
    end
  end

  private

  def load_customer
    @customer = Customer.find_by(id: params[:id])
  end

  def customer_params
    params.permit(:id, :name, :mobile, :available)
  end
end