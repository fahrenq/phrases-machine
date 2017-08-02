class PhrasesController < ApplicationController
  # before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  # GET /
  def index
  end

  # GET /random_phrase
  # GET /random_phrase.json
  def random
    # Get the presented phrases, in order to present always new phrases
    total_phrases = Phrase.count
    if cookies[:phrases_ids].blank?
      @phrase = Phrase.find(rand(1..total_phrases))
      @available = total_phrases - 1
    else
      viewed_ids = cookies[:phrases_ids].split(",").map(&:to_i)
      id = ([*1..total_phrases] - viewed_ids).sample
      if id.is_a? Integer
        @phrase = Phrase.find(id)
      end
      @available = total_phrases - viewed_ids.count
    end

    respond_to do |format|
      format.json do
        if @phrase
          render :show, status: :ok
        else
          head 422
        end
      end
    end
  end
end
