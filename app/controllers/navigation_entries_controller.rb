class NavigationEntriesController < ApplicationController
  # GET /navigation_entries
  # GET /navigation_entries.json
  def index
    @navigation_entries = NavigationEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @navigation_entries }
    end
  end

  # GET /navigation_entries/1
  # GET /navigation_entries/1.json
  def show
    @navigation_entry = NavigationEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @navigation_entry }
    end
  end

  # GET /navigation_entries/new
  # GET /navigation_entries/new.json
  def new
    @navigation_entry = NavigationEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @navigation_entry }
    end
  end

  # GET /navigation_entries/1/edit
  def edit
    @navigation_entry = NavigationEntry.find(params[:id])
  end

  # POST /navigation_entries
  # POST /navigation_entries.json
  def create
    @navigation_entry = NavigationEntry.new(params[:navigation_entry])

    respond_to do |format|
      if @navigation_entry.save
        format.html { redirect_to @navigation_entry, notice: 'Navigation entry was successfully created.' }
        format.json { render json: @navigation_entry, status: :created, location: @navigation_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @navigation_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /navigation_entries/1
  # PUT /navigation_entries/1.json
  def update
    @navigation_entry = NavigationEntry.find(params[:id])

    respond_to do |format|
      if @navigation_entry.update_attributes(params[:navigation_entry])
        format.html { redirect_to @navigation_entry, notice: 'Navigation entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @navigation_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navigation_entries/1
  # DELETE /navigation_entries/1.json
  def destroy
    @navigation_entry = NavigationEntry.find(params[:id])
    @navigation_entry.destroy

    respond_to do |format|
      format.html { redirect_to navigation_entries_url }
      format.json { head :no_content }
    end
  end
end
