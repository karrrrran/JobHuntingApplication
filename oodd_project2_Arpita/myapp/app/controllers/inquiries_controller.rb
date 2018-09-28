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


  def index
    @inquiries = Inquiry.all
    puts @inquiries
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inquiries }
    end
  end

  def current_user_inquiries
    @inquiries = Inquiry.where(house_hunter_id: session[:id][0] ).order(created_at: :desc)
    puts @inquiries
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inquiries }
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    respond_to do |format|
      if @inquiry.update_attributes(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to '/inquiries/current_user_inquiries' , notice: 'Inquiry was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  def show
    @inquiry = Inquiry.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inquiry }
    end
  end




  private
  def inquiry_params
    params.require(:inquiry).permit(:house_id,  :message_content,  :subject , :house_hunter_id )
  end
end
