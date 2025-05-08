provider "aws" {
  region = "eu-west-2" # London
}

resource "aws_instance" "devops" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Ubuntu 24.04 in eu-west-2
  instance_type = "t3.medium"
  key_name      = "YOUR_KEY_PAIR"  # Replace with your actual EC2 key pair

  tags = {
    Name = "DevOpsWorkstation"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y git ansible",
      "git clone https://github.com/YOUR_GITHUB/YOUR_REPO.git",
      "cd YOUR_REPO",
      "ansible-playbook site.yml --connection=local"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/YOUR_KEY_PAIR.pem")
      host        = self.public_ip
    }
  }
}
