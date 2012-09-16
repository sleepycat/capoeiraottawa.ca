class LocationsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  def index
    @locations = Location.all
    @locations.each{|loc| loc.practices}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @locations.to_json }
      format.xml  { render :xml => @locations }
    end
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html do
        @location.practices
        render :partial => 'show', :layout => false
      end
      format.xml  { render :xml => @location }
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html { render :layout => 'application'}
      format.xml  { render :xml => @location }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to(locations_url, :notice => I18n.t('locations.created_success')) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

end
