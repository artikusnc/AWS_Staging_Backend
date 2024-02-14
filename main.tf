
# Criação da VPC
resource "aws_vpc" "example" {
  cidr_block = "10.80.0.0/16"
}

# Criação da Sub-rede
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.80.1.0/24"
}

# Criação do Grupo de Segurança
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  name        = "my-security-group"
  description = "My security group for allowing SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criação da Chave de Acesso
#resource "aws_key_pair" "example" {
# key_name   = "my-key-pair"
#  public_key = file("~/.ssh/id_rsa.pub")  # Caminho para a chave pública SSH
#}

# Criação da Instância EC2
resource "aws_instance" "example" {
  ami             = "ami-0eb11ab33f229b26c"  # ID da AMI do Ubuntu 20.04 LTS
  instance_type   = "t2.micro"
  subnet_id       = "subnet-0db3d811d5e387954"
  #key_name        = aws_key_pair.example.key_name
  security_groups = ["sg-014b02f43f6067891","sg-05a76e559edc78159"]
}
resource "aws_s3_bucket" "sergio_bucket" {
  bucket = "my-tf-test-bucketsergio"
}
