class SubmissionsController < ApplicationController
  def index
    @local_submissions = LocalSubmission.all
    Populate.new.parse_models(api)
  end
  
  def new
  end

  def create
    submission = create_submission(params)

    respond_to do |format|
      if submission
        format.html { redirect_to(edit_submission_path(submission.uuid)) }
      else
        flash[:error] = 'Failed to create submission'
        format.html { redirect_to(submissions_path) }
      end
    end
  end

  def edit
    @submission = api.submission.find(params[:id])
  end

  def update
    @submission = api.submission.find(params[:id])
    @submission.update_attributes!(:assets => params[:submission][:assets].split(/\n/))

    respond_to do |format|
      if @submission.submit!
        format.html { redirect_to(submission_path(@submission.uuid)) }
      else
        flash[:error] = 'Failed to update submission'
        format.html { redirect_to(submissions_path) }
      end
    end
  end
  
  def show
    @submission = api.submission.find(params[:id])
  end

end
