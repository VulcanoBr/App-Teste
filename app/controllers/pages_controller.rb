class PagesController < ApplicationController

    def index
        
    end

    def search
        if params[:q].blank?
            redirect_to(pages_path, notice: "Search esta vazio") and return
        else
            @parameter = params[:q].downcase
            @results = Car.joins(:user).where('lower (users.name) LIKE ?', "%#{@parameter}%").order("users.name DESC")
         #   @results = Car.joins(:user).where('users.name LIKE ?', "%#{params[:q]}%").order("users.name DESC")
         #   @results = Car.joins(:user).where(params[:q]).order("users.name DESC")
         # @results = Client.where('name LIKE ?', "%#{params[:q]}%")
        end
    end


end