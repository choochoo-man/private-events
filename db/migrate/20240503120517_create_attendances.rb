class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id
      
      t.timestamps

    end
  end
end
