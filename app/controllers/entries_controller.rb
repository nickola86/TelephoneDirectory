class EntriesController < ApplicationController
  def index
    @entries = Entry.search(params[:filter])
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to entry_path(@entry.id), :notice => t('entry_creation_success')
    else
      render :action => 'new'
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to entry_path(@entry.id), :notice  => t('entry_update_success')
    else
      render :action => 'edit'
    end
  end
end
