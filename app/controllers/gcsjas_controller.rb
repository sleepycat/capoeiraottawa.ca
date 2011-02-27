class GcsjasController < ApplicationController
  # GET /gcsjas
  # GET /gcsjas.xml
# def index
#   @gcsjas = Gcsja.all
#
#   respond_to do |format|
#     format.html # index.html.erb
#     format.xml  { render :xml => @gcsjas }
#   end
# end
#
# def about
#   @gcsja = Gcsja.first
# end
#
# def welcome
#   @gcsja = Gcsja.first
# end 
#

  # GET /gcsjas/1
  # GET /gcsjas/1.xml
  def show
    @gcsja = Gcsja.first
    @attr = params[:attr]

    respond_to do |format|
      format.html {render :template => "gcsjas/#{params[:attr]}.html.haml" }# show.html.erb
      format.xml  { render :xml => @gcsja }
    end
  end

  # GET /gcsjas/new
  # GET /gcsjas/new.xml
# def new
#   @gcsja = Gcsja.new
#
#   respond_to do |format|
#     format.html # new.html.erb
#     format.xml  { render :xml => @gcsja }
#   end
# end

  # GET /gcsjas/1/edit
  def edit
    @gcsja = Gcsja.first
    @attr = params[:attr]
  end

  # POST /gcsjas
  # POST /gcsjas.xml
  def create
    @gcsja = Gcsja.new(params[:gcsja])

    respond_to do |format|
      if @gcsja.save
        format.html { redirect_to(@gcsja, :notice => 'Gcsja was successfully created.') }
        format.xml  { render :xml => @gcsja, :status => :created, :location => @gcsja }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gcsja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gcsjas/1
  # PUT /gcsjas/1.xml
  def update
    @gcsja = Gcsja.first

    respond_to do |format|
      if @gcsja.update_attributes(params[:gcsja])
        format.html { redirect_to("/#{params[:attr]}", :notice => I18n.t('successfully_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "#{params[:attr]}/edit" }
        format.xml  { render :xml => @gcsja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gcsjas/1
  # DELETE /gcsjas/1.xml
  def destroy
    @gcsja = Gcsja.find(params[:id])
    @gcsja.destroy

    respond_to do |format|
      format.html { redirect_to(gcsjas_url) }
      format.xml  { head :ok }
    end
  end
end
