class ContainerNavigationsController < ApplicationController
  # GET /container_navigations
  # GET /container_navigations.json
  def index
    @container_navigations = ContainerNavigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @container_navigations }
    end
  end

  # GET /container_navigations/1
  # GET /container_navigations/1.json
  def show
    @container_navigation = ContainerNavigation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @container_navigation }
    end
  end

  # GET /container_navigations/new
  # GET /container_navigations/new.json
  def new
    @container_navigation = ContainerNavigation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @container_navigation }
    end
  end

  # GET /container_navigations/1/edit
  def edit
    @container_navigation = ContainerNavigation.find(params[:id])
  end

  # POST /container_navigations
  # POST /container_navigations.json
  def create
    @container_navigation = ContainerNavigation.new(params[:container_navigation])

    respond_to do |format|
      if @container_navigation.save
        format.html { redirect_to @container_navigation, notice: 'Container navigation was successfully created.' }
        format.json { render json: @container_navigation, status: :created, location: @container_navigation }
      else
        format.html { render action: "new" }
        format.json { render json: @container_navigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /container_navigations/1
  # PUT /container_navigations/1.json
  def update
    @container_navigation = ContainerNavigation.find(params[:id])

    respond_to do |format|
      if @container_navigation.update_attributes(params[:container_navigation])
        format.html { redirect_to @container_navigation, notice: 'Container navigation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @container_navigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /container_navigations/1
  # DELETE /container_navigations/1.json
  def destroy
    @container_navigation = ContainerNavigation.find(params[:id])
    @container_navigation.destroy

    respond_to do |format|
      format.html { redirect_to container_navigations_url }
      format.json { head :no_content }
    end
  end
end
