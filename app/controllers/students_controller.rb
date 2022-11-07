class StudentsController < ApplicationController
rescue_from ActiveRecord: :RecordNotFound, with: :record_not_found

    def index #GET
        render json: Student.all, status: :ok
    end

    def show 
        render json: Student.find(params[:id]), status: 200
    end

    def create #POST
        student = Student.create(student_params)#strong params
        render json: student, status: :created
    end

    def update #PATCH
        student = Student.find(params[:id]).update(student_params)
        render json: student, status: :ok
    end

    def destroy #DELETE
        Student.find(params[:id]).destroy
        head :no_content
    end


    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def record_not_found(error)
        render json: { 'error': "Student not found" }, status: :record_not_found
    end
end
