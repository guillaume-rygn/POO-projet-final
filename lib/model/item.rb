require 'csv'

class Item
  attr_reader :id, :name, :price, :quantity, :brand, :description, :type, :color, :author

  def initialize(id, name, price, quantity, brand, description, type, color, author)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
    @description = description
    @type = type
    @color = color
    @author = author
  end

  def self.all
    all_items = []

    i = 0
    
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[10] == ("user")
        item_provisoire = Annonce.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[9], row[10], row[11])
        all_items << item_provisoire
      else
        if row[7].include?("other")
          item_provisoire = Item.new(row[0], row[1], row[2], row[3], row[4], row[5],  row[7], row[8], row[10])
          all_items << item_provisoire
        elsif row[7].include?("shoe")
          item_provisoire = Shoe.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[10])
          all_items << item_provisoire
        elsif row[7].include?("poster")
          item_provisoire = Poster.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[10])
          all_items << item_provisoire
        elsif row[7].include?("hard drive")
          item_provisoire = Harddrive.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6],row[7], row[8], row[9], row[10])
          all_items << item_provisoire
        end
      
      
      end
    end
    return all_items

  end

  def self.find(itemchoice)
    CSV.foreach(("./db/data.csv"), headers: true, col_sep: ",") do |row|
      if row[0].to_i === itemchoice.to_i
        item = Item.new(row[0], row[1], row[2], row[3], row[4], row[5], row[7], row[8], row[10])
        return item
      end
    end
  end

  def save
    items = Item.all
    header = "id,Name,price,quantity,brand,description,size,type,color,storage"
    file = "./db/data.csv"

    File.open(file, "w") do |csv|
      csv << header
      items.each do |item|
        csv << "\n"
        csv << item.id
        csv << ","
        csv << item.name
        csv << ","
        csv << item.price
        csv << ","
        csv << item.quantity
        csv << ","
        csv << item.brand
        csv << ","
        csv << item.description
        csv << ","
        if item.type == "shoe" || item.type == "poster" || item.type == "hard drive"
          csv << item.size
        end
        csv << ","
        csv << item.type
        csv << ","
        csv << item.color
        csv << ","
        if item.type == "hard drive"
          csv << item.storage
        end
        csv << ","
        csv << item.author
        csv << ","
        if item.author == "user"
          csv << item.phone
        end
      end
        csv << "\n"
        csv << @id
        csv << ","
        csv << @name
        csv << ","
        csv << @price
        csv << ","
        csv << @quantity
        csv << ","
        csv << @brand
        csv << ","
        csv << @description
        csv << ","
        if @type == "shoe" || @type == "poster" || @type == "hard drive"
          csv << @size
        end
        csv << ","
        csv << @type
        csv << ","
        csv << @color
        csv << ","
        if @type == "hard drive"
          csv << @storage
        end
        csv << ","
        csv << @author
        csv << ","
        if @author == "user"
          csv << @phone
        end
    end
  end

  def saveupdate(id)
    items = Item.all
    header = "id,Name,price,quantity,brand,description,size,type,color,storage"
    file = "./db/data.csv"

    File.open(file, "w") do |csv|
      csv << header
      items.each do |item|
        if item.id.to_i == id.to_i
          csv << "\n"
          csv << @id
          csv << ","
          csv << @name
          csv << ","
          csv << @price
          csv << ","
          csv << @quantity
          csv << ","
          csv << @brand
          csv << ","
          csv << @description
          csv << ","
          if @type == "shoe" || @type == "poster" || @type == "hard drive"
            csv << @size
          end
          csv << ","
          csv << @type
          csv << ","
          csv << @color
          csv << ","
          if @type == "hard drive"
            csv << @storage
          end
          csv << ","
          csv << @author
          csv << ","
          if @author == "user"
            csv << @phone
          end
        else
          csv << "\n"
          csv << item.id
          csv << ","
          csv << item.name
          csv << ","
          csv << item.price
          csv << ","
          csv << item.quantity
          csv << ","
          csv << item.brand
          csv << ","
          csv << item.description
          csv << ","
          if item.type == "shoe" || item.type == "poster" || item.type == "hard drive"
            csv << item.size
          end
          csv << ","
          csv << item.type
          csv << ","
          csv << item.color
          csv << ","
          if item.type == "hard drive"
            csv << item.storage
          end
          csv << ","
          csv << item.author
          csv << ","
          if item.author == "user"
            csv << item.phone
          end
        end
    end
  end


  end

  def self.remove(i)

    items = Item.all
    header = "id,Name,price,quantity,brand,description,size,type,color,storage"
    file = "./db/data.csv"

    File.open(file, "w") do |csv|
      csv << header
      items.each do |item|
      
        if item.id.to_i < i.to_i
          csv << "\n"
          csv << item.id
          csv << ","
          csv << item.name
          csv << ","
          csv << item.price
          csv << ","
          csv << item.quantity
          csv << ","
          csv << item.brand
          csv << ","
          csv << item.description
          csv << ","
          if item.type == "shoe" || item.type == "poster" || item.type == "hard drive"
            csv << item.size
          end
          csv << ","
          csv << item.type
          csv << ","
          csv << item.color
          csv << ","
          if item.type == "hard drive"
            csv << item.storage
          end
          csv << ","
          csv << item.author
          csv << ","
          if item.author == "user"
            csv << item.phone
          end
        elsif item.id.to_i > i.to_i
          csv << "\n"
          csv << item.id.to_i - 1
          csv << ","
          csv << item.name
          csv << ","
          csv << item.price
          csv << ","
          csv << item.quantity
          csv << ","
          csv << item.brand
          csv << ","
          csv << item.description
          csv << ","
          if item.type == "shoe" || item.type == "poster" || item.type == "hard drive"
            csv << item.size
          end
          csv << ","
          csv << item.type
          csv << ","
          csv << item.color
          csv << ","
          if item.type == "hard drive"
            csv << item.storage
          end
          csv << ","
          csv << item.author
          csv << ","
          if item.author == "user"
            csv << item.phone
          end
        end
      end
    
    end
  end

end