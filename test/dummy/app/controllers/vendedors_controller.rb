class VendedorsController < ApplicationController
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /vendedors
  def index
    @vendedors = Vendedor.all
  end

  # GET /vendedors/1
  def show
  end

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedors/1/edit
  def edit
  end

  # POST /vendedors
  def create
    @vendedor = Vendedor.new(vendedor_params)

    if @vendedor.save
      redirect_to @vendedor, notice: 'Vendedor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vendedors/1
  def update
    if @vendedor.update(vendedor_params)
      redirect_to @vendedor, notice: 'Vendedor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vendedors/1
  def destroy
    @vendedor.destroy
    redirect_to vendedors_url, notice: 'Vendedor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendedor_params
      params.require(:vendedor).permit(:nome)
    end
end
