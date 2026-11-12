output "resource_servers_id" {
  description = "Map of id values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.id }
}
output "resource_servers_access_token" {
  description = "Map of access_token values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => one(v.access_token) }
}
output "resource_servers_allow_offline_access" {
  description = "Map of allow_offline_access values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.allow_offline_access }
}
output "resource_servers_allow_online_access" {
  description = "Map of allow_online_access values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.allow_online_access }
}
output "resource_servers_allow_online_access_with_ephemeral_sessions" {
  description = "Map of allow_online_access_with_ephemeral_sessions values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.allow_online_access_with_ephemeral_sessions }
}
output "resource_servers_authorization_details" {
  description = "Map of authorization_details values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.authorization_details }
}
output "resource_servers_authorization_policy" {
  description = "Map of authorization_policy values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => one(v.authorization_policy) }
}
output "resource_servers_client_id" {
  description = "Map of client_id values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.client_id }
}
output "resource_servers_consent_policy" {
  description = "Map of consent_policy values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.consent_policy }
}
output "resource_servers_enforce_policies" {
  description = "Map of enforce_policies values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.enforce_policies }
}
output "resource_servers_identifier" {
  description = "Map of identifier values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.identifier }
}
output "resource_servers_is_system" {
  description = "Map of is_system values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.is_system }
}
output "resource_servers_name" {
  description = "Map of name values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.name }
}
output "resource_servers_proof_of_possession" {
  description = "Map of proof_of_possession values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => one(v.proof_of_possession) }
}
output "resource_servers_require_consent_non_repudiation" {
  description = "Map of require_consent_non_repudiation values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.require_consent_non_repudiation }
}
output "resource_servers_signing_alg" {
  description = "Map of signing_alg values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.signing_alg }
}
output "resource_servers_signing_secret" {
  description = "Map of signing_secret values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.signing_secret }
}
output "resource_servers_skip_consent_for_verifiable_first_party_clients" {
  description = "Map of skip_consent_for_verifiable_first_party_clients values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.skip_consent_for_verifiable_first_party_clients }
}
output "resource_servers_subject_type_authorization" {
  description = "Map of subject_type_authorization values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => one(v.subject_type_authorization) }
}
output "resource_servers_token_dialect" {
  description = "Map of token_dialect values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.token_dialect }
}
output "resource_servers_token_encryption" {
  description = "Map of token_encryption values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => one(v.token_encryption) }
}
output "resource_servers_token_lifetime" {
  description = "Map of token_lifetime values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.token_lifetime }
}
output "resource_servers_token_lifetime_for_anonymous_access_tokens" {
  description = "Map of token_lifetime_for_anonymous_access_tokens values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.token_lifetime_for_anonymous_access_tokens }
}
output "resource_servers_token_lifetime_for_web" {
  description = "Map of token_lifetime_for_web values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.token_lifetime_for_web }
}
output "resource_servers_verification_location" {
  description = "Map of verification_location values across all resource_servers, keyed the same as var.resource_servers"
  value       = { for k, v in auth0_resource_server.resource_servers : k => v.verification_location }
}

