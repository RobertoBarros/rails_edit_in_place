User.destroy_all

USERS_COUNT = 10
random_users = HTTParty.get("https://randomuser.me/api/?results=#{USERS_COUNT}&nat=br")

random_users['results'].each_with_index do |random_user, index|

  u = User.create!( email: "test#{index}@test.com",
                    password: '123123',
                    first_name: random_user['name']['first'].capitalize,
                    last_name: random_user['name']['last'].capitalize,
                    address: random_user['location']['street'],
                    city: random_user['location']['city'],
                    state: random_user['location']['state'],
                    postcode: random_user['location']['postcode'],
                    phone: random_user['phone']
                  )


  puts "create user #{u.first_name} #{u.last_name}"
end
