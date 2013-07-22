get '/deck/new' do
  @decks = Deck.all
  erb :'/deck/new'
end

get '/deck/new/:question' do
  @question = Deck.find_by_question(params[:question])
  @current_user = current_user 
  erb :'/deck/new'
end

get '/deck/update' do 
  @decks = Deck.all
  erb :'/deck/update'
end

post '/deck/update' do
  @current_deck = Deck.find_by_title(deck[:title])
  redirect to("/deck/#{@current_deck.id}")
end

get '/deck/update/:deck' do
  @current_deck = Deck.find(params[:deck])
  @current_card = @current_deck.cards.find_by_question(card[:question])
  erb :'/deck/update'
end


get '/deck/new/:question' do
  erb :'/deck/new'
end  


