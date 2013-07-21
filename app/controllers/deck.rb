get '/deck/new' do
  @decks = Deck.all
  erb :'/deck/new'
end

get '/deck/new/:question' do
  @question = Deck.find_by_question(params[:question])
  erb :'/deck/new'
end  


