module "lts" {
  source = "../00lts"

  lts = {

    "group1" = {
      groupName = "group-1"
      groupTTL  = 30
      streams = {
        "stream1" = {
          streamName = "stream-1"
        }
      }
    }

    "group2" = {
      groupName = "group-2"
      groupTTL  = 30
      streams = {
        "stream2" = {
          streamName = "stream-2"
        }
      }
    }

  }
}
