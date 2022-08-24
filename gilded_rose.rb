class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        update_aged_brie(item)
        next
      when "Backstage passes to a TAFKAL80ETC concert"
        update_backstage(item)
        next
      when "Sulfuras, Hand of Ragnaros"
        next
      else
        update_normal(item)
        next
      end
    end
  end
  private

  def update_normal(item)
    if item.quality > 0
      item.quality = item.quality - 1
    end
    if item.sell_in < 0
      item.quality = item.quality - 1
    end
    item.sell_in = item.sell_in - 1
  end

  def update_aged_brie(item)
    if item.quality < 50 && item.sell_in >= 0
      item.quality = item.quality + 1
    elsif item.quality < 50 && item.sell_in < 0
      unless item.quality == 49
        item.quality = item.quality + 2
      else 
        item.quality = item.quality + 1
      end
    end
    item.sell_in = item.sell_in - 1
  end

  def update_backstage(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
    if item.sell_in < 11 && item.quality < 50
        item.quality = item.quality + 1
    end
    if item.sell_in < 6 && item.quality < 50
        item.quality = item.quality + 1
    end
    unless item.sell_in == 0
      item.sell_in = item.sell_in - 1
    else
      item.quality = 0
      item.sell_in = item.sell_in - 1
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
