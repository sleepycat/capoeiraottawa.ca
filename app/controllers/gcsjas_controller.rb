class GcsjasController < ApplicationController

#we are breaking from the REST conventions here so filter_resource_access will not work:
  filter_access_to :edit, :update

  def show
    @gcsja = Gcsja.first
    @attr = params[:attr]
    #these are methods of ApplicationController used to fill the sidebars. 
    #TODO:Find a reasonable way to do this for the other controllers:
    locations
    events
    respond_to do |format|
      format.html {render :template => "gcsjas/#{params[:attr]}.html.haml" }
    end
  end

  def edit
    @gcsja = Gcsja.first
    @attr = params[:attr]
  end


  def update
    @gcsja = Gcsja.first

    respond_to do |format|
      if @gcsja.update_attributes(params[:gcsja])
        format.html { redirect_to(gcsja_show_path(:attr => params[:attr]), :notice => I18n.t('successfully_updated')) }
        format.xml  { head :ok }
      else
        format.html do 
          @attr = params[:attr]
           render gcsja_edit_path(:attr => @attr)
        end
        format.xml  { render :xml => @gcsja.errors, :status => :unprocessable_entity }
      end
    end
  end

end
