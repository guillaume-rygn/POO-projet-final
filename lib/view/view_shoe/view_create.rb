require_relative '../view'

class View_Create_Shoe < View
  def create_item

    id = Item.all.length
    id = id + 1

    property = item_property()
    puts "\n\n Quel est la taille de la chaussure ?"
    print "> "
    size = gets.chomp.to_i

    until size >= 0 || size.is_number? do
      print "Merci de rentrer une quantité valide:\n"
      print "> "
      size = gets.chomp.to_i
    end

    return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "shoe", color: property[5]}

  end
end