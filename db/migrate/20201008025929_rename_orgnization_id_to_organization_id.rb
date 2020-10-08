class RenameOrgnizationIdToOrganizationId < ActiveRecord::Migration[6.0]
  def change
    rename_column :invitations, :orgnization_id, :organization_id
  end
end
