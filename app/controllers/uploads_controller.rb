class UploadsController < ApplicationController

  def new
  end

  def create
    require 'fileutils'
    doc = params[:file].tempfile
    file_path = File.join(Rails.root, 'public/files/upload', params[:file].original_filename)
    File.open(file_path, 'w')

    redirect_to session[:my_previous_url]
  end
end
