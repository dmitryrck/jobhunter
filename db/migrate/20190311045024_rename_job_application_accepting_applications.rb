class RenameJobApplicationAcceptingApplications < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_applications, :still_acceptign_applications, :accepting_applications
  end
end
