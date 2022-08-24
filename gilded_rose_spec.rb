require File.join(File.dirname(__FILE__), 'gilded_rose')


describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "quality decreases by one" do
      items = [Item.new("foo", 20, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(49)
    end
    it "sell_in decreases by one" do
      items = [Item.new("foo", 20, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(19)
    end
    it "quality decreases by two" do
      items = [Item.new("foo", -1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(48)
    end
    it "quality cannot be negative" do
      items = [Item.new("foo", 20, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it "quality/sell_in never decreases" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(40)
      expect(items[0].sell_in).to eq(20)
    end
    it "increases in quality" do
      items = [Item.new("Aged Brie", 20, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(41)
    end
    it "sell_in decreases" do
      items = [Item.new("Aged Brie", 20, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(19)
    end
    it "quality is never > 50" do
      items = [Item.new("Aged Brie", 20, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it "quality is never > 50" do
      items = [Item.new("Aged Brie", -1, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it "quality increases by 2 when sell_in == 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(42)
    end
    it "quality increases by 2 when sell_in < 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(42)
    end
    it "quality increases by 3 when sell_in == 5" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(43)
    end
    it "quality increases by 3 when sell_in < 5" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(43)
    end
    it "quality drops to 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it "quality always <= 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
  end

end
