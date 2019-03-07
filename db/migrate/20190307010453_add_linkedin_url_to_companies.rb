class AddLinkedinUrlToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :linkedin_url, :string
  end
end
