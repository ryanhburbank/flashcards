
class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  attr_accessor :correct, :incorrect
  has_many :decks
  has_many :rounds


  validates :first_name, presence: { message: "Must enter a first name" }, length: { in: 2..25 }
  validates :last_name, presence: { message: "Must enter a last name" }, length: { in: 2..25 }

  # validates :user_name, presence: { message: "Must have an username" }, uniqueness: { message: "Username is already taken." }, case_sensitive: false

  # validates :email_confirmation, presence: { message: "You must re-enter your email address."}
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is not a valid email address." }
  # , confirmation: { message: "Your email and re-entered email must match."}

  # validates :password_confirmation, presence: { message: "You must re-enter your password. " }
  validates :password, presence: { message: "Password cannot be empty" },
                       # confirmation: { message: "Your password and re-entered must match."},
                       length: {
                                 in: 6..15,
                                 too_short: "Password is too short, must be longer than %{value} characters long",
                                 too_long: "Password is too long, must be shorter than %{value} characters long" }

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      return @user
    else
      nil
    end
  end


  def correct_guesses
  @correct = 0
    self.rounds.each do |round|
     @correct += round.guesses.where(is_correct: true).count
    end
    @correct
  end

  def incorrect_guesses
  @incorrect = 0
    self.rounds.each do |round|
      @incorrect += round.guesses.where(is_correct: false).count
    end
    @incorrect
  end

  def correct_guesses_last_round
    self.rounds.last.guesses.where(is_correct: true).count
  end

  def incorrect_guesses_last_round
    self.rounds.last.guesses.where(is_correct: false).count
  end

  def total_percentage
    (self.correct_guesses.to_f / (self.incorrect_guesses + self.correct_guesses)).round(2)
  end
end




