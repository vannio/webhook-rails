class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.logger.level = 1
end
