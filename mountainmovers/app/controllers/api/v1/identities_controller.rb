module Api
    module V1
        class IdentitiesController < ApplicationController
            def index
                identities = Identity.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Identities', data:identities}, status: :ok
            end

            def show
                identity = Identity.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded identity', data:identity}, status: :ok
            end

            def create 
                identity = Identity.new(identity_params)
                if identity.save
                    render json: {status: 'SUCCESS', message: 'Saved Identity', data:identity}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Identity Not Saved', data:identity.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                identity = Identity.find(params[:id])
                identity.destroy
                render json: {status: 'SUCCESS', message: 'DELETED Identity SUCCESSFULLY', data:identity}, status: :ok
            end

            def update
                identity = Identity.find(params[:id])
                if identity.update_attributes(identity_params)
                    render json: {status: 'SUCCESS', message: 'UPDATED Identity', data:identity}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Identity NOT UPDATED', data:identity.errors}, status: :unprocessable_entity
                end
                
            end

            private

            def identity_params 
                params.permit(:title, :body)
            end


        end
    end
end