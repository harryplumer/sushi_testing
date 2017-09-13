class RemoveDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:sushi_rolls, :spicy, nil)
  end
end
