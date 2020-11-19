class CustomerSerializer < ActiveModel::Serializer 
    attributes :id, :name, :mobile, :available
end