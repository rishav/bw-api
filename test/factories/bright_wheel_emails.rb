FactoryGirl.define do
  factory :bright_wheel_email do
    to 'rishav.rastogi@gmail.com'
    to_name 'Rishav Rastogi'
    from 'admin@brightwheel.com'
    from_name  'Brightwheel Admin'
    subject 'Test Email'
    body '<html><head><title>Intro Email</title><scrpit> alert("something")</script></head><body><style> p {font-size: 1em;}</style> <p> Hello Rishav </p> <p> Do not take too long writing the test email </p></body></html>'
  end

end
