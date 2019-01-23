class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:role,:phone,:address,:name_shop,:address_shop
end
