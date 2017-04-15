module Archon
  # Factory method
  def self.values_list expressions
    return Nodes::ValuesList.new expressions
  end

  module Nodes
    class ValuesList < Arel::Nodes::Binary
      alias :expressions :left
      alias :expressions= :left=
      alias :columns :right
      alias :columns= :right=

      def initialize expressions
        super expressions, []
      end
    end
  end

  # Only include the visitor module on the SQL vendors that support it:
  Arel::Visitors::PostgreSQL.class_eval do
    include Archon::Visitors::ValuesList
  end

  Arel::Visitors::Oracle.class_eval do
    include Archon::Visitors::ValuesList
  end

  Arel::Visitors::Oracle12.class_eval do
    include Archon::Visitors::ValuesList
  end
end
