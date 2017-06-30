class UploadsController < ApplicationController
  require "prawn/measurement_extensions"
  
  def new
    @id = params[:id]
  end

  def create
    @id = params[:id]
    #require 'fileutils'
    file_path = File.join(Rails.root, 'public/files/upload', params[:file].original_filename)
    file_path_coded = File.join(Rails.root, 'public/files/upload', 'coded_'+params[:file].original_filename)
    File.open(file_path, 'w')
    
    d = Doc.find(@id)
    d.update({file_name: file_path})
    
    #add qr-code to pdf
    qrcode_path = File.join(Rails.root, 'app/assets/images/qr-codes', d.encrypted_id) + '.png'
    
    pdf = Prawn::Document.new(:page_size => 'A1', :page_layout => :landscape)
    pdf.image qrcode_path, :at => [(790.5).send(:mm)-(0.5*72), (102.9).send(:mm)-(0.5*72)], :width => 40.send(:mm)
    pdf_data = pdf.render()
    
    p file_path
    p file_path.to_s
    
    pdf_comb = CombinePDF.new
    pdf_comb << CombinePDF.parse(pdf_data)
    pdf_comb << CombinePDF.load(file_path)
    pdf_comb.save file_path_coded

    redirect_to session[:my_previous_url]
  end
end
