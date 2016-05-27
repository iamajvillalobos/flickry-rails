class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.string :query

      t.timestamps null: false
    end
  end
end
