class ChangeColumnUserToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :user_id, null: true
    change_column_null :subscriptions, :user_id, null: true
  end
end
