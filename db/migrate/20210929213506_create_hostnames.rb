# frozen_string_literal: true

class CreateHostnames < ActiveRecord::Migration[6.1]
  def change
    create_table :hostnames do |t|
      t.string :hostname
      t.references :dns_record
      t.timestamps
    end
    add_index :hostnames, :hostname
  end
end
