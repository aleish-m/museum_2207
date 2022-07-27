require './lib/patron.rb'

describe Patron do

  before :each do
    @patron_1 = Patron.new("Bob", 20)
  end

    it "Patron exists" do
      expect(@patron_1).to be_an_instance_of(Patron)
    end

    it "Patron has a name" do
      expect(@patron_1.name).to eq("Bob")
    end

    it "Patron has a spending money" do
      expect(@patron_1.spending_money).to eq(20)
    end
end
