require_relative 'item'
require 'csv'

class Shoe < Item
  attr_reader :id, :name, :price, :quantity, :brand, :description, :size, :type, :color, :author

  def initialize(id, name, price, quantity, brand, description, size, type, color, author)
    super(id, name, price, quantity, brand, description, type, color, author)
    @size = size
  end

  def self.all
    all_items = []
    
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[7].include?("shoe")
        item_provisoire = Shoe.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[10])
        all_items << item_provisoire
      end
    end
    return all_items
  end

  def self.find(itemchoice)
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[0].to_i === itemchoice.to_i
        item = Shoe.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[10])
        return item
      end
    end
  end
 
  
end