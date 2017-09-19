require ('./lib/animal_lists')
require ('rspec')
require ('pg')
require ('pry')

DB = PG.connect({:dbname => "animal_shelter_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animal_lists *;")
  end
end
