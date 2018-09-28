class HouseHuntersController < ApplicationController
  def new
    @house_hunters = HouseHunter.new
  end


  def create
    #@company = {params[:company_name] }
    @house_hunters = HouseHunter.new(signup_params)
    if @house_hunters.save
      redirect_to  root_path
    else
      render 'new'
    end

  end



  private
  def signup_params
    params.require(:house_hunter).permit(:email,  :password,  :name , :phone , :contact_method)
  end
end
