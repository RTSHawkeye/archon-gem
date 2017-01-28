module Archon
  # = ActiveRecord
  # A collection of ActiveRecord methods that do powerful stuff
  module ActiveRecord
    extend ActiveSupport::Autoload

    autoload :CreateFromSelection
    autoload :LeftJoinScoping
  end
end
