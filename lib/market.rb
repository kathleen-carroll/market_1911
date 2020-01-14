class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.include?(item)}
  end

  def sorted_item_list
    item_list = Hash.new(0)
    inventory_consolidated = @vendors.map do |vendor|
      vendor.inventory.each do |item, quantity|
        item_list[item] += quantity
      end
    end

    sorted_items = item_list.sort_by do |item, quantity|
      item.name
    end

    sorted_items.map {|item, quantity| item.name}
  end

  def total_inventory
    item_list = Hash.new(0)
    @vendors.map do |vendor|
      vendor.inventory.each do |item, quantity|
        item_list[item] += quantity
      end
    end
    item_list
  end
end
