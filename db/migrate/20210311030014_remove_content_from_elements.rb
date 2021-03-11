class RemoveContentFromElements < ActiveRecord::Migration[6.1]
  def change
    remove_column :elements, :content
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
