class HousesController < ApplicationController

  def new
    @house = House.new
    puts session[:id]
  end

  def show_houses_with_filters
    @houses = House.all
  end
  def add_to_interest_list
    @house_hunter_id = session[:id]
    details = {house_hunter_id: @house_hunter_id[0], house_id: params[:id] }
    puts details
    @interest_list = InterestList.new(details)
    if  @interest_list.save
      puts "Successssssssssss"
      redirect_back fallback_location: houses_url

    else
      puts "Unsuccessful"
      redirect_back fallback_location: houses_url,notice: 'Already present in list'
    end
  end
  def index
    puts "entered"
    @houses = House.all
    puts @houses
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end
  def create
    @house = House.new(house_params)
    @realtor = Realtor.find_by(id: session[:id] )
    @house["real_estate_company_id"]  = @realtor["real_estate_company_id"]
    puts @house["real_estate_company_id"]
    if @house.save
      redirect_to  '/homepage'
    else
      render 'new'
    end
  end


  private
  def house_params
    params.require(:house).permit(:location,  :square_footage,  :year_built , :style , :price , :number_of_floors, :basement, :current_house_owner, :contact_info_of_realtor)
  end
end
