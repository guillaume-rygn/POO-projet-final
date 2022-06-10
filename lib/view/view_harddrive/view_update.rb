require_relative '../view'

class View_Update_Harddrive < View
  def update_item(id)
    harddrive = Harddrive.find(id)

    property = item_property
    puts "\n\n Quel est la taille de votre disque dur ? (en pouce)"
    print "> "
    size = gets.chomp.to_i

    until size >= 0 || size.is_number? do
      print "Merci de rentrer une taille valide:\n"
      print "> "
      size = gets.chomp.to_i
    end

    puts "\n\n Quel est la capacité de stockage de votre disque dur ? (en TB)"
    print "> "
    storage = gets.chomp.to_i

    until storage >= 0 || size.is_number? do
      print "Merci de rentrer une taille valide:\n"
      print "> "
      storage = gets.chomp.to_i
    end

    if harddrive.author == "user"
      phone = phone()
      return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB", author: "user", phone: phone}
    else
      return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB"}
    end
  end
end