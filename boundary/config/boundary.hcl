# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# make it false in prod
disable_mlock = true

controller {
  name = "dvh-controller"
  description = "A controller for dvh!"
  database {
      url = "env://BOUNDARY_PG_URL"
  }
}

worker {
  name = "dvh-worker"
  description = "A worker for a dvh project"
  
  tags {
    type   = ["prod", "servers"]
  }

  public_addr = "127.0.0.1"
}

listener "tcp" {
  address = "boundary"
  purpose = "api"
  tls_disable   = true
  #tls_cert_file = "/etc/boundary.d/tls/boundary-cert.pem"
  #tls_key_file  = "/etc/boundary.d/tls/boundary-key.pem"
}

listener "tcp" {
  address = "boundary"
  purpose = "cluster"
  tls_disable   = true
  #tls_cert_file = "/etc/boundary.d/tls/boundary-cert.pem"
  #tls_key_file  = "/etc/boundary.d/tls/boundary-key.pem"
}

listener "tcp" {
	address = "boundary"
	purpose = "proxy"
	tls_disable   = true
  #tls_cert_file = "/etc/boundary.d/tls/boundary-cert.pem"
  #tls_key_file  = "/etc/boundary.d/tls/boundary-key.pem"
}


events {
  audit_enabled       = false
  sysevents_enabled   = true
  observations_enable = false

  sink "stderr" {
    name = "all-events"
    description = "All events sent to stderr"
    event_types = ["*"]
    format = "hclog-text"
  }
  sink {
    name = "audit-file"
    description = "audit events sent to a file"
    event_types = ["audit"]
    format = "cloudevents-json"

    file {
      path = "/var/log/boundary"
      file_name = "controller.log"
    }

  sink {
  name = "auth-sink"
  description = "Authentications sent to a file"
  event_types = ["observation"]
  format = "cloudevents-json"
  allow_filters = [
    "\"/data/request_info/path\" contains \":authenticate\""
  ]
  file {
    path = "/var/log/boundary"
    file_name = "auth.log"
  }
  }

  sink {
    name = "session-sink"
    description = "Authorize session requests and services sent to a file"
    event_types = ["audit"]
    format = "cloudevents-json"
    allow_filters = [
      "\"/data/request_info/path\" contains \":authorize-session\"",
      "\"/data/request_info/method\" contains \"SessionService\"",
    ]
    file {
      path = "/var/log/boundary"
      file_name = "sessions.log"
    }
  }

    audit_config {
      audit_filter_overrides {
        secret    = "encrypt"
        sensitive = "hmac-sha256"
      }
    }
  }
}



kms "transit" {
  purpose            = "root"
  address            = "http://vault:8200"
  // token              = "hvs.qtHSKlalvkOgLZKGFRmHj90v"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "root-boundary"
  mount_path         = "transit/"
  tls_skip_verify    = "true"
  vault_prefix        = "transit/"
}
kms "transit" {
  purpose            = "worker-auth"
  address            = "http://vault:8200"
  // token              = "hvs.qtHSKlalvkOgLZKGFRmHj90v"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "worker-auth-boundary"
  mount_path         = "transit/"
  tls_skip_verify    = "true"
  vault_prefix        = "transit/"
}
kms "transit" {
  purpose            = "recovery"
  address            = "http://vault:8200"
  // token              = "hvs.qtHSKlalvkOgLZKGFRmHj90v"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "recovery-boundary"
  mount_path         = "transit/"
  tls_skip_verify    = "true"
  vault_prefix        = "transit/"
}
