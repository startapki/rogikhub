hub = Hub.create!(
  name: 'Sample hub',
  path: 'sample'
)

vendor_user = User.create!(
  name: 'Vendor',
  email: 'vendor@example.com',
  password: 'password',
  confirmed_at: Time.zone.now
)

Vendor.create!(
  user: vendor_user,
  hub: hub
)

organization = Organization.create!(
  name: 'Examlpe inc.',
  hub: hub
)

client_user = User.create!(
  name: 'Client',
  email: 'client@example.com',
  password: 'password',
  confirmed_at: Time.zone.now
)

Client.create!(
  user: client_user,
  organization: organization
)
