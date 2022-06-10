class View

  private 

  def is_number?
    true if Float(self) rescue false
  end

  def item_property
    puts "\n\nQuelle est le nom de votre item ?"
    print "> "
    name = gets.chomp

    while name.length > 30 || name.length < 1
      puts "\n\nMerci de rentrer un nom d'item entre 1 et 30 caractères ?"
      print "> "
      name = gets.chomp
    end

    puts "\n\n Quel est le prix de votre item ? (en dollar)"
    print "> "
    price = gets.chomp.to_i

    until price >= 0 || price.is_number? do
      print "Merci de rentrer un nombre valide:\n"
      print "> "
      price = gets.chomp.to_i
    end
    price = "$#{price}"

    puts "\n\n Quel est la quantité de votre item ?"
    print "> "
    quantity = gets.chomp.to_i

    until quantity >= 0 || quantity.is_number? do
      print "Merci de rentrer une quantité valide:\n"
      print "> "
      quantity = gets.chomp.to_i
    end

    puts "\n\nQuelle est la marque de votre item ?"
    print "> "
    brand = gets.chomp

    while brand.length > 30 || brand.length < 1
      puts "\n\nMerci de rentrer un nom d'item entre 1 et 30 caractères ?"
      print "> "
      brand = gets.chomp
    end

    puts "\n\nQuelle est la description de votre item ?"
    print "> "
    description = gets.chomp

    while description.length > 60 || description.length < 1
      puts "\n\nMerci de rentrer une description d'item entre 1 et 60 caractères ?"
      print "> "
      description = gets.chomp
    end

    puts "\n\nQuelle est la couleur de votre item ?"
    print "> "
    color = gets.chomp

    while color.length > 20 || color.length < 1
      puts "\n\nMerci de rentrer une couleur entre 1 et 20 caractères ?"
      print "> "
      color = gets.chomp
    end

    return name,price,quantity,brand,description,color
  end

  def total(price, quantity)
    numberprice = price[1..-1]
    total = numberprice.to_f * quantity
    return total.truncate(2)
  end

  def phone
    puts "\n\nQuelle est votre numéro de téléphone ?"
    print "> "
    phonenumber = gets.chomp.to_i

    until phonenumber.to_s.length == 9
      puts "\n\nMerci de rentrer un numéro de téléphone valide"
      print "> "
      phonenumber = gets.chomp.to_i
    end
    return "0#{phonenumber}"

  end

end