class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :get_users, only: [:new, :edit]

  # GET /cars
  # GET /cars.json
  def index
    #cars = Car.new
    @cars = Car.search(params[:search])

  ##  if params[:search].blank?
  ##    @cars = Car.all
  ##  else
  ##    @parameter = params[:search].downcase
  #    @results = Car.joins(:user).where('lower (users.name) LIKE ?', "%#{@parameter}%").order("users.name DESC")
  #   @results = Car.joins(:user).where('users.name LIKE ?', "%#{params[:q]}%").order("users.name DESC")
  #   @results = Car.joins(:user).where(params[:q]).order("users.name DESC")
  ##    @cars = Car.where('lower(name) LIKE ?', "%#{@parameter}%")
  ##  end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new

  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:name, :brand, :model, :user_id, :q)
    end

    def get_users
      @users = User.all.collect { |user| [user.name, user.id] }
    end

    def get_cars
        if params[:name]
          arr = params[:name]
          
          @carname =  arr
        else
          @carname = "teste"
        end
    end


    
end
