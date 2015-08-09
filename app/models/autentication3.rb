class Autentication3 < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development"
  #establish_connection "development_postgres"
  
end