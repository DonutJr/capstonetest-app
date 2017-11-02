class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  require 'Alert'


end
