class CreateCorses < ActiveRecord::Migration[7.0]
  def change
    create_table :corses do |t|
      t.string :name
      t.string :description
      t.string :duration

      t.timestamps
    end
  end
end
