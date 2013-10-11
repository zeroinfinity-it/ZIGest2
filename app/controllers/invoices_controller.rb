class InvoicesController < ApplicationController
  before_action :signed_in_user, only: [:create,:destroy]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create

  	@invoice = current_user.invoices.build(invoice_params)
    if @invoice.save
      flash[:success] = "Fattura creata!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end

  end

  def destroy
    @invoice.destroy
    redirect_to root_url
  end


  private

    def invoice_params
      params.require(:invoice).permit(:oggetto, :descrizione, :importo)
    end

    def correct_user
      @invoice = current_user.invoices.find_by(id: params[:id])
      redirect_to root_url if @invoice.nil?
    end
end