module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event'

        # Here is index override to make possible searching in admin panel with .to_ascii
        def index
          @events = find_event_scope
          @events = @events.with_query(params[:search].to_ascii) if params[:search].present?
          @events = @events.order(position: :desc).paginate(:page => params[:page], :per_page => paginate_per_page)
        end

        private

        # Only allow a trusted parameter "white list" through.
        def event_params
          params.require(:event).permit(:title, :date, :body)
        end
      end
    end
  end
end
