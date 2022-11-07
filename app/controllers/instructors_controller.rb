class InstructorsController < ApplicationController
rescue_from ActiveRecord: :RecordNotFound, with: :record_not_found

    def index #GET
        render json: Instructor.all, status: :ok
    end

    def show
        render json: Instructor.find_by(id: params[:id]), status: 200
    end

    def create #POST
        instructor = Instructor.create(instructor_params)#strong params
        render json: instructor, status: :created
    end

    def update #PATCH
        instructor = Instructor.find_by(id: params[:id]).update(instructor_params)
        render json: instructor, status: :ok
    end

    def destroy #DELETE
        Instructor.find(params[:id]).destroy
        head :no_content
    end


    private

    def instructor_params
        params.permit(:name)
    end

    # def record_not_found(error)
    # render json: { 'error': "Instructor not found" }, status: :record_not_found
    # end

    def record_invalid(error)
        render json: { error: error.message }, status: :unprocessable_entity
    end
end
