class PracticesController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  # GET /practices
  # GET /practices.xml
  def index
    @practices = Practice.all

    @practices.each{|p| p.location }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @practices }
    end
  end

  # GET /practices/1
  # GET /practices/1.xml
  def show
    @practice = Practice.find(params[:id])
    @practice.location
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.xml
  def new
    @practice = Practice.new
    @locations = Location.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @practice }
    end
  end

  # GET /practices/1/edit
  def edit
    @practice = Practice.find(params[:id])
    @locations = Location.all
  end

  # POST /practices
  # POST /practices.xml
  def create
    @practice = Practice.new(params[:practice])

    respond_to do |format|
      if @practice.save
        format.html { redirect_to(practices_path, :notice => I18n.t('practices.created_success')) }
        format.xml  { render :xml => @practice, :status => :created, :location => @practice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.xml
  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to(@practice, :notice => I18n.t('practices.updated_success')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @practice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.xml
  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to(practices_url) }
      format.xml  { head :ok }
    end
  end
end
