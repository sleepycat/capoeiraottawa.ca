class GcsjasController < ApplicationController

  #we are breaking from the conventions here so filter_resource_access will not work:
  filter_access_to :edit, :update

  def show
    @gcsja = Gcsja.first
    @attr = params[:attr]
    #these are methods of ApplicationController used to fill the sidebars. 
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
    @attr = params[:attr]

    respond_to do |format|
      if @gcsja.update_attributes(params[:gcsja])
        format.html { redirect_to(gcsja_show_path(:attr => params[:attr]), :notice => I18n.t('successfully_updated')) }
        format.xml  { head :ok }
      else
        format.html do 
          #render :template => "gcsjas/#{params[:attr]}.html.haml"
          render :action => :edit
        end
      end
    end
  end

end
