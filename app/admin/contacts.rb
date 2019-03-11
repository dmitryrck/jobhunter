ActiveAdmin.register Contact do
  permit_params :name, :email, :phone

  index do
    selectable_column

    id_column

    column :name
    column :email
    column :phone

    actions
  end

  form do |f|
    inputs t("active_admin.details", model: resource_class) do
      input :name, input_html: { autofocus: true }
      input :email
      input :phone
    end

    actions
  end
end
