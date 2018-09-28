class InquiriesController < ApplicationController
  def new
    @house_id = params[:id]
    @house_hunter_id = session[:id][0]
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    respond_to do |format|
    if @inquiry.save
      format.html { redirect_to homepage_url , notice: 'Inquiry was successfully sent' }
    else
      format.html { redirect_back notice: 'Error' }
    end
    end

  end


  private
  def inquiry_params
    params.require(:inquiry).permit(:house_id,  :message_content,  :subject , :house_hunter_id )
  end
end
