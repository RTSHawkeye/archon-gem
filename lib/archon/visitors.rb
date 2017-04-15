module Archon
  # = Nodes
  # A collection of ARel visitors to emit SQL for various SQL vendors
  module Visitors
    extend ActiveSupport::Autoload
    autoload :ValuesList
  end
end
