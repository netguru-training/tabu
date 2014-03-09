class CardsController < ApplicationController
  expose :card, attributes: :card_attributes

  def new
    5.times { card.words.build }
  end

  def create
    if card.save
      redirect_to card
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def show
    
  end

  private
    def card_attributes
      params.require(:card).permit(:title, words_attributes: [:value])
    end
end
