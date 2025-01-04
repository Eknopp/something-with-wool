# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Enable logging of SQL statements
ActiveRecord::Base.logger = Logger.new($stdout)

def seed(model, find_or_create_by, update_with = {})
  record = model.where(find_or_create_by).first_or_initialize

  if record.update(update_with)
    record
  else
    raise "Couldn't save #{record.class} (#{record.errors.full_messages.join(", ")})"
  end
end

if !Rails.env.development?
  Rails.logger.info "Seeding disabled - not in development mode"
  return
end
 
seed User, {email: 'local@test.com'},{password:'123456'}