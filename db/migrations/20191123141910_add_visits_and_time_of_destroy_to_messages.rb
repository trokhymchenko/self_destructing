Hanami::Model.migration do
  change do
    alter_table :messages do
      add_column :time_of_destroy, DateTime
      add_column :visits_limit, Integer
      add_column :visits_count, Integer, default: 0
    end
  end
end
