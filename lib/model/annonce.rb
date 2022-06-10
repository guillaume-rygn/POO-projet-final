require_relative 'harddrive'
require 'csv'

class Annonce < Harddrive
  attr_reader :id, :name, :price, :quantity, :brand, :description, :size, :type, :color, :storage, :author, :phone

  def initialize(id, name, price, quantity, brand, description, size, type, color, storage, author, phone)
    super(id, name, price, quantity, brand, description, size, type, color, storage, author)
    @phone = phone
  end

  def self.all
    all_items = []
    
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[11].include?("user")
        item_provisoire = Annonce.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[9], row[10], row[11])
        all_items << item_provisoire
      end
    end
    return all_items
  end

  def self.find(itemchoice)
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[0].to_i === itemchoice.to_i
        item = Annonce.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[9], row[10], row[11])
        return item
      end
    end
  end

end