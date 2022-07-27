require './lib/exhibit.rb'

describe Exhibit do

  before :each do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

    it "Exhibit exists" do
      expect(@exhibit).to be_an_instance_of(Exhibit)
    end

    it "Exhibit has a name" do
      expect(@exhibit.name).to eq("Gems and Minerals")
    end

    it "Exhibit has a cost" do
      expect(@exhibit.cost).to eq(0)
    end

end
