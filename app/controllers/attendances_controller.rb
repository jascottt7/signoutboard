class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    if params[:branch] && params[:branch] != 'ALL'
      @attendances = Attendance.joins(:employee).all(:conditions => ["employees.branch_location = ?", params[:branch]], :order => 'employees.fname')
    elsif params[:department] && params[:department] != 'ALL'
      @attendances = Attendance.joins(:employee).all(:conditions => ["employees.department = ?", params[:department]], :order => 'employees.fname')    
    elsif params[:supervisor] && params[:supervisor] != 'ALL'
      @attendances = Attendance.joins(:employee).all(:conditions => ["employees.supervisor = ?", params[:supervisor]], :order => 'employees.fname')        
    else  
      @attendances = Attendance.joins(:employee).all(:order => 'employees.fname') 
    end  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  def signout
   @attendance = Attendance.find(params[:id])
   @attendance.signout
   redirect_to edit_attendance_path(params[:id])
  end  
  
  def signin
   @attendance = Attendance.find(params[:id])
   @attendance.signin
   redirect_to action: "index"
  end    
  
  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to action: "index", notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end
end
