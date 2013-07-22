
def current_user
  @current_user ||= User.find_by_id(session[:id])
end

def find_stats(current_user)
  @correct = current_user.correct_guesses
  @incorrect = current_user.incorrect_guesses
  @correct_guesses_last_round = current_user.correct_guesses_last_round
  @incorrect_guesses_last_round = current_user.incorrect_guesses_last_round
  @percentage = current_user.total_percentage
end

def logged_in?
  !current_user.nil?
end