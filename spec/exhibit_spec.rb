require './lib/exhibit.rb'

describe Exhibit do

  before :each do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

    it "Exhibit exists" do
      expect(@exhibit).to be_an_instance_of(Exhibit)
    end


end
