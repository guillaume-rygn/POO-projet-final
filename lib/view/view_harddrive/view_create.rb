require_relative '../view'

class View_Create_Harddrive < View
  def create_item

    id = Item.all.length
    id = id + 1

    property = item_property
    puts "\n\n Quel est la taille de votre disque dur ? (en pouce)"
    print "> "
    size = gets.chomp.to_i

    until size >= 0 || size > 2 || size.is_number? do
      print "Merci de rentrer une taille valide:\n"
      print "> "
      size = gets.chomp.to_i
    end

    puts "\n\n Quel est la capacité de stockage de votre disque dur ? (en TB)"
    print "> "
    storage = gets.chomp

    while storage.length == 0 || storage.to_f <= 0 do
      print "Merci de rentrer une taille valide:\n"
      print "> "
      storage = gets.chomp
    end

    return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB"}
    
  end
end