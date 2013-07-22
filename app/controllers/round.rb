

get '/round/:id/card/show' do
  if session[:card_ids].size > 0
    session[:current_card_id] = session[:card_ids].pop
    current_card = Card.find(session[:current_card_id])
    erb :"/round/current_card", locals: { current_card: current_card, round_id: params[:id] }
  else
    redirect to("round/#{params[:id]}/over")
  end
end

post '/round/:id/card/guess' do 
  guess = Guess.new(round_id: params[:id], card_id: session[:current_card_id], attempt: params[:attempt])
  if params[:attempt] == Card.find(session[:current_card_id]).answer
    guess.is_correct = true
  end
    guess.save
    redirect to("/round/#{params[:id]}/card/show")
end

get '/round/:id/over' do
  all_guesses = Round.find(params[:id]).guesses
  session[:card_ids] = nil
  session[:current_card_id] = nil
  erb :"round/results", locals: { all_guesses: all_guesses } 
end

get '/deck/:id' do
  current_deck = Deck.find(params[:id])
  session[:card_ids] = []
  current_deck.cards.sample(CARD_COUNT_PER_ROUND).each do |card|
    session[:card_ids] << card.id
  end
  p session[:card_ids]
  current_round = Round.new(user_id: session[:id], deck_id: current_deck.id)
  current_round.save
  p current_round.errors
  redirect to("/round/#{current_round.id}/card/show")
end