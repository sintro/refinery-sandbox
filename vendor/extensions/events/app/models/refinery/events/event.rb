module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'


      validates :title, :presence => true, :uniqueness => true

      acts_as_indexed :fields => [:ascii_title, :ascii_body]


      def ascii_title
        self.title.try(&:to_ascii)
      end

      def ascii_body
        self.body.try(&:to_ascii)
      end


      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
