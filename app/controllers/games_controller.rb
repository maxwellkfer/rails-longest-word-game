class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    word = params[:word]
    @score =
      if @letters.include?(word)
        "yeah!"
      else
        "Nop..."
      end
  end
end
