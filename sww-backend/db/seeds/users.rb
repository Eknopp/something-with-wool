seed User, {email: "admin@test.com"}, {
  password: "123456",
  jti: "3456789",
  username: "admin user",
  pronouns: "he/him",
  name: "Test User",
  biography: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  language: "en",
  location: "Gent, Belgium",
  preferred_currency: "EUR",
  role: "admin",
  units: "metric",
  website: "http://testuser.com"
}
seed User, {email: "local@test.com"}, {password: "123456", jti: "1234567", username: "user", pronouns: "she/her", name: "Test User"}
seed User, {email: "local2@test.com"}, {password: "234567", jti: "2345678", username: "user2", pronouns: "they/them"}
seed User, {email: "user3@test.com"}, {password: "345678", jti: "45678910", username: "user3", pronouns: "he/him", name: "User Three"}
seed User, {email: "user4@test.com"}, {password: "456789", jti: "5678901011", username: "user4", pronouns: "she/her", name: "User Four"}
seed User, {email: "user5@test.com"}, {password: "567890", jti: "789101112", username: "user5", pronouns: "they/them", name: "User Five"}

seed Pattern, {name: "Basic Scarf", user_id: User.find_by(email: "admin@test.com").id}, {
  craft_type: "knitting",
  currency: "USD",
  difficulty_rating: 2,
  first_published_date: Date.new(2021, 1, 1),
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  languages: ["en"],
  likes: 10,
  nbr_rows: 100,
  nbr_stitches: 20,
  notes: "A simple scarf pattern for beginners.",
  overall_rating: 4,
  overall_yarn_weight: "lace",
  pdf_path: "/patterns/basic_scarf.pdf",
  pictures_path: "/patterns/basic_scarf.jpg",
  price: 5.0,
  release_date: Date.new(2021, 1, 1),
  repeats: 1,
  sizes: ["XS", "S", "M", "L", "XL"],
  swatch_size: 4,
  total_yardage: 200
}
