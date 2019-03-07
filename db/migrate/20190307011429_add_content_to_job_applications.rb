class AddContentToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :content, :text
  end
end
