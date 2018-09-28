class UsersController < ApplicationController
  def sign_in

  end

  def homepage
  end

  def logout
    reset_session
    redirect_to '/users/sign_in'
  end

  def show_all
    @realtor = Realtor.all
    @househunter = HouseHunter.all

  end

  def show_realtor
    @realtor = Realtor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @realtor }
    end
  end

  def check_credentials
    puts "entered"
    @email = params[:email]
    @password = params[:password]
    @user_type = params[:usertype]

    session[:email] = @email
    session[:user_type] = @user_type
    puts @user_type
    if request.post? and params[:email]

      if(@user_type == "realtor")
        @table_name = Realtor
      elsif (@user_type == "househunter")
        @table_name = HouseHunter
      elsif(@user_type =="admin")
        @table_name = Admin
      end
      puts @table_name.exists?(email: @email)

      if(@table_name.exists?(email: @email))
        @passwordInDB =  @table_name.where(email: @email).pluck(:password)
        puts "email present"
        if (@passwordInDB[0] == @password)
            redirect_to action: "homepage"
          end
          session[:id] = @table_name.where(email: @email).pluck(:id)
          session[:name] = @table_name.where(email: @email).pluck(:name)
        else
          redirect_back fallback_location: {action: "sign_in"}
        end
        puts  @passwordInDB[0]
        puts @password

      end
    end
  end

