class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = encode_token(user_id: resource.id)

      render json: {
        status: { code: 200, message: 'Registered sucessfully.' },
        user: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        token:
      }

    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
