class CheckerController < ApplicationController

  def show
    @doc = Doc.where encrypted_id: params[:id]
    respond_to do |format|
      msg = { :status => "ok", :doc => @doc }
      format.json  { render :json => msg }
    end
  end
end
