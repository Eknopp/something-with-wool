default_user = User.first || User.create!(name: "Default User", email: "default@example.com", password: "password")

15.times do |i|
  seed Yarn,
       {name: "Yarn #{i + 1}", brand_name: "Brand #{(i % 5) + 1}"},
       {fibers: "Wool", meterage: 100.0 + i, unit_weight: 50.0, weight: "Fine", user_id: default_user.id}
end
