check "website_check" {
  data "http" "website" {
    url = "https://www.google12312.com"
  }

  assert {
    condition     = data.http.website.status_code == 200
    error_message = "Website is not reachable or returned a non-200 status code."
  }
}

resource "local_file" "check_result" {
  content  = "Hi there! The website check passed successfully."
  filename = "${path.module}/check_result.txt"
}
