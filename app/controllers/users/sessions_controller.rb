class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = encode_token(user_id: resource.id)
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        user: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        token:
      }, status: :ok

    else
      render json: {
        status: 401,
        message: "Couldn't find user."
      }, status: :ok
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :ok
    end
  end
end
