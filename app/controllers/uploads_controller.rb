class UploadsController < ApplicationController

  @id = ''
  
  def new
    @id = params[:id]
  end

  def create
    require 'fileutils'
    file_path = File.join(Rails.root, 'public/files/upload', params[:file].original_filename)
    File.open(file_path, 'w')
    
    d = Doc.find(@id)
    d.update({file_name: file_path})

    redirect_to session[:my_previous_url]
  end
end
