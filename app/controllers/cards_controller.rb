class CardsController < ApplicationController
  expose :card, attributes: :card_attributes

  def new
    5.times { card.words.build }
  end

  def create
    binding.pry
  end

  def edit
  end

  def destroy
  end

  private
    def card_attributes
      params.require(:card).permit(:title, words_attributes: [:value])
    end
end
