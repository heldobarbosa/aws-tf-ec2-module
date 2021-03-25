

# ----------------------------------------------------------------------------------------------------------------------
# EC2
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "web" {
  count                = var.instance_count
  ami                  = var.image_id
  instance_type        = var.instance_type
#  ami                  = var.ami  
  user_data            = var.user_data
  key_name             = var.key_name
  iam_instance_profile = data.aws_iam_instance_profile.SMrole.name

  subnet_id = element(distinct(compact(concat(list(var.subnet_id)))), count.index)

#  private_ip                  = "${var.private_ip}"
#  associate_public_ip_address = "${var.associate_public_ip_address}"
  vpc_security_group_ids      = [var.vpc_security_group_ids]

  monitoring              = var.monitoring
#  disable_api_termination = var.disable_api_termination
#  source_dest_check       = var.source_dest_check

#  credit_specification {
#    cpu_credits = "${var.cpu_credits}"
#  }

#  ebs_optimized     = var.ebs_optimized
#  root_block_device = [var.root_block_device]

#  tags = merge(
#    map("Name", var.instance_count > 1 ? format("%s-%d", var.srvcountry, var.srvclient, var.srvproduct, var.srvrole, var.srvenvironment, count.index + 1) : var.name),
#    var.tags
#  )

  tags = merge(
    map("Name", var.instance_count > 01 ? format("%s%s%s%s%s%d", var.srvcountry, var.srvclient, var.srvproduct, var.srvrole, var.srvenvironment, count.index + 01) : var.name),
    var.tags
  )

#  tags = merge(
#    map("Name", length(var.private_subnet_names) > 0 ? element(concat(var.private_subnet_names, list("")), count.index) : format("%s - ${var.private_subnet_suffix}-%d - %s", var.name, count.index + 1, element(local.azs, count.index))),
#    map("SubnetIndex", count.index + 1),
#    var.tags,
#    var.private_subnet_tags
#  )

#  tags = merge(map("Name", var.name, var.srvcountry), var.tags)

  volume_tags = merge(
    map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index + 1) : var.name),
    var.tags
  )
}

# Select user specified instance profile or the default one created (see below)
data "aws_iam_instance_profile" "SMrole" {
  name = "SMrole"
}

# ----------------------------------------------------------------------------------------------------------------------
# IAM
# ----------------------------------------------------------------------------------------------------------------------

#Default instance profile, role and policy document if instance profile is not specified
#resource "aws_iam_instance_profile" "default" {
#  count = var.iam_instance_profile != "" ? 0 : 1

#  role = aws_iam_role.default.name
#}

#resource "aws_iam_role" "default" {
#  count = var.iam_instance_profile != "" ? 0 : 1

#  assume_role_policy = data.aws_iam_policy_document.allow_ec2_to_assume_role.json
#}

#data "aws_iam_policy_document" "allow_ec2_to_assume_role" {
#  statement {
#    actions = ["sts:AssumeRole"]

#    principals {
#      type        = "Service"
#      identifiers = ["ec2.amazonaws.com"]
#    }
#  }
#}

# ----------------------------------------------------------------------------------------------------------------------
# SSM ACCESS
# ----------------------------------------------------------------------------------------------------------------------

#Attaches default Amazon policy for SSM
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  count = var.enable_ssm ? 1 : 0

  role       = data.aws_iam_instance_profile.SMrole.role_name
  policy_arn = "arn:aws:iam::865271470892:policy/SM"
}