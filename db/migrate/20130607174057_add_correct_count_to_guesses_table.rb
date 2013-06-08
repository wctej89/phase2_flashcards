class AddCorrectCountToGuessesTable < ActiveRecord::Migration
  def change
    add_column :guesses, :correct_count, :integer, default: 0
  end
end
