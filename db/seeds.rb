# Contact.create!([
#   {first_name: "Elia", last_name: "Gonzalez", email: "mbe773@gmail.com", phone_number: "773-573-0235", middle_name: nil, bio: nil},
#   {first_name: "Marcos", last_name: "Torres", email: "matorres1121@gmail.com", phone_number: "773-418-1721", middle_name: nil, bio: nil},
#   {first_name: "Michelea", last_name: "Estrada", email: "shay324@gmail.com", phone_number: "773-573-7098", middle_name: nil, bio: nil},
#   {first_name: "Marcos", last_name: "Torres", email: "matorres1121@gmail.com", phone_number: "773-555-1721", middle_name: nil, bio: nil},
#   {first_name: "Michelea", last_name: "Estrada", email: "shay324@gmail.com", phone_number: "773-555-7098", middle_name: nil, bio: nil},
#   {first_name: "Elia", last_name: "Gonzalez", email: "mbe773@gmail.com", phone_number: "773-555-0235", middle_name: nil, bio: nil}
# ])


 100.times do
   first_name = Faker::Name.first_name
   last_name = Faker::Name.last_name

   contact = Contact.new(
                         first_name: first_name,
                         last_name: last_name,
                         email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
                         phone_number: Faker::PhoneNumber.phone_number
                         )

   contact.save
 end

 Group.create(name: "Chicago")
 Group.create(name: "Relative")
 Group.create(name: "School")
 Group.create(name: "Owes Me Money")

 groups = Group.all

users = User.all

Contact.all.each do |contact|
  contact.update(user_id: users.sample.id)
end

 