class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage(item)
      when 'Sulfuras, Hand of Ragnaros'
        next
      else
        update_normal(item)
      end
    end
  end

  private

  def update_normal(item)
    item.quality = item.quality - 1 if item.quality > 0
    item.quality = item.quality - 1 if item.sell_in < 0
    item.sell_in = item.sell_in - 1
  end

  def update_aged_brie(item)
    if item.quality < 50 && item.sell_in >= 0
      item.quality = item.quality + 1
    elsif item.quality < 50 && item.sell_in < 0
      item.quality = if item.quality == 49
                       item.quality + 1
                     else
                       item.quality + 2
                     end
    end
    item.sell_in = item.sell_in - 1
  end

  def update_backstage(item)
    item.quality = item.quality + 1 if item.quality < 50
    item.quality = item.quality + 1 if item.sell_in < 11 && item.quality < 50
    item.quality = item.quality + 1 if item.sell_in < 6 && item.quality < 50
    if item.sell_in <= 0
      item.quality = 0
      item.sell_in = item.sell_in - 1
    else
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

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
