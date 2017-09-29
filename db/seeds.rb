Pet.delete_all
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
  image: "http://www.boostinspiration.com/wp-content/uploads/2010/09/BlackAndWhitePhotographyPeople1.jpg",
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
  image: "http://www.curiositytravels.org/wp-content/uploads/2015/12/IMG_6425.jpg",
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
  image: "http://www.curiositytravels.org/wp-content/uploads/2015/12/IMG_6425.jpg",
})

pet_1 = Pet.create({
  name: "Fido",
  breed: "Yorkie",
  age: "10",
  user_id: user_1.id,
  image: 'https://www.petfinder.com/wp-content/uploads/2013/05/120251710-632x3531-253x253.jpg',
  about_me: 'They call me FIDO!',
})

pet_2 = Pet.create({
  name: "Mini",
  breed: "Yorkie",
  age: "2",
  user_id: user_1.id,
  image: 'https://www.petfinder.com/wp-content/uploads/2012/11/253x190-e1352928841572.jpg',
  about_me: 'They call me MINI!!',
})

pet_3 = Pet.create({
  name: "Pookie",
  breed: "Golden",
  age: "2",
  user_id: user_1.id,
  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScvdABaCG-KYPgBh7ZrwNjWf3Q-FmgfI1WF8-WSTW_qYJ1j9kh',
  about_me: 'I am a 2 year old awesome golden!',
})

pet_4 = Pet.create({
  name: "Peanut",
  breed: "Golden",
  age: "2",
  user_id: user_1.id,
  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVmAH_6jaZB1TKuxWwqDMWZ3pelBzQ-rSVuONN35HJ3x_4cqLD3Q',
  about_me: 'They call me PEANUT BC I LIKE NUTZ!',
})

pet_5 = Pet.create({
  name: "Cece",
  breed: "Golden",
  age: "2",
  user_id: user_1.id,
  image: 'http://photos.demandstudios.com/getty/article/148/149/87786680_XS.jpg',
  about_me: 'They call me CECEEEE!',
})
