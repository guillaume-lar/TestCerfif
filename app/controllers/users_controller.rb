class UsersController < ApplicationController

    

    def new
        @user = User.new
    end

    def show
        @user = current_user
        @flats = Flat.where(user: current_user)
        @reservations = Reservation.where(flat_id: @flat.pluck(:id))
        @resers = Reservation.where(user: current_user)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path, notice: 'Utilisateur créé avec succès!'
        else
            render :new
        end
    end

    def reservations
        @user = User.find(params[:user_id])
        @reservations = @user.reservations
    end

    def all_reservations
        puts "Entering all_reservations action"
        @user = current_user
        @reservations = @user.reservations
  puts "Number of reservations: #{ @reservations.count }"
    end


    private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
