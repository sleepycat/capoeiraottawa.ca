class VideosController < ApplicationController
  filter_access_to :new, :edit, :create, :destroy, :update
  respond_to :html, :json

  def index
    @videos = Video.order('created_at desc')
    respond_with @videos
  end
  
  def update
    @video = Video.find params[:id]
    if @video.update_attributes params[:video]
      flash[:notice]= t('videos.update_success') 
      respond_with @video, :location => videos_path
    else
      flash[:notice]= t('videos.update_failed') 
      respond_with @video 
    end
  end

  def show 
    @video = Video.find params[:id]
    respond_with @video
  end

  def new
    @video = Video.new
    respond_to do |format|
      format.html
      format.json do 
        @video = Youtube::Video.new params[:youtube_id]
        render :json => @video.to_h.to_json
      end
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new params[:video]
    flash[:notice] = t('videos.created_success') if @video.save
    respond_with @video
  end

  def destroy
    @video = Video.find(params[:id])
    flash[:notice] = t('videos.destroy_success') if @video.destroy
    respond_with @video, :location => videos_path
  end
end
