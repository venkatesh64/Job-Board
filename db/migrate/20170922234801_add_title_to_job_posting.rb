class AddTitleToJobPosting < ActiveRecord::Migration[5.1]
  def change
    add_column :job_postings, :title, :string, null: false, default: ""
  end
end
