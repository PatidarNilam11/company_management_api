class CreateProjectClients < ActiveRecord::Migration[7.0]
  def change
    create_table :project_clients do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
