class Api::V1::BaseController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  private

  def api_success(status = 200, msg = [], data = {})
    render json: { data: data, type: 'Success', status: status, message: msg}, status: status  
  end

  def api_error(status = 500, errors = [])
    render json: { data: {}, type: 'Error', status: status, message: errors}, status: status
  end

  def collection_serializer(collection, serializer)
    ActiveModel::Serializer::CollectionSerializer.new(collection, serializer: serializer)
  end
end