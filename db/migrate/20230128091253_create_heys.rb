class CreateHeys < ActiveRecord::Migration[7.0]
  def change
    create_table :heys do |t|

      t.timestamps
    end
  end
end
