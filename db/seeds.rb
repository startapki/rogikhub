hub = Hub.create!(
  name: 'Rogik\'s hub',
  path: 'rogik'
)

vendor_user = User.create!(
  name: 'Vendor',
  email: 'vendor@rogik.com',
  password: 'password',
  confirmed_at: Time.zone.now
)

Vendor.create!(
  user: vendor_user,
  hub: hub
)

organization = Organization.create!(
  name: 'IntertradeAuto',
  hub: hub
)

client_user = User.create!(
  name: 'Client',
  email: 'client@rogik.com',
  password: 'password',
  confirmed_at: Time.zone.now
)

Client.create!(
  user: client_user,
  organization: organization
)
