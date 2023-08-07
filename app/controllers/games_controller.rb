require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @start_time = Time.now.sec
  end

  def score
    end_time = Time.now.sec
    @total_time = end_time - params[:start_time].to_i
    @letters = params[:letters]
    @english_word = english?
    @valid_word = valid?
  end

  def index
  end

  def english?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word].downcase}"
    file_json = URI.open(url).read
    json_parsed = JSON.parse(file_json)
    json_parsed['found']
  end

  def valid?
    user_word = params[:word].upcase
    user_word.chars.all? { |letter| @letters.count(letter) >= user_word.count(letter) }
  end
end
