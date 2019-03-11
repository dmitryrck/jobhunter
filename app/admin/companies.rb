ActiveAdmin.register Company do
  permit_params :name, :website, :linkedin_url, :location

  index do
    selectable_column

    id_column

    column :name
    column :location
    column :website do |record|
      if record.website
        link_to record.website, record.website
      end
    end
    column :linkedin_url do |record|
      if record.linkedin_url
        link_to record.linkedin_url, record.linkedin_url
      end
    end

    actions
  end

  form do |f|
    inputs t("active_admin.details", model: resource_class) do
      input :name, input_html: { autofocus: true }
      input :location
      input :website
      input :linkedin_url
    end

    actions
  end

  show do
    attributes_table do
      row :name
      row :location
      row :website do |record|
        if record.website
          link_to record.website, record.website
        end
      end
      row :linkedin_url do |record|
        if record.linkedin_url
          link_to record.linkedin_url, record.linkedin_url
        end
      end
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
