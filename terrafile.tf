module "servers" {
  source = "./servers"
  instance_count = 5
  image_id = "ami-0885b1f6bd170450c"
  name = ""
  srvcountry = "col"
  srvclient = "san"
  srvproduct = "pi"
  srvrole = "k8s"
  srvenvironment = "a"
  instance_type = "t2.micro"
  user_data = "heldouser0.1"
  enable_ssm = true
  key_name = "newkeypair"
  iam_instance_profile = "SMrole"
  subnet_id = "subnet-96e94398"
  vpc_security_group_ids = "sg-38d65e19"
  monitoring = true
  }

output "ip_address" {
  value = module.servers.ip_address
}