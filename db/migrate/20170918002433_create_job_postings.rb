class CreateJobPostings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_postings do |t|
      t.references :location, foreign_key: true
      t.references :category, foreign_key: true
      t.references :job_poster, foreign_key: true
      t.integer :status, null: false, default: 0
      t.text :description
      t.datetime :posted_at, null: false

      t.timestamps
    end
  end
end
