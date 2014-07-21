class Admin::EventsController < AdminController
  def index
    @events = current_user.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params

    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find params[:id]
  end

  def update
    @event = current_user.events.find params[:id]

    if @event.update_attributes event_params
      redirect_to admin_edit_event_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:date, :group_name, :venue_name, :user_id)    
    end
end