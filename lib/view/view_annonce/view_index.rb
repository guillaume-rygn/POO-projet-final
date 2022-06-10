class View_Annonce_Index 
  def index(array)
    i = 1
    array.each do |item|
      if item.author == "user"
        puts "#{i} - #{item.name} - type :#{item.type}"
        i = i + 1
      end
    end
  end
end