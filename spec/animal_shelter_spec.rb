require "spec_helper"

describe('#animal_shelter') do
  describe('.save') do
    it('should save data into data base') do
      animal_obj = Animal.new({:name =>"tommy", :gender =>"female", :date_of_admission =>"2017-02-12", :type =>'dog',:breed =>'pavelion',:id => 1, :owner_name=>"suji"})
      animal_obj.save()
      expect(Animal.all).to(eq([animal_obj]))
    end
  end
end
