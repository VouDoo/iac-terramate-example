stack {
  name        = "foo"
  description = "foo"
  id          = "8e151cc0-9c43-473f-8c9c-3d9e2803e5e6"
}

import {
  source = "/modules/instance_duo/module.tm.hcl"
}

globals {
  instance_basename = "foo"
  ansible_groups    = ["foo"]
}
