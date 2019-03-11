class DropJobsTable < ActiveRecord::Migration[5.2]
  def up
    add_column :job_applications, :title, :string

    execute %[
      update
        job_applications
      set
        title = jobs.title
      from
        jobs
      where
        job_applications.job_id is not null
        and job_applications.job_id = jobs.id;
    ]

    remove_column :job_applications, :job_id
    drop_table :jobs
  end

  def down
    create_table :jobs do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_column :job_applications, :job_id, :integer
    add_foreign_key :job_applications, :jobs, column: :job_id,
      primary_key: :id, name: :job_applications_job_id_fkey

    execute %[
      insert into jobs (title, created_at, updated_at)
        select distinct(title), now(), now() from job_applications;

      update
        job_applications
      set
        job_id = jobs.id
      from
        jobs
      where
        job_applications.title = jobs.title;
    ]

    remove_column :job_applications, :title
  end
end
