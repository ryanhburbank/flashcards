link_website = Nokogiri::HTML(open("http://wiki.webz.cz/dict"))
links_array = []
  link_website.search("table tr td a").each do |link| 
    links_array << "http://wiki.webz.cz/dict/#{link["href"]}"
  end


links_array.each_with_index do |link, index|
  first_deck = Nokogiri::HTML(open(links_array[index]))
  first_deck = first_deck.search("body p").text
  first_deck = first_deck.split("\n")
  first_deck.shift
  first_deck.map! {|word_pair| word_pair.split("\t")}
  
  links_array[index] = links_array[index].match(/(?<=files\/).+[^(.txt)]/)[0]

  seed_deck = Deck.create(title: "#{links_array[index]}")

  first_deck.each do |word_pair| 
    next if word_pair[1].length > 255 
    card = Card.create(question: word_pair[0], answer: word_pair[1])
    seed_deck.cards << card
    seed_deck.save
  end
end
