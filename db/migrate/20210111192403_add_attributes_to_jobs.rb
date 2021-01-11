class AddAttributesToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :url, :string
    add_column :jobs, :employer_name, :string
    add_column :jobs, :employer_description, :string
    add_column :jobs, :job_title, :string
    add_column :jobs, :job_description, :string
    add_column :jobs, :years_of_experience, :integer
    add_column :jobs, :educational_requirement, :string
    add_column :jobs, :industry, :string
    add_column :jobs, :base_salary, :integer
    add_column :jobs, :employment_type_id, :integer
  end
end
