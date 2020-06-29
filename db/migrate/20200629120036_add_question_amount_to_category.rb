class AddQuestionAmountToCategory < ActiveRecord::Migration[6.0]
  def change
  	add_column :categories, :question_amount, :integer, default: 0
  end
end
