class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @page = Page.find_by_sort_order(0)
    if @page.nil?
      @page_requested = params[:page]
      render 'shared/404', status: 404
    else
      render action: :show
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find_by_title(params[:page])
    if @page.nil?
      @page_requested = params[:page]
      render 'shared/404', status: 404
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find_by_title(params[:page])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    if @page.save
      flash[:info]= t('pages.create.success')
      redirect_to action: "show", page: @page.title
    else
      render action: "new"
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    puts params.inspect
    @page = Page.find_by_title(params[:page_title])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find_by_title(params[:page])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
