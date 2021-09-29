class CreateDnsRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :dns_records do |t|
      t.string :ip

      t.timestamps
    end
    add_index :dns_records, :ip
  end
end
