require 'open-uri'
require 'json'

class LongestWordController < ApplicationController
  def generate_grid(grid_size)
    # TODO: generate random grid of letters
    letters = ("a".."z").to_a
    grid1 = []
    grid_size.times do
      grid1 << letters.sample
    end

    return grid1
  end
  def game
    randomnumber = 5 + rand(14)
    @final_grid = generate_grid(randomnumber)
  end


  def score
    # check if that series of letter is in the grid
    word = params[:word]
    grid_back = params[:grid_back]
    word_array = word.split("")
    word_array.each do |compare|
      check = grid_back.include? compare
      if check == false
        flash[:notice] = "your word can't be made out of the letters given, try again mate"
        redirect_to game_path
        return
      end
   end

    url = "http://api.wordreference.com/0.8/80143/json/enfr/#{word}"
    dictionary_serialized = open(url).read
    if dictionary_serialized.include? "term0"
      dictionary = JSON.parse(dictionary_serialized)
    else
      flash[:notice2] = "This collection of letters does not constitute a word, try again mate"
      redirect_to game_path
    end

    end_time = Time.now
    puts "end time"
    puts end_time.to_i
    puts
    puts "start time"
    puts params[:start_time].to_i
    @time_taken = end_time.to_i - params[:start_time].to_i


    @score = (word.length * 10) - (@time_taken.to_i * 3)
  end
end


# check if it is a word

