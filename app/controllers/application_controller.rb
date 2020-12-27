class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    private


    def not_destroyed
        #     @results = Car.joins(:user).where(params[:id])
            # raise "This account cannot be removed" 
             #end
             render json: {}, status: :unprocessable_entyty
    end

end
