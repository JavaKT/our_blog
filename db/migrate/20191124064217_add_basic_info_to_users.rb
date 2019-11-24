class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string 
    add_column :users, :kana, :string 
    add_column :users, :birthday, :datetime
    add_column :users, :self_info, :text
    add_column :users, :tell_no, :integer
    add_column :users, :image, :string
  end
end
