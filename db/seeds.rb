# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Création d'utilisateurs de test
users = User.create!([
  { email: "user1@example.com", password: "password", first_name: "Alice", last_name: "Dupont", address: "123 Rue de Paris", phone_number: "0123456789" },
  { email: "user2@example.com", password: "password", first_name: "Bob", last_name: "Martin", address: "456 Rue de Lyon", phone_number: "9876543210" }
  # Ajoutez d'autres utilisateurs ici si nécessaire
])

# Création de flats de test
flats = Flat.create!([
  { address: "123 Main Street, Example City", description: "A lovely two-bedroom flat...", price: 250000.0, size: 80, room: 2, user: users.first },
  { address: "456 Elm Street, Sampletown", description: "Spacious three-bedroom flat...", price: 320000.0, size: 120, room: 3, user: users.second }
  # Ajoutez d'autres flats ici si nécessaire
])

# Création de réservations de test
reservations = Reservation.create!([
  { price: 200.0, user: users.first, flat: flats.first, start_of_reservation: Date.today, end_of_reservation: Date.today + 5 },
  { price: 250.0, user: users.second, flat: flats.second, start_of_reservation: Date.today, end_of_reservation: Date.today + 3 }
  # Ajoutez d'autres réservations ici si nécessaire
])
