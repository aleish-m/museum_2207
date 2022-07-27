require './lib/museum.rb'

describe Museum do

  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

    it "Museum exists" do
      expect(@dmns).to be_an_instance_of(Museum)
    end

    it "Museum has a name" do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it "Museum has exhibits" do
      expect(@dmns.exhibits).to eq([])
    end
end
