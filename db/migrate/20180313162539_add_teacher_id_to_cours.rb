class AddTeacherIdToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :teacher_id, :integer

  end
end
