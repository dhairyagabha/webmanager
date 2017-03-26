class CreateWebmanagerFormResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :webmanager_form_responses do |t|
      t.integer :form_id
      t.text :response

      t.timestamps
    end
  end
end
