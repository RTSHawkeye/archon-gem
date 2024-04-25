module Archon
  module Nodes
    class Values < Arel::Nodes::Binary
      alias :expressions :left
      alias :expressions= :left=
      alias :columns :right
      alias :columns= :right=

      def initialize expressions
        super expressions, []
      end
    end
  end

  Arel::Visitors::PostgreSQL.class_eval do
    include Archon::Visitors::Values
  end
end
