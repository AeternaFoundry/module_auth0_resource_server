resource "auth0_resource_server" "resource_servers" {
  for_each = var.resource_servers

  identifier                                      = each.value.identifier
  allow_offline_access                            = each.value.allow_offline_access
  allow_online_access                             = each.value.allow_online_access
  allow_online_access_with_ephemeral_sessions     = each.value.allow_online_access_with_ephemeral_sessions
  consent_policy                                  = each.value.consent_policy
  enforce_policies                                = each.value.enforce_policies
  name                                            = each.value.name
  require_consent_non_repudiation                 = each.value.require_consent_non_repudiation
  signing_alg                                     = each.value.signing_alg
  signing_secret                                  = each.value.signing_secret
  skip_consent_for_verifiable_first_party_clients = each.value.skip_consent_for_verifiable_first_party_clients
  token_dialect                                   = each.value.token_dialect
  token_lifetime                                  = each.value.token_lifetime
  token_lifetime_for_anonymous_access_tokens      = each.value.token_lifetime_for_anonymous_access_tokens
  token_lifetime_for_web                          = each.value.token_lifetime_for_web
  verification_location                           = each.value.verification_location

  dynamic "access_token" {
    for_each = each.value.access_token != null ? [each.value.access_token] : []
    content {
      dynamic "claims_mapping" {
        for_each = access_token.value.claims_mapping != null ? [access_token.value.claims_mapping] : []
        content {
          dynamic "custom_claims" {
            for_each = claims_mapping.value.custom_claims != null ? claims_mapping.value.custom_claims : []
            content {
              expression = custom_claims.value.expression
              name       = custom_claims.value.name
            }
          }
        }
      }
    }
  }

  dynamic "authorization_details" {
    for_each = each.value.authorization_details != null ? each.value.authorization_details : []
    content {
      disable = authorization_details.value.disable
      type    = authorization_details.value.type
    }
  }

  dynamic "authorization_policy" {
    for_each = each.value.authorization_policy != null ? [each.value.authorization_policy] : []
    content {
      policy_id = authorization_policy.value.policy_id
    }
  }

  dynamic "proof_of_possession" {
    for_each = each.value.proof_of_possession != null ? [each.value.proof_of_possession] : []
    content {
      disable      = proof_of_possession.value.disable
      mechanism    = proof_of_possession.value.mechanism
      required     = proof_of_possession.value.required
      required_for = proof_of_possession.value.required_for
    }
  }

  dynamic "subject_type_authorization" {
    for_each = each.value.subject_type_authorization != null ? [each.value.subject_type_authorization] : []
    content {
      dynamic "anonymous_user" {
        for_each = subject_type_authorization.value.anonymous_user != null ? [subject_type_authorization.value.anonymous_user] : []
        content {
          policy = anonymous_user.value.policy
        }
      }
      dynamic "client" {
        for_each = subject_type_authorization.value.client != null ? [subject_type_authorization.value.client] : []
        content {
          policy = client.value.policy
        }
      }
      dynamic "user" {
        for_each = subject_type_authorization.value.user != null ? [subject_type_authorization.value.user] : []
        content {
          policy = user.value.policy
        }
      }
    }
  }

  dynamic "token_encryption" {
    for_each = each.value.token_encryption != null ? [each.value.token_encryption] : []
    content {
      disable = token_encryption.value.disable
      dynamic "encryption_key" {
        for_each = token_encryption.value.encryption_key != null ? [token_encryption.value.encryption_key] : []
        content {
          algorithm = encryption_key.value.algorithm
          kid       = encryption_key.value.kid
          name      = encryption_key.value.name
          pem       = encryption_key.value.pem
        }
      }
      format = token_encryption.value.format
    }
  }
}

