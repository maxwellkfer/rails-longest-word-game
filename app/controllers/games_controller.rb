class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    word = params[:word].upcase
    letters = letters[:letters].split

    @result
    if all_letters_included?(letters, answer)
      'Yeah!'
    else
      'Nop...'
    end

  end

  private

  def all_letters_included?(letter, word)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
