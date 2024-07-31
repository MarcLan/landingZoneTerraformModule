module "eip" {
  source = "../14 eip"
  EIP = {
    eip1 = {
      name = "for-snat"
      size = "5"
    }
  }

}
