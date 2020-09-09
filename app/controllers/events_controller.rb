class EventsController < ApplicationController

  def event_calendar
    packages = current_admin.packages
    @event = Event.new
    @reservations = Reservation.where(package_id: packages).order(id: :desc).page(params[:page]).per(25)
    @events = current_admin.events.all
  end

  def create
   @event = current_admin.events.build(event_params)
   if @event.save
    flash[:notice] = "メモ登録されました"
    redirect_to events_event_calendar_url
   else
     flash[:alert] = "メモ登録はされませんでした"
     render events_event_calendar_url
   end
  end
  
  def destroy
    @event =Event.find(params[:id])
    @event.destroy
    redirect_to events_event_calendar_url
  end
  
  private
  
  def event_params
    params.require(:event).permit(:note, :note_content, :start_event, :end_event, :admin_id)
  end

end
