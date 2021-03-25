variable "image_id" {
#  default = "ami-0885b1f6bd170450c"
  type = string
}

variable "instance_count" {
#  description = "Número de instâncias que serão provisionadas"
#  default     = "4"
  type = number
}

variable "name" {
#  description = "Nome da instância"
#  default     = ""
  type        = string
}

variable "srvcountry" {
#  description = "país"
#  default     = "br"
  type        = string
}

variable "srvclient" {
#  description = "cliente"
#  default     = "san"
  type        = string
}

variable "srvproduct" {
#  description = "produto"
#  default     = "pi"
  type        = string
}

variable "srvrole" {
#  description = "regra"
#  default     = "mdb"
  type        = string
}

variable "srvenvironment" {
#  description = "ambiente"
#  default     = "d"
  type        = string
}

#variable "ami" {
#  description = "ID da AMI usada para provisionar a instância"
#  default = ""
#  type = string
#}

variable "instance_type" {
#  description = "Tipo (classe) da instância"
#  default = "t2.micro"
  type = string
}

variable "user_data" {
#  description = "User data utilizado ao provisionar a instância"
#  default     = "heldouser0.1"
}

variable "enable_ssm" {
#  description = "Habilita o AWS SSM Session Manager. Essa é uma forma mais segura de conexão à instância do que a conexão por SSH"
#  default     = true
}

variable "key_name" {
#  description = "Nome do Key Pair a ser usado para a instância"
#  default     = "newkeypair"
}

variable "iam_instance_profile" {
#  description = "Instance Profile do IAM vinculado à instância"
#  default     = "SMrole"
  type        = string
}

variable "subnet_id" {
#  description = "ID da subnet onde a instância será provisionada"
#  default     = "subnet-96e94398"
}

#variable "subnet_ids" {
#  description = "Lista com IDs das subnets onde a instância será provisionada"
#  default     = [subnet-03874134357a7f3ae]
#}

#variable "private_ip" {
#  description = "IP privado da instância na VPC"
#  default     = ""
#}

#variable "associate_public_ip_address" {
#  description = "Vincula um IP público à instância"
#  default     = false
#}

variable "vpc_security_group_ids" {
#  description = "Lista com IDs dos security groups que serão vinculados à instância"
  type        = string
#  default     = "sg-38d65e19"
}

variable "monitoring" {
#  description = "Controla se a instância terá monitoramento detalhado"
#  default     = true
}

#variable "disable_api_termination" {
#  description = "Controla a proteção de destruição (terminate) da instância"
#  default     = false
#}

#variable "source_dest_check" {
#  description = "Controla se o tráfego é roteado para a instância quando o endereço de destino não é o mesmo da instância"
#  default     = true
#}

#variable "cpu_credits" {
#  description = "Opção de créditos de CPU da instância (\"unlimited\" ou \"standard\")"
#  default     = "standard"
#}

#variable "ebs_optimized" {
#  description = "Controla se a instância será provisionada como EBS-optimized"
#  default     = true
#}

#variable "root_block_device" {
#  description = "Lista com maps de configuração do volume raiz da instância"
#  type        = "list"
#}

variable "tags" {
  description = "Map de tags da instância e dos volumes"
  default     = {}
}