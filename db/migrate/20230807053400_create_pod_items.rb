class CreatePodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :pod_items do |t|
      t.string :vessel
      t.references :packaging_detail, null: false, foreign_key: true
      t.string :customs_document
      t.references :pod_header, null: false, foreign_key: true

      t.timestamps
    end
  end
end