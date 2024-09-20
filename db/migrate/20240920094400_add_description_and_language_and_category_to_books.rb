class AddDescriptionAndLanguageAndCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :description, :text
    add_reference :books, :language, null: false, foreign_key: true
    add_reference :books, :category, null: false, foreign_key: true
  end
end

