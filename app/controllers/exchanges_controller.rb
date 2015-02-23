class ExchangesController < ApplicationController

  load_and_authorize_resource

  def index
    @exchanges = Exchange.all
  end


  def new
  	@exchange = Exchange.new(listing_id: params[:listing_id], user_id: params[:user_id])
  end

  def edit
    @exchange = Exchange.find(params[:id])
  end

  def create
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      redirect_to exchanges_path, notice: "Succesfully bought book!"
    else
      render 'new', notice: "Error: Cannot complete purchase."
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    if @exchange.update(exchanges_params)
      redirect_to exchanges_path, notice: 'Exchange Transaction was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy unless @exchange.nil?
    redirect_to exchanges_path
  end

private
  def exchange_params
    params[:exchange].permit(:listing_id, :user_id)
  end

end
