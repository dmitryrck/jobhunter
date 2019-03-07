ActiveAdmin.register JobApplication do
  permit_params :company_id, :job_id, :contact_id, :website, :url,
    :date_applied, :still_acceptign_applications, :refused, :content

  form do |f|
    inputs t("active_admin.details", model: resource_class) do
      input :company
      input :job
      input :contact
      input :website
      input :url
      input :still_acceptign_applications
      input :refused
      input :date_applied, as: :string
      input :content
    end

    actions
  end
end
