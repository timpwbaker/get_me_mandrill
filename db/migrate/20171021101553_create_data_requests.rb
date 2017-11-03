class CreateDataRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :data_requests, id: :uuid do |t|
      t.inet :ip, null: false

      t.timestamps
    end
  end
end
