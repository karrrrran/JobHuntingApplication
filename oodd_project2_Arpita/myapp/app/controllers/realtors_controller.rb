class RealtorsController < ApplicationController

  def new
    @realtor = Realtor.new
  end

  def create
    puts "Reacheddddddddddddddddddddddddd"
    #@company = {params[:company_name] }
    puts "testtttttttttttttttttt"
    @realtor = Realtor.new(signup_params)
     if @realtor.save
       redirect_to  root_path
     else
       render 'new'
     end

  end

  def show

  end
  def index
    @realtor = Realtor.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @realtor }
    end
  end

  def edit_company
  end
  def save_company
    @realtor = Realtor.find_by(id: session[:id])
    puts @realtor.email
    puts params[:company_id]
    puts "1"
    hash = params.require(:company).permit(:company_id)
    @realtor.real_estate_company_id = hash["company_id"]
    if @realtor.save
      redirect_to "/homepage", alert: "Company updated!"
    end

  end


  private
  def signup_params
    params.require(:realtor).permit(:email,  :password,  :name , :phone)
  end
end
