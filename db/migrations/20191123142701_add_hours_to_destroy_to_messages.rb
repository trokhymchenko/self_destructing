Hanami::Model.migration do
  change do
    alter_table :messages do
      add_column :hours_to_destroy, Integer
    end
  end
end
