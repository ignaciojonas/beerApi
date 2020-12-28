class Api::V1::StylesController < ApplicationController
  before_action :set_style, only: [:show, :update, :destroy]

  # GET /styles
  def index
    @styles = Style.all

    render json: @styles
  end

  # GET /styles/1
  def show
    render json: @style
  end

  # POST /styles
  def create
    @style = Style.new(style_params)

    if @style.save
      render json: @style, status: :created, location: api_v1_style_url(@style)
    else
      render json: @style.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /styles/1
  def update
    if @style.update(style_params)
      render json: @style
    else
      render json: @style.errors, status: :unprocessable_entity
    end
  end

  # DELETE /styles/1
  def destroy
    @style.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def style_params
      params.require(:style).permit(:name, :description)
    end
end
