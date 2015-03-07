class ExchangesController < ApplicationController
  load_and_authorize_resource

  def index
    @exchanges = Exchange.all.reverse
  end
  
end
