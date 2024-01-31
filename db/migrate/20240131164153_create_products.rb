class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    # create_table is a method that takes a block, and the block is going to be executed in the context of the table definition. create_table is a method of the ActiveRecord::Migration class, and it's going to create a table in the database that corresponds to the name of the class that we're in. So, in this case, it's going to create a table called products.
  
    # In create_table block uses :products symbol as the name of the table, and then it's going to define the columns of the table. The columns are defined by calling the column method, and the column method takes two arguments. The first argument is the name of the column, and the second argument is the type of the column. So, in this case, we're going to have a title column, which is going to be a string, a description column, which is going to be text, an image_url column, which is going to be a string, and a price column, which is going to be a decimal. 
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
