class Person < ActiveRecord::Base

  include Searchable


  scope :missing, -> { where :found => false }

end
