module "eip" {
  source = "../14eip"
  eip = {
    eip1 = {
      name = "for-snat"
      size = "5"
    }
  }

}
