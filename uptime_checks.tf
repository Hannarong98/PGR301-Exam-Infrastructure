provider "statuscake" {
  username = "postglennbechno"
}

resource "statuscake_test" "google" {
  website_name = "My test"
  website_url = "https://letshopethisdoesnotexistatall.com"
  test_type = "HTTP"
  check_rate = 300
  contact_group = ["193657"]
}