class CreateApes < ActiveRecord::Migration[6.1]
  def change
    create_table :apes do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
