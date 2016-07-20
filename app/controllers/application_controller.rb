class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate
  skip_before_action :verify_authenticity_token

protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      puts 'get_authentication_username'
      puts get_authentication_username
      puts decode username
      decode(username) == get_authentication_username && decode(password) == get_authentication_password
    end
  end

  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  ENCODING = "MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w"
  
  def encode(text)
    return text.tr(ALPHABET, ENCODING)
  end

  def decode(text)
    return text.tr(ENCODING, ALPHABET)
  end

  def get_authentication_username
    BasicAuthenticationInfo.last['username']
  end

  def get_authentication_password
    BasicAuthenticationInfo.last['password']
  end

  def authentication_url 
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3030/"
    "http://#{username}:#{password}@nadastore-authentication.herokuapp.com/"
  end 

  def nadastore_url 
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3000/"
    "http://#{username}:#{password}@nadastore.herokuapp.com/"
  end 

  def cart_url
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3040/"
    "http://#{username}:#{password}@nadastore-cart.herokuapp.com/"
  end 
  
  def store_url 
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3050/"
    "http://#{username}:#{password}@nadastore-store.herokuapp.com/"
  end 
  
  def review_url 
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3060/"
    "http://#{username}:#{password}@nadastore-review.herokuapp.com/"
  end 
  
  def order_url 
    username = encode get_authentication_username
    password = encode get_authentication_password
    # "http://#{username}:#{password}@localhost:3070/"
    "http://#{username}:#{password}@nadastore-order.herokuapp.com/"
  end 
end

