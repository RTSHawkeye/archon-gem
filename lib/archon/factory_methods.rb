module Archon
  module FactoryMethods
    def sql_coalesce(*coalescees)
      return Nodes::Coalesce.new(*coalescees)
    end

    def sql_populated_recordset(base, rows = [])
      return Nodes::PopulatedRecordset.new base, rows
    end

    def sql_values expressions
      return Nodes::Values.new expressions
    end

    # Returns a node that represents a `CAST([castable] AS [new_type])` sql fragment
    def sql_cast_as(new_type, castable)
      casting = Arel::Nodes::As.new castable, Arel::Nodes::SqlLiteral.new(new_type.to_s.upcase)
      Arel::Nodes::NamedFunction.new 'CAST', [casting]
    end

    # Returns a Insert Manager primed to insert the given 'select-ish' into the given 'table-ish'
    def sql_insert_into_select(insertion_table, selection, options = {})
      InsertIntoSelect.new insertion_table, selection, options
    end

    def sql_table(name)
      Arel::Table.new name
    end

    def sql_quoted(quotable)
      Arel::Nodes::Quoted.new quotable
    end

    def sql_literal(literable)
      Arel::Nodes::SqlLiteral.new literable
    end

    def sql_as(left, right)
      Arel::Nodes::As.new left, right
    end
  end
end
