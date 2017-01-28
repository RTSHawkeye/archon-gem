module Archon::ActiveRecord
  # = Archon::ActiveRecord::CreateFromSelection
  # Allows bulk-creating records using an "INSERT SELECT" approach...
  module CreateFromSelection
    extend ActiveSupport::Concern

    module ClassMethods
      def create_from(selectish)
        transaction do
          timestamp = ActiveRecord::Base.connection.quoted_date(Time.now)
          timestamp = Arel::Nodes::SqlLiteral.new("'#{timestamp}'")
        end
      end
    end
  end
end
