class WeeksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_week, only: [:show, :edit, :update, :destroy, :complete]

  # GET /weeks
  # GET /weeks.json
  def index
    @weeks = Week.all.order('created_at DESC').page(params[:page]).per_page(ENV["WEEKLY_ITEMS"].to_i)
  end

  # GET /weeks/1
  # GET /weeks/1.json
  def show
  end

  # GET /weeks/new
  def new
    @week = Week.new
  end

  # GET /weeks/1/edit
  def edit
  end

  # PUT /weeks/1/complete/
  def complete
    @week = Week.find(params[:id])
    @week.toggle!(:completed)
    @week.completed_by = current_user.login

    respond_to do |format|
      if @week.save
        format.html { redirect_to :back, notice: 'Item successfully Completed.' }
        format.json { render action: 'show', status: :created, location: @week }
      else
        format.html { render action: 'new' }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /weeks
  # POST /weeks.json
  def create
    @week = Week.new(week_params)

    respond_to do |format|
      if @week.save
        format.html { redirect_to @week, notice: 'Week was successfully created.' }
        format.json { render action: 'show', status: :created, location: @week }
      else
        format.html { render action: 'new' }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeks/1
  # PATCH/PUT /weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to :back, notice: 'Todo was Completed Successfully' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.json
  def destroy
    @week.destroy
    respond_to do |format|
      format.html { redirect_to weeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      params.require(:week).permit(:title, :completed_by, :completed)
    end
end
