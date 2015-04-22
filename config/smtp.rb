SMTP_SETTINGS = {
  address: ENV.fetch("smtp.sendgrid.net"), # example: "smtp.sendgrid.net"
  authentication: :plain,
  domain: ENV.fetch("surveyorapp.herokuapp.com"), # example: "heroku.com"
  enable_starttls_auto: true,
  password: ENV.fetch(")cbsTMcsJnwLztUPrkKFtucCVt3/xF/{A7Rj "),
  port: "587",
  user_name: ENV.fetch("thramp")
}
