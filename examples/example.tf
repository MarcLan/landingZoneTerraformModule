######################################################################
# Create CFW with CFW module
######################################################################
module "cfw" {
  source = "../cfw"
  cfw = {
    name   = "cfwTest"
    flavor = "Professional"
  }
}
