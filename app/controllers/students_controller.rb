require "prawn"
class StudentsController < ApplicationController
  before_action :print_display_message

  def index
    @students=Student.all
  end

  def show
    # @student = Student.find_by(id:params[:id],name:params[:name])
    @student=Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
  #  / @student=Student.new(name:params[:student][:name],address: params[:student][:address])
    @student=Student.new(student_params)
    if @student.save
      CrudNotificationMailer.create_notification(@student).deliver_now

      redirect_to @student
      # head :ok
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def print_display_message
    puts "i am called"
  end

  private
    def student_params
      params.require(:student).permit(:name, :address,:email)
    end


end
