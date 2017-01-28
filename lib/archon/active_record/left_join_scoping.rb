module Archon::ActiveRecord
  # = Archon::ActiveRecord::LeftJoinScoping
  # Allows far-easier left joins to associations
  module LeftJoinScoping
    extend ActiveSupport::Concern

    module ClassMethods
      def left_joins(*given_associations)
        given_associations.reduce(all) do |activerecord_scope, given_association|
          left_join_scope_to activerecord_scope, reflect_on_association(given_association)
        end
      end

      private

        def left_join_scope_to(activerecord_scope, reflection)
          join_table = left_join_table_from reflection
          join_condition = arel_table[reflection.active_record_primary_key]
                           .eq join_table[reflection.foreign_key]

          activerecord_scope.joins arel_table.create_join(
            join_table,
            arel_table.create_on(join_condition),
            Arel::Nodes::OuterJoin
          )
        end

        def left_join_table_from(reflection)
          return Arel::Table.new reflection.join_table if reflection.macro == :has_and_belongs_to_many
          Arel::Table.new reflection.table_name
        end
    end
  end
end
