module Submission::Creation
  def create_submission(params)
    project = Project.find(params[:submission][:project])
    study = Study.find(params[:submission][:study])
    submission_template = SubmissionTemplate.find(params[:submission][:submission_template])
    submission = api.submission_template.find(submission_template.uuid).submissions.create!(:project => project.uuid, :study => study.uuid)
    
    submission
  end
end
