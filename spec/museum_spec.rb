require './lib/museum.rb'
require './lib/exhibit.rb'
require './lib/patron.rb'

describe Museum do

  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")
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

    it "Museum can add new exhibits" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end

    it "Museum can recommend exhibits for each patron" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end

    it "Museum admits patrons" do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end

    it "Museum keeps track of patrons by intrest" do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq({@gems_and_minerals => [@patron_1], @dead_sea_scrolls => [@patron_1, @patron_3], @imax => [@patron_2]})
    end
end
