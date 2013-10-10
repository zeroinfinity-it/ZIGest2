class StaticPagesController < ApplicationController
  def home
  	@invoice = current_user.invoices.build if signed_in?
  	@feed_items = current_user.feed.paginate(page: params[:page])
  end

  def contatti
  end

  def help
  end
end
