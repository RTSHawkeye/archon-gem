module Archon
  module Visitors
    module Values
      private

      def visit_Archon_Nodes_Values o, collector
        collector << 'VALUES '

        len_a = o.expressions.length - 1
        o.expressions.each_with_index do |values, i|
          collector << '('
          len_b = values.length - 1
          values.each_with_index do |value, ii|
            case value
            when Arel::Nodes::SqlLiteral, Arel::Nodes::BindParam
              collector = visit value, collector
            else
              collector << quote(value).to_s
            end
            collector << Arel::Visitors::ToSql::COMMA unless ii == len_b
          end
          collector << ')'
          collector << Arel::Visitors::ToSql::COMMA unless i == len_a
        end

        collector
      end
    end
  end
end
