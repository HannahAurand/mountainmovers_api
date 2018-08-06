module Api
   module V1
    class TeammembersController < ApplicationController
        def index
            teammembers = Teammember.order('created_at DESC');
            render json: {status: 'SUCCESS', message: 'Loaded team members', data:teammembers}, status: :ok
        end

        def show
            teammembers = Teammembers.find(params[:id])
            render json: {status: 'SUCCESS', message: 'Loaded team members', data:teammember}, status: :ok
        end

        def create
            teammember = Teammember.new(teammember_params)
            if teammember.save
                render json: {status: 'SUCCESS', message: 'Created team member', data:teammember}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Team Member not saved', data:teammember.errors}, status: :unprocessable_entity
        end

        def destroy
        end

        def update
        end

        private

        def teammember_params
            params.permit(:name, :role, :description, :image, :picture)
        end

    end
   end
end