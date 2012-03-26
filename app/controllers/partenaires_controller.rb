class PartenairesController < ApplicationController
  # GET /partenaires
  # GET /partenaires.json
  def index
    @partenaires = Partenaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partenaires }
    end
  end

  # GET /partenaires/1
  # GET /partenaires/1.json
  def show
    @partenaire = Partenaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partenaire }
    end
  end

  # GET /partenaires/new
  # GET /partenaires/new.json
  def new
    @partenaire = Partenaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partenaire }
    end
  end

  # GET /partenaires/1/edit
  def edit
    @partenaire = Partenaire.find(params[:id])
  end

  # POST /partenaires
  # POST /partenaires.json
  def create
    @partenaire = Partenaire.new(params[:partenaire])

    respond_to do |format|
      if @partenaire.save
        format.html { redirect_to @partenaire, notice: 'Partenaire was successfully created.' }
        format.json { render json: @partenaire, status: :created, location: @partenaire }
      else
        format.html { render action: "new" }
        format.json { render json: @partenaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partenaires/1
  # PUT /partenaires/1.json
  def update
    @partenaire = Partenaire.find(params[:id])

    respond_to do |format|
      if @partenaire.update_attributes(params[:partenaire])
        format.html { redirect_to @partenaire, notice: 'Partenaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partenaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partenaires/1
  # DELETE /partenaires/1.json
  def destroy
    @partenaire = Partenaire.find(params[:id])
    @partenaire.destroy

    respond_to do |format|
      format.html { redirect_to partenaires_url }
      format.json { head :no_content }
    end
  end
end
