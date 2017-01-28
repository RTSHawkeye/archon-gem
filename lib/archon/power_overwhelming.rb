module Archon
  # = PowerOverwhelming
  #
  # Packs several powerful convenient methods for ActiveRecord models. You can add them like this:
  #
  # == ActiveRecord >= 5.x
  #  ```
  #  # app/models/application_record.rb
  #  class ApplicationRecord < ActiveRecord::Base
  #    self.abstract_class = true
  #    include Archon::PowerOverwhelming
  #  end
  # ```
  #
  # == ActiveRecord >= 4.2.x, < 5.x
  #  ```
  #  # initializers/archon.rb
  #  ActiveRecord::Base.send :include, Archon::PowerOverwhelming
  #  ```
  module PowerOverwhelming
    extend ActiveSupport::Concern

    included do
      include Archon::ActiveRecord::CreateFromSelection,
              Archon::ActiveRecord::LeftJoinScoping
    end
  end
end
