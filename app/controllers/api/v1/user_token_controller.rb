module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      private
      def auth_params
        params.require(:auth).permit(:name, :password)
      end
    end
  end
end