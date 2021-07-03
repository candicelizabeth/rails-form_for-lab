class StudentsController < ApplicationController 
    
    def show 
        @student = Student.find_by_id(params[:id])
    end
    
    def new 
        @student = Student.new
    end

    def create 
        @student = Student.new(student_params)
        if @student.save 
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def edit
        @student = Student.find_by_id(params[:id])
    end

    def update 
        @student = Student.new(student_params)
        if @student.update(student_params)
            redirect_to student_path(@student)
        else
            render :edit
        end
    end

    private 
    def student_params
        params.require(:student).permit(:first_name, :last_name)
    end
end