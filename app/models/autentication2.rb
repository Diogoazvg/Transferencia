class Autentication2 < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development_postgres"
  #establish_connection "development_postgres"
  
end