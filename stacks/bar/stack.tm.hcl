stack {
  name        = "bar"
  description = "bar"
  id          = "24efbe9b-f324-4453-ba83-f7d848ac86dc"
}

import {
  source = "/modules/instance_solo/module.tm.hcl"
}

globals {
  instance_name  = "bar"
  ansible_groups = ["bar"]
}
