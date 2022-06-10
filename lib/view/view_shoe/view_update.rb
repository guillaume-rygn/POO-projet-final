require_relative '../view'

class View_Update_Shoe < View
  def update_item(id)
    shoe = Shoe.find(id)

    property = item_property
    puts "\n\n Quel est la taille de la chaussure ?"
    print "> "
    size = gets.chomp

    while size.length == 0 || size.to_f <= 0 do
      print "Merci de rentrer une quantité valide:\n"
      print "> "
      size = gets.chomp
    end

    if shoe.author == "user"
      phone = phone()
      return params = {id: shoe.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size.to_i, type: "shoe", color: property[5], storage: "", author: "user", phone: phone}
    else
      return params = {id: shoe.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size.to_i, color: property[5] }
    end
  end
end