class AddRequestCount < ActiveRecord::Migration
  def change
    change_table :api_tokens do |t|
      t.integer :request_count
      t.timestamps
    end
  end
end
