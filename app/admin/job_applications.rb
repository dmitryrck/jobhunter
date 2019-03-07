ActiveAdmin.register JobApplication do
  permit_params :company_id, :job_id, :contact_id, :website, :url,
    :date_applied, :still_acceptign_applications, :refused, :content

  form do |f|
    inputs t("active_admin.details", model: resource_class) do
      input :company
      input :job
      input :contact
      input :url
      input :still_acceptign_applications
      input :refused
      input :date_applied, as: :string
      input :content
    end

    actions
  end

  show do
    attributes_table do
      row :company
      row :company_location do |job_application|
        job_application.location
      end
      row :job
      row :contact
      row :url
      row :still_acceptign_applications
      row :refused
      row :date_applied
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
