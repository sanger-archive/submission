module Submission::Creation
  def create_submission(params)
    project = Project.find(params[:submission][:project])
    study = Study.find(params[:submission][:study])
    submission_template = SubmissionTemplate.find(params[:submission][:submission_template])
    submission = create_submission(submission_template.uuid, project.uuid, study.uuid)
    
    submission
  end
  
  def create_submission(submission_template_uuid, project_uuid, study_uuid)
     api.submission_template.find(submission_template_uuid).submissions.create!(:project => project_uuid, :study => study_uuid)
  end
  
  def bulk_create_plate_submissions(options)
    project = Project.find(options[:project])
    submission_template = SubmissionTemplate.find(options[:submission_template])
    studies_to_plate_barcodes = Warehouse::Plate.find_studies_to_well_uuids_from_barcodes(options[:plate_barcodes])

    studies_to_plate_barcodes.each do |study_uuid, well_uuids|
      submission = create_submission(submission_template.uuid, project.uuid, study_uuid)

      if submission
        LocalSubmission.find_or_create_by_uuid(submission.uuid)
        submission.update_attributes!(:assets => well_uuids)
        begin
          submission.submit!
        rescue StandardError => exception
          # not an exception, its created but not processed
        end
      end
    end
  end
  
end
