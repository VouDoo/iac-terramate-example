globals {
  aws_region = "eu-west-3" # Ici, c'est Paris !
  public_key = tm_chomp(tm_file("${terramate.stack.path.to_root}/.keypair/ed25519_key.pub"))
}
