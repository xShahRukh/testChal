class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
	    t.json :data, null: false, default: '{}'
		t.timestamps
    end
  end
end
