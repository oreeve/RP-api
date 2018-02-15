property = Property.create(
  neighborhood: "Crane's Lake",
  description: "A lovely neighborhood on the northern end of Ponte Vedra Beach.",
  beds: 3,
  baths: 2,
  home_size: 1474,
  type_of: "condo",
  status: "rented",
  address: {
    street_address: "109 Crane's Lake Dr",
    city: "Ponte Vedra Beach",
    state: "FL",
    zip: "32082"
  }
)

Image.create(
  title: "Master Bedroom",
  url: "http://via.placeholder.com/350x150",
  description: "The generously sized master bedroom has plenty of space for a king size bed and multiple large dressers!",
  property: property
)
