class PagesController < ApplicationController

  def show
    #@page = $redis[params[:page]]
    @page = {title: "foo", content: "bar"}
  end
end
