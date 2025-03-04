stack {
  name        = "bar"
  description = "bar"
  id          = "24efbe9b-f324-4453-ba83-f7d848ac86dc"
}

import {
  source = "/modules/instance/module.tm.hcl"
}

globals {
  ansible_groups = ["bar"]
}
