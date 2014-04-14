class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :img_src
      t.string :acv_comment
      t.integer :width
      t.integer :height
      t.integer :size

      t.timestamps
    end
  end
end
