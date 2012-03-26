class CreatePartenaires < ActiveRecord::Migration
  def change
    create_table :partenaires do |t|
      t.string :titre
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
