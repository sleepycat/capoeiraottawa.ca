class PagesController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  def index
    @page = Page.order('sort_order asc').first
    if @page.nil?
      @page = Page.create(title: "change_me",
                          content: "Replace this content with your own.",
                          sort_order: 0)
    end
    render action: :show
  end

  def show
    @page = Page.find_by_title(params[:page])
    if @page.nil?
      @page_requested = params[:page]
      render 'shared/404', status: 404
    end
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find_by_title(params[:page])
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      flash[:notice]= t('pages.create.success')
      redirect_to action: "show", page: @page.title
    else
      render action: "new"
    end
  end

  def update
    @page = Page.find_by_title(params[:page_title])

    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @page = Page.find_by_title(params[:page])
    @page.destroy
    flash[:notice]= t('pages.deletion_success')
    redirect_to index_page_path
  end

end
