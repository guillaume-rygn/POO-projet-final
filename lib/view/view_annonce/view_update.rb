require_relative '../view'

class View_Update_Annonce < View
  def buy_item(id)
    item = Item.find(id)
    if item.quantity.to_i == 0
      puts "\n\nCet Item n'est plus en stock il a été victime de son succès"
      return
    else
      while true
        puts "\n\nConfirmez-vous ce choix ? (y/n)"
        print '> '

        choicebuy = gets.chomp.downcase

        case choicebuy 
        
        when "y"
          while true
            puts "\n\nquantité ?"
            print '> '
      
            choicequantity = gets.chomp.to_i

              if (item.quantity.to_i - choicequantity.to_i) >= 0 && choicequantity.to_i > 0
                puts "Cela fera un total de #{item.price} x #{choicequantity} = $#{total(item.price, choicequantity)}"
                while true
                  puts "\n\nConfirmez-vous ce choix ? (y/n)"
                  print '> '

                  finalchoice = gets.chomp.downcase

                  case finalchoice 
                  when "y"
                    puts "Achat confirmé"
                    newquantity = item.quantity.to_i - choicequantity.to_i
                    return newquantity
                  when"n"
                    puts "une autre quantité peut etre ?"
                    break
                  else
                    puts "Erreur veuillez reessayer"
                  end

                end
              elsif choicequantity == 0
                puts "Erreur merci de mettre une quantité valide"
              else
                puts "Pas assez de stock pour se produit veuillez réessayer" 
              end
          end
          puts "Achat confirmé"
          break
        when "n"
          puts "une prochaine fois !"
          return "n"
        else
          puts "Erreur veuillez reessayer"
        end
      end
    end
  end
end