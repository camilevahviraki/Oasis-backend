# class UserSerializer < ActiveModel::Serializer

#   attributes :id, :first_name, :last_name, :email, :avatar_url

#   def avatar_url
#     object.avatar.attachment.url
#   end
# end

class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :first_name, :last_name, :email, :avatar_url

  def avatar_url
    object.avatar.attachment.url
  end
end