# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lab_session',
  :secret      => '4e801ebc7e6da1198041f63a576b90a2fcb7d55836cd3ac8380675436e149815ea9a3a672fb4aad2d2610bf6aaf364d80d74f08c0fa2f7910601bf85d840f6a2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
