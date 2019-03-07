class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :company, foreign_key: true
      t.references :job, foreign_key: true
      t.references :contact, foreign_key: true
      t.date :date_applied, null: false
      t.string :website
      t.string :url
      t.boolean :still_acceptign_applications
      t.boolean :refused

      t.timestamps
    end
  end
end
