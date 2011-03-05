class GcsjasController < ApplicationController

#we are breaking from the REST conventions here so filter_resource_access will not work:
  filter_access_to :edit, :update

  def show
    @gcsja = Gcsja.first
    @attr = params[:attr]

    respond_to do |format|
      format.html {render :template => "gcsjas/#{params[:attr]}.html.haml" }# show.html.erb
      format.xml  { render :xml => @gcsja }
    end
  end


  # GET /gcsjas/1/edit
  def edit
    @gcsja = Gcsja.first
    @attr = params[:attr]
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
        format.html do 
          #TODO: This works but the URL is not correct.
          #It should be /about/edit but it is just /about 
          @attr = params[:attr]
           render :action => "edit"
        end
        format.xml  { render :xml => @gcsja.errors, :status => :unprocessable_entity }
      end
    end
  end

end
