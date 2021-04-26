class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
		t.text :title	#add_column으로 추가해준 부분임.
		t.text :content
		t.belongs_to :user
		
		
      t.timestamps
    end
  end
end
