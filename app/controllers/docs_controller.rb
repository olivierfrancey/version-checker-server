class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]
  before_action :save_my_previous_url, only: [:new, :edit]

  def save_my_previous_url
    session[:my_previous_url] = URI(request.original_url).path
  end

  # GET /docs
  # GET /docs.json
  def index
    @docs = Doc.all
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
    @doc = Doc.find(params[:id])
    respond_to do |format|
      msg = { :status => "ok", :doc => @doc }

      format.json  { render :json => msg }
    end
  end

  # GET /docs/new
  def new
    @doc = Doc.new
    @groups = Group.all
  end

  # GET /docs/1/edit
  def edit
    if @doc.encrypted_id.present?
      @img_path = File.join('qr-codes', @doc.encrypted_id) + '.png'
    end
  end

  # POST /docs
  # POST /docs.json
  def create

    @doc = Doc.new(doc_params)

    respond_to do |format|
      if @doc.save
        # get new insertion ID
        d = Doc.order("created_at").last
        encrypted_id = SecureRandom.hex(17)
        d.update({encrypted_id: encrypted_id})
        # generate QR-code
        # require 'rqrcode'
        qrcode = RQRCode::QRCode.new(encrypted_id)
        image_path = File.join(Rails.root, 'app/assets/images/qr-codes', encrypted_id) + '.png'
        File.open(image_path, 'wb') {|f| f.write qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 200,
          border_modules: 1,
          module_px_size: 6,
          file: nil # path to write
        )}

        format.html { redirect_to docs_path, notice: 'Doc was successfully created.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    respond_to do |format|
      if @doc.update(doc_params)
        format.html { redirect_to docs_path, notice: 'Doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to docs_url, notice: 'Doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = Doc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:id, :group_id, :doc_id, :number, :title, :last_version, :sub_title, :version, :doc_date, :author, :doc_type, :size)
    end

end
