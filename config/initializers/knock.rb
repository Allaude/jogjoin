Knock.setup do |config|

  ## Expiration claim
  ## ----------------
  ##
  ## How long before a token is expired. If nil is provided, token will
  ## last forever.
  ##
  ## Default:
  config.token_lifetime = 1.day


  ## Audience claim
  ## --------------
  ##
  ## Configure the audience claim to identify the recipients that the token
  ## is intended for.
  ##
  ## Default:
  # config.token_audience = nil

  ## If using Auth0, uncomment the line below
  # config.token_audience = -> { Rails.application.secrets.auth0_client_id }

  ## Signature algorithm
  ## -------------------
  ##
  ## Configure the algorithm used to encode the token
  ##
  ## Default:
  config.token_signature_algorithm = 'HS256'

  ## Signature key
  ## -------------
  ##
  ## Configure the key used to sign tokens.
  ##
  ## Default:
  # config.token_secret_signature_key = -> { Rails.application.credentials.read }
  # config.token_secret_signature_key = -> { Rails.application.credentials.fetch(:secret_key_base) }
  # config.token_secret_signature_key = -> { Rails.application.secrets.fetch(:secret_key_base) }
    config.token_secret_signature_key = -> { "ee60dba9f4383f1b9691d019bfd8c0b8b91c4d187fcf9290cda03cc5b16b58222f45201aba66939e30bf12ec653cdfbf75d289bf869087678376ae0e80ca001e" }
  ## If using Auth0, uncomment the line below
  # config.token_secret_signature_key = -> { JWT.base64url_decode Rails.application.secrets.auth0_client_secret }

  ## Public key
  ## ----------
  ##
  ## Configure the public key used to decode tokens, if required.
  ##
  ## Default:
  # config.token_public_key = nil

  ## Exception Class
  ## ---------------
  ##
  ## Configure the exception to be used when user cannot be found.
  ##
  ## Default:
  config.not_found_exception_class_name = 'ActiveRecord::RecordNotFound'
end
