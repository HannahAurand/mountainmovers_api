module Api
    module V1
        class TeammembersController < ApplicationController
            def index
                teammembers = Teammember.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded team members', data:teammembers}, status: :ok
            end

            def show
                teammember = Teammember.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded team members', data:teammember}, status: :ok
            end

            def create
                teammember = Teammember.new(teammember_params)
                if teammember.save
                    render json: {status: 'SUCCESS', message: 'Created team member', data:teammember}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Team Member not saved', data:teammember.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                teammember = Teammember.find(params[:id])
                teammember.destroy
                render json: {status: 'SUCCESS', message: 'DELETED TEAMMEMBER INFO SUCCESSFULLY', data:teammember}, status: :ok
            end

            def update
                teammember = Teammember.find(params[:id])
                if teammember.update_attributes(teammember_params)
                    render json: {status: 'SUCCESS', message: 'UPDATED teammember', data:teammember}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'teammember NOT UPDATED', data:teammember.errors}, status: :unprocessable_entity
                end
            end

            private

            def teammember_params
                params.permit(:name, :role, :description, :image, :picture)
            end

        end
    end
end