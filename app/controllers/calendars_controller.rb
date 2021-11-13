class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
  end

  def new
    @calendar = Calendar.new
    @calendar.c_date = params[:c_date]
    @calendar.user_id = current_user.id
    @top_items = Item.where(user_id: current_user.id).where(choice: 1).order(:r_date)
    @bottom_items = Item.where(user_id: current_user.id).where(choice: 2).order(:r_date)
    @shoes_items = Item.where(user_id: current_user.id).where(choice: 3).order(:r_date)
  end

  def create
    @calendar = Calendar.new(calendar_params)
    # binding.pry
    if @calendar.save
      redirect_to calendars_path, success: '保存に成功しました'
    else
      flash.now[:danger] = "保存に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
    @top_items = Item.where(user_id: current_user.id).where(choice: 1).order(:r_date)
    @bottom_items = Item.where(user_id: current_user.id).where(choice: 2).order(:r_date)
    @shoes_items = Item.where(user_id: current_user.id).where(choice: 3).order(:r_date)
  end

  def update
    if @calendar.update(calendar_params)
        redirect_to calendars_path, success:"変更に成功しました"
    else
        flash.now[:danger] = "変更に失敗しました"
        render :new
    end
  end

  def destroy
    if @calendar.destroy
        redirect_to calendars_path, success: "削除しました"
    else
        flash.now[:danger] = "削除に失敗しました"
        render :new
    end
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end 

    def calendar_params
        params.require(:calendar).permit(:top_item, :bottom_item, :shoes_item, :description, :c_date, :user_id)
    end
end