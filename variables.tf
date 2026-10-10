variable "resource_servers" {
  description = <<EOT
Map of resource_servers, attributes below
Required:
    - identifier
Optional:
    - allow_offline_access
    - allow_online_access
    - allow_online_access_with_ephemeral_sessions
    - consent_policy
    - enforce_policies
    - name
    - require_consent_non_repudiation
    - signing_alg
    - signing_secret
    - skip_consent_for_verifiable_first_party_clients
    - token_dialect
    - token_lifetime
    - token_lifetime_for_anonymous_access_tokens
    - token_lifetime_for_web
    - verification_location
    - access_token (block):
        - claims_mapping (optional, block):
            - custom_claims (optional, block):
                - expression (required)
                - name (required)
    - authorization_details (block):
        - disable (optional)
        - type (optional)
    - authorization_policy (block):
        - policy_id (optional)
    - proof_of_possession (block):
        - disable (optional)
        - mechanism (optional)
        - required (optional)
        - required_for (optional)
    - subject_type_authorization (block):
        - anonymous_user (optional, block):
            - policy (optional)
        - client (optional, block):
            - policy (optional)
        - user (optional, block):
            - policy (optional)
    - token_encryption (block):
        - disable (optional)
        - encryption_key (optional, block):
            - algorithm (required)
            - kid (optional)
            - name (optional)
            - pem (required)
        - format (optional)
EOT

  type = map(object({
    identifier                                      = string
    allow_offline_access                            = optional(bool)
    allow_online_access                             = optional(bool)
    allow_online_access_with_ephemeral_sessions     = optional(bool)
    consent_policy                                  = optional(string)
    enforce_policies                                = optional(bool)
    name                                            = optional(string)
    require_consent_non_repudiation                 = optional(bool)
    signing_alg                                     = optional(string)
    signing_secret                                  = optional(string)
    skip_consent_for_verifiable_first_party_clients = optional(bool)
    token_dialect                                   = optional(string)
    token_lifetime                                  = optional(number)
    token_lifetime_for_anonymous_access_tokens      = optional(number)
    token_lifetime_for_web                          = optional(number)
    verification_location                           = optional(string)
    access_token = optional(object({
      claims_mapping = optional(object({
        custom_claims = optional(list(object({
          expression = string
          name       = string
        })))
      }))
    }))
    authorization_details = optional(list(object({
      disable = optional(bool)
      type    = optional(string)
    })))
    authorization_policy = optional(object({
      policy_id = optional(string)
    }))
    proof_of_possession = optional(object({
      disable      = optional(bool)
      mechanism    = optional(string)
      required     = optional(bool)
      required_for = optional(string)
    }))
    subject_type_authorization = optional(object({
      anonymous_user = optional(object({
        policy = optional(string)
      }))
      client = optional(object({
        policy = optional(string)
      }))
      user = optional(object({
        policy = optional(string)
      }))
    }))
    token_encryption = optional(object({
      disable = optional(bool)
      encryption_key = optional(object({
        algorithm = string
        kid       = optional(string)
        name      = optional(string)
        pem       = string
      }))
      format = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.access_token == null || (v.access_token.claims_mapping == null || (v.access_token.claims_mapping.custom_claims == null || (length(v.access_token.claims_mapping.custom_claims) <= 20)))
      )
    ])
    error_message = "Each custom_claims list must contain at most 20 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.signing_alg == null || (contains([for v in ["HS256", "RS256", "PS256"] : lower(v)], lower(v.signing_alg)))
      )
    ])
    error_message = "must be one of: \"HS256\", \"RS256\", \"PS256\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.token_dialect == null || (contains([for v in ["access_token", "access_token_authz", "rfc9068_profile", "rfc9068_profile_authz"] : lower(v)], lower(v.token_dialect)))
      )
    ])
    error_message = "must be one of: \"access_token\", \"access_token_authz\", \"rfc9068_profile\", \"rfc9068_profile_authz\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.consent_policy == null || (contains([for v in ["transactional-authorization-with-mfa", "null"] : lower(v)], lower(v.consent_policy)))
      )
    ])
    error_message = "must be one of: \"transactional-authorization-with-mfa\", \"null\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.token_encryption == null || (v.token_encryption.format == null || (contains([for v in ["compact-nested-jwe"] : lower(v)], lower(v.token_encryption.format))))
      )
    ])
    error_message = "must be one of: \"compact-nested-jwe\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.proof_of_possession == null || (v.proof_of_possession.mechanism == null || (contains([for v in ["mtls", "dpop"] : lower(v)], lower(v.proof_of_possession.mechanism))))
      )
    ])
    error_message = "must be one of: \"mtls\", \"dpop\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.proof_of_possession == null || (v.proof_of_possession.required_for == null || (contains([for v in ["all_clients", "public_clients"] : lower(v)], lower(v.proof_of_possession.required_for))))
      )
    ])
    error_message = "must be one of: \"all_clients\", \"public_clients\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.subject_type_authorization == null || (v.subject_type_authorization.user == null || (v.subject_type_authorization.user.policy == null || (contains(["allow_all", "deny_all", "require_client_grant"], v.subject_type_authorization.user.policy))))
      )
    ])
    error_message = "must be one of: \"allow_all\", \"deny_all\", \"require_client_grant\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.subject_type_authorization == null || (v.subject_type_authorization.client == null || (v.subject_type_authorization.client.policy == null || (contains(["deny_all", "require_client_grant"], v.subject_type_authorization.client.policy))))
      )
    ])
    error_message = "must be one of: \"deny_all\", \"require_client_grant\""
  }
  validation {
    condition = alltrue([
      for k, v in var.resource_servers : (
        v.subject_type_authorization == null || (v.subject_type_authorization.anonymous_user == null || (v.subject_type_authorization.anonymous_user.policy == null || (contains(["deny_all", "require_client_grant"], v.subject_type_authorization.anonymous_user.policy))))
      )
    ])
    error_message = "must be one of: \"deny_all\", \"require_client_grant\""
  }
}

