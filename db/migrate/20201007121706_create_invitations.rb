class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :code
      t.integer :used_by_user_id
      t.integer :invited_by_user_id
      t.datetime :expire_at
      t.integer :orgnization_id

      t.timestamps
    end
  end
end
