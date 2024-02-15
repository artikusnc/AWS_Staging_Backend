
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

# Criação da Chave de Acesso# Criação da Chave de Acesso SSH
#resource "aws_key_pair" "example" {
#  key_name   = "EC2-key-pair"  # Nome da chave de acesso SSH
#  public_key = file("~/.ssh/id_rsa_ec2.pub")  # Caminho para a chave pública SSH
#}

# Criação da Instância EC2

