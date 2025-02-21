terramate {
  config {
    run {
      env {
        TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.terraform_cache"
      }
    }
  }
}
