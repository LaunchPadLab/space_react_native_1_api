LpTokenAuth.config do |config|

  # The secret used when encrypting the JWT
  #
  config.secret = '96439b3f33be2a66a8ed126ccd188abd496c98ceb823bf17c82c29a313f8ddf0cc8c78fbe149e64c9ae7260f052e8fbdac4d7d66846982e569933995d7bc103c'

  # The number of hours the token is active
  # default: 7 * 24
  #
  config.expires = 7 * 24

  # The encryption algorithm to use
  # default: HS512
  #
  config.algorithm = 'HS512'

  # Where to include the token in the response, must be an array, options are
  # :cookie, :header
  # default: [:cookie]
  #
  config.token_transport = [:cookie]

  # Where to find the required JWE_PRIVATE_KEY value
  # default: ENV['JWE_PRIVATE_KEY']
  #
  config.jwe_private_key = ENV['JWE_PRIVATE_KEY']

  # The JWE encryption algorithm to use
  # default: 'A256GCM'
  #
  config.jwe_encryption = 'A256GCM'
end
