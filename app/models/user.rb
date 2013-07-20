class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds 
  has_many :guesses

  include BCrypt

  has_many :rounds
  has_many :decks

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.create(params={})
    @user = User.new(params)
    @user.password = params[:password]
    @user.save
    @user
  end

  def self.authenticate(params)
    # can be changed to find user by anything unique, e.g. email or username
    user = User.find_by_username(params[:name])
    (user && user.password == params[:password]) ? user : nil
  end
end
