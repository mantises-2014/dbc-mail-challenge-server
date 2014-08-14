class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from, :subject, :received, :return_path, :importance,
      :priority, :sensitivity
      t.text :body
      t.belongs_to :email_address
    end
  end
end
