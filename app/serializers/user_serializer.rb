class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :first_name, :last_name, :updated_at, :email, :avatar_url
end
