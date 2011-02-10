class BulkPlatesController < ApplicationController
  include Submission::Creation

  def new
  end

  def create
    bulk_create_plate_submissions(params[:submission])
    
    respond_to do |format|
        format.html { redirect_to(submissions_path()) }
    end
  end

end
