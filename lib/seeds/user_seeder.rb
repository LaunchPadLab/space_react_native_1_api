module Seeds
  # simple example seeder starting with users
  class UserSeeder < Seeder

    def seed_db
      create_user
    end

    def models_to_clean
      []
    end

    def models_seeded
      [
        User
      ]
    end

    def create_user
      # user create logic here
    end
  end
end
