class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to @produto, notice: 'Produto was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      redirect_to @produto, notice: 'Produto was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
    redirect_to produtos_url, notice: 'Produto was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def produto_params
      params.require(:produto).permit(:nome)
    end
end
