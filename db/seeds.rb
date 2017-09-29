
User.delete_all
user_1 = User.create({
  first_name: "Chanel",
  last_name: "Sparks",
  about_me: "I LOVE DOGS!!",
  address: "225 Geary St.",
  city: "San Francisco",
  state: "CA",
  zip: "94108",
  email: "csparks@unkown.com",
  password: "pizzaa",
})

user_2 = User.create({
  first_name: "Ashley",
  last_name: "Sparks",
  about_me: "DOGS ARE THE BEST",
  address: "1230 Grant Ave",
  city: "San Francisco",
  state: "CA",
  zip: "94133",
  email: "asparks@unkown.com",
  password: "pizzaa",
})

user_3 = User.create({
  first_name: "Janet",
  last_name: "Sparks",
  about_me: "MY DOG IS MY BEST FRIEND",
  address: "39 New Montgomery St",
  city: "San Francisco",
  state: "CA",
  zip: "94105",
  email: "jsparks@unkown.com",
  password: "pizzaa",
})
