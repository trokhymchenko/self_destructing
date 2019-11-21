Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id

      column :encrypted_text, String, null: false
      column :token,          String, null: false

      column :visits_ramaining, Integer
      column :expiration_time, DateTime

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
