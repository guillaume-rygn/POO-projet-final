require_relative '../view'

class View_Update_Poster < View
  def update_item(id)

    poster = Poster.find(id)

    property = item_property
    puts "\n\n Quel est la taille de votre poster ? (0,1,2)"
    print "> "
    size = gets.chomp.to_i

    until size >= 0 || size > 2 || size.is_number? do
      print "Merci de rentrer une taille valide:\n"
      print "> "
      size = gets.chomp.to_i
    end

    if poster.author == "user"
      phone = phone()
      return params = {id: poster.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", type: "poster", color: property[5], storage: "", author: "user", phone: phone}
    else
      return params = {id: poster.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", color: property[5]}
    end
  end
end