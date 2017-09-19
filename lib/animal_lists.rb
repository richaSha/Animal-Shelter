class Animal
  attr_reader :id
  attr_accessor :name, :gender, :date_of_admission, :type, :breed, :owner_name
  def initialize(attribute)
    @name = attribute.fetch(:name)
    @gender = attribute.fetch(:gender)
    @date_of_admission = attribute.fetch(:date_of_admission)
    @type = attribute.fetch(:type)
    @breed = attribute.fetch(:breed)
    @owner_name = (attribute.key?(:owner_name) ?  attribute.fetch(:owner_name) :nil)
    @id = (attribute.key?(:id) ?  attribute.fetch(:id) :nil)
  end

  def save
    @id = DB.exec("INSERT INTO animal_lists (name, gender, date_of_admission, type, breed, owner_name) VALUES ('#{name}', '#{gender}', '#{date_of_admission}' ,'#{type}', '#{breed}' ,'#{owner_name}') RETURNING id;")
  end

  def self.all
    animal_lists = DB.exec("SELECT * FROM animal_lists")
    lists =[]
    animal_lists.each do |list|
      lists.push(Animal.new({:name =>list.fetch('name'), :gender =>list.fetch('gender'), :date_of_admission =>list.fetch('date_of_admission'), :type =>list.fetch('type'),:breed =>list.fetch('breed'), :owner_name =>list.fetch('owner_name')}))
    end
    lists
  end

  def ==(another_obj)
    (self.name .== another_obj.name) .& (self.gender .== another_obj.gender) .& (self.date_of_admission .== another_obj.date_of_admission) .& (self.type .== another_obj.type) .& (self.breed .== another_obj.breed) .& (self.owner_name .== another_obj.owner_name)
  end
end
