generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "local" {
        path = "${terramate.stack.path.to_root}/.state/${terramate.stack.id}.${terramate.stack.name}.tfstate"
      }
    }
  }
}
