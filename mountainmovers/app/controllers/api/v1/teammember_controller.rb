module Api
   module V1
    class TeammembersController < ApplicationController
        def index
            teammembers = Teammember.order('created_at DESC');
            render json: {status: 'SUCCESS', message: 'Loaded team members', data:teammembers}, status: :ok
        end

        def show
        end

        def create
        end

        def destroy
        end

        def update
        end

        private

        def teammember_params
            params.permit(:name, :role, :description, :image)
        end

    end
   end
end