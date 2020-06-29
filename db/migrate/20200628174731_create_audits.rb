class CreateAudits < ActiveRecord::Migration[6.0]
  def change
    create_table :audits do |t|
      t.string :operation
      t.json :fields
      t.references :auditable, polymorphic: true
      t.references :entity, polymorphic: true

      t.datetime :created_at, null: false
    end
  end
end
