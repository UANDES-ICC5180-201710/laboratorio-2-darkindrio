class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @querry = nil
    @search_param = params[:search_bar]
    if @search_param == ""
      @querry = Course.all
    else
      @querry = Course.where("title LIKE ?", "%#{@search_param.to_s}%" )
    end
    @courses = @querry

  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  def show_persons
    
  end

  # GET /courses/new
  def new
    @course = Course.new
    @teachers = Person.all
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    #@aux = Person.where('id = 1')
    #@aux.each do |oaux|
    #  puts oaux.first_name
    #end
    course_params.each do |par|
       puts par
    end
    @teachers = Person.all

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_people
    if params[:course_id] != nil
      @course_id = params[:course_id]
      for item in @course_id
        @course_id = item
      end
      @course_id = @course_id.to_i
      @id_students_in_course = StudentCourse.where('course == ?',@course_id )
      @persons = Person.all
    else add_people
    end
    
  end

  def add_people
    puts "hola/////////////////////////////////////////7"
    redirect_back fallback_location: { action: "show_people" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :code, :teacher)

    end
end
