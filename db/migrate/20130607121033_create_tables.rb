class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :email, :password_hash
      
      t.timestamps
    end

    create_table :rounds do |t|
      t.references :user, :deck
      
      t.timestamps
    end

    create_table :decks do |t|
      t.string     :name
      
      t.timestamps
    end

    create_table :cards do |t|
      t.string     :question, :answer
      t.boolean    :correct, default: false
      t.references :deck
      
      t.timestamps
    end

    create_table :guesses do |t|
      t.references :round, :card
      t.integer    :total_per_card
      
      t.timestamps
    end
  end
end
