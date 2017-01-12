class AddPortfolioImageToItems < ActiveRecord::Migration
  def change
    add_column :items, :portfolio_image, :string
  end
end
