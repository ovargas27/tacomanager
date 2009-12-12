# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_breakfast_manager_session',
  :secret      => '6dc08e4480cf567bf64f8fcde9e5e5c1793908b0e4b1af4996cb60e8cf984a2832e2107d586f4a97a4ea429aa79a6c622db35f9c49585f3a8e4b1dc0d5151653'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
