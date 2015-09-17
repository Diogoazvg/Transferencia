class Autentication_biblioteca < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development_biblioteca"
  #establish_connection "development_postgres"
  
end