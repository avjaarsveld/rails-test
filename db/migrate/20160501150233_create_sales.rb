# rails generate model sale datetime:datetime code:string value:float hashed_password
class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :datetime
      t.string :code
      t.float :value
      t.string :hashed_password

      t.timestamps null: false
    end
  end
end
