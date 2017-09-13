class AddDefaultBack < ActiveRecord::Migration[5.1]
  def change
    change_column_default :sushi_rolls, :spicy, false
  end
end
