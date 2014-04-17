# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
SemProj::Application.config.secret_token = 'b29e3cde37e9986531849d408e0b1d9e788205c555b7fc271da3379fe074b04c34ed4ea59ee02b287d230abf209a02cd6ac0e7a113087c61891b7096c9225bb9'
require 'securerandom'
def secure_token
token_file = Rails.root.join('.secret')
if File.exist?(token_file)
# Use the existing token.
File.read(token_file).chomp
else
# Generate a new token and store it in token_file.
token = SecureRandom.hex(64)
File.write(token_file, token)
token
end
end
#SampleApp::Application.config.secret_key_base = secure_token