class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :standing
      t.timestamps
    end
  end
end

