module Api
    module V1
        class ValuesController < ApplicationController
            def index 
                values = Value.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Values', data:values}, status: :ok
            end

            def show
                value = Value.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Value', data:value}, status: :ok
            end

            def create 
                value = Value.new(value_params)
                if value.save
                    render json: {status: 'SUCCESS', message: 'Saved Value', data:value}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Value Not Saved', data:value.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                value = Value.find(params[:id])
                value.destroy
                render json: {status: 'SUCCESS', message: 'DELETED VALUE SUCCESSFULLY', data:value}, status: :ok
            end

            def update
                value = Value.find(params[:id])
                if value.update_attributes(value_params)
                    render json: {status: 'SUCCESS', message: 'UPDATED Value', data:value}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'VALUE NOT UPDATED', data:value.errors}, status: :unprocessable_entity
                end
                
            end

            private

            def value_params 
                params.permit(:title, :body)
            end

        end
    end
end