# Cloud details

  provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP TO CONTROL WHAT REQUESTS CAN GO IN AND OUT OF THE EC2 INSTANCES
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "ansible" {
#  for_each = toset (var.vm_names)
#  name = each.value
  name = "ansible"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "master" {
#  for_each = toset (var.vm_names)
#  name = each.value
  name = "master"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2379
    to_port   = 2379
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port = 2380
    to_port   = 2380
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    to_port   = 6443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8090
    to_port   = 8090
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8091
    to_port   = 8091
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8472
    to_port   = 8472
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10250
    to_port   = 10250
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10251
    to_port   = 10251
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10252
    to_port   = 10252
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10255
    to_port   = 10255
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 1194
    to_port   = 1194
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 53
    to_port   = 53
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port = 10248
    to_port   = 10248
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
 ingress {
    from_port = 10248
    to_port   = 10248
    protocol  = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  } 
}

resource "aws_security_group" "node1" {
#  for_each = toset (var.vm_names)
#  name = each.value
  name = "node1"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port = 2379
    to_port   = 2379
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2380
    to_port   = 2380
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    to_port   = 6443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8090
    to_port   = 8090
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8091
    to_port   = 8091
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8472
    to_port   = 8472
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10250
    to_port   = 10250
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10251
    to_port   = 10251
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10252
    to_port   = 10252
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10255
    to_port   = 10255
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 1194
    to_port   = 1194
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 53
    to_port   = 53
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10248
    to_port   = 10248
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}

resource "aws_security_group" "node2" {
#  for_each = toset (var.vm_names)
#  name = each.value
  name = "node2"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # To keep this example simple, we allow incoming SSH requests from any IP. In real-world usage, you should only
    # allow SSH requests from trusted servers, such as a bastion host or VPN server.
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2379
    to_port   = 2379
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2380
    to_port   = 2380
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    to_port   = 6443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8090
    to_port   = 8090
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8091
    to_port   = 8091
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8472
    to_port   = 8472
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10250
    to_port   = 10250
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10251
    to_port   = 10251
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10252
    to_port   = 10252
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10255
    to_port   = 10255
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 1194
    to_port   = 1194
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9000
    to_port   = 9000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 53
    to_port   = 53
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10248
    to_port   = 10248
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "ssh-key"       # Create a "ssh-key" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "ssh-key.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./ssh-key.pem"
  }
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kp.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
}

output "private_key" {
  value = tls_private_key.pk.private_key_pem
  sensitive = true
}


#Creating VMs

#creating vm for master
resource "aws_instance" "master" {
 ami           = "${var.ami}"
 instance_type = "${var.instance_type}"
 key_name = "ssh-key"
 vpc_security_group_ids = ["${aws_security_group.master.id}"]

  tags = {
    Name = "Master"
  }
}

#creating elasticip for
resource "aws_eip" "elasticip_master" {
  instance = aws_instance.master.id
}

resource "null_resource" "testansibleinstance" {
  depends_on = [aws_eip.elasticip_master, aws_instance.master]


  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_eip.elasticip_master.public_ip
#      host_key = tls_private_key.pk.public_key_openssh
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    inline     = ["sudo apt update -y",
                  "sudo apt install sshpass -y",
                  "sudo apt install git -y",
                                 ]
    on_failure = continue
  }
}

#creating vm for node1
resource "aws_instance" "node1" {
 ami           = "${var.ami}"
 instance_type = "${var.instance_type}"
 key_name = "ssh-key"
 vpc_security_group_ids = ["${aws_security_group.node1.id}"]

  tags = {
    Name = "Node1"
  }
}

#creating elasticip for
resource "aws_eip" "elasticip_node1" {
  instance = aws_instance.node1.id
}



resource "null_resource" "testnode1instance" {
  depends_on = [aws_eip.elasticip_node1, aws_instance.node1]


  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_eip.elasticip_node1.public_ip
#      host_key = tls_private_key.pk.public_key_openssh
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    inline     = ["sudo apt update -y",
                  "sudo apt install sshpass -y",
                  "sudo apt install git -y",
                                 ]
    on_failure = continue
  }
}



#creating vm for master
resource "aws_instance" "node2" {
 ami           = "${var.ami}"
 instance_type = "${var.instance_type}"
 key_name = "ssh-key"
 vpc_security_group_ids = ["${aws_security_group.node2.id}"]

  tags = {
    Name = "Node2"
  }
}

#creating elasticip for
resource "aws_eip" "elasticip_node2" {
  instance = aws_instance.node2.id
}


resource "null_resource" "testnode2instance" {
  depends_on = [aws_eip.elasticip_node2, aws_instance.node2]


  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_eip.elasticip_node2.public_ip
#      host_key = tls_private_key.pk.public_key_openssh
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    inline     = ["sudo apt update -y",
                  "sudo apt install sshpass -y",
                  "sudo apt install git -y",
                                 ]
    on_failure = continue
  }
}



#creating vm for ansible
resource "aws_instance" "ansible" {
 ami           = "${var.ami}"
 instance_type = "${var.instance_type}"
 key_name = "ssh-key"
 vpc_security_group_ids = ["${aws_security_group.ansible.id}"]

tags = {
 Name = "Ansible"
  }
}

#creating elasticip for
resource "aws_eip" "elasticip_ansible" {
  instance = aws_instance.ansible.id
}


resource "null_resource" "testinstance" {
  depends_on = [aws_eip.elasticip_ansible, aws_instance.ansible]

 provisioner "file" {
    source      = "/root/infrastructure/ssh-key.pem"
    destination = "/home/ubuntu/ssh-key.pem"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
#      host_key = tls_private_key.pk.public_key_openssh
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }


 provisioner "local-exec" {
    command = "cp hosts origHosts"
    }

 provisioner "local-exec" {
    command = "sed -i 's/masterip/${aws_eip.elasticip_master.public_ip}/g' origHosts"
    }

 provisioner "local-exec" {
    command = "sed -i 's/node1ip/${aws_eip.elasticip_node1.public_ip}/g' origHosts"
    }

 provisioner "local-exec" {
    command = "sed -i 's/node2ip/${aws_eip.elasticip_node2.public_ip}/g' origHosts"
    }

 provisioner "local-exec" {
    command = "sed -i 's/ansibleip/${aws_eip.elasticip_ansible.public_ip}/g' origHosts"
    }

 provisioner "local-exec" {
    command = "sed -i 's/IPADDR/${aws_eip.elasticip_master.public_ip}/g' /root/infrastructure/playbook/master.yml"
    } 


provisioner "file" {
    source      = "/root/infrastructure/origHosts"
    destination = "/home/ubuntu/origHosts"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }

provisioner "file" {
    source      = "/root/infrastructure/playbook/settingUser.yml"
    destination = "/home/ubuntu/settingUser.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }

provisioner "file" {
    source      = "/root/infrastructure/playbook/prerequisites.yml"
    destination = "/home/ubuntu/prerequisites.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }


provisioner "file" {
    source      = "/root/infrastructure/playbook/kube-dependencies.yml"
    destination = "/home/ubuntu/kube-dependencies.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }

provisioner "file" {
    source      = "/root/infrastructure/playbook/copyDockerJson.yml"
    destination = "/home/ubuntu/copyDockerJson.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }


provisioner "file" {
    source      = "/root/infrastructure/playbook/master.yml"
    destination = "/home/ubuntu/master.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }

provisioner "file" {
    source      = "/root/infrastructure/playbook/workers.yml"
    destination = "/home/ubuntu/workers.yml"
   connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    }



  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_eip.elasticip_ansible.public_ip
      private_key = file(var.private_key_path)
      user        = "ubuntu"
    }
    inline     = ["sudo apt update -y",
                  "sudo apt install ansible -y",
                  "sudo apt install git -y",
                  "ssh-keygen -t rsa -N '' -f /home/ubuntu/.ssh/id_rsa",
                  "chmod 400 /home/ubuntu/ssh-key.pem",
                   "sudo chmod -R 700 /home/ubuntu/.ssh",
                   "scp -i /home/ubuntu/ssh-key.pem -o StrictHostKeyChecking=no /home/ubuntu/.ssh/id_rsa.pub ubuntu@${aws_eip.elasticip_master.public_ip}:/home/ubuntu/.ssh/authorized_keys",
                  "scp -i /home/ubuntu/ssh-key.pem -o StrictHostKeyChecking=no /home/ubuntu/.ssh/id_rsa.pub ubuntu@${aws_eip.elasticip_node1.public_ip}:/home/ubuntu/.ssh/authorized_keys",
                   "scp -i /home/ubuntu/ssh-key.pem -o StrictHostKeyChecking=no /home/ubuntu/.ssh/id_rsa.pub ubuntu@${aws_eip.elasticip_node2.public_ip}:/home/ubuntu/.ssh/authorized_keys",
                  "cd ~",
                  "mv /home/ubuntu/*.yml /home/ubuntu/playbook/",
                  "cd playbook",
                  "ansible-playbook settingUser.yml -i /home/ubuntu/origHosts",
                  "ansible-playbook prerequisites.yml -i /home/ubuntu/origHosts",
                  "ansible-playbook kube-dependencies.yml -i /home/ubuntu/origHosts",
                  "ansible-playbook copyDockerJson.yml -i /home/ubuntu/origHosts",
                  "ssh ubuntu@${aws_eip.elasticip_master.public_ip} sudo apt install kubernetes-cni -y",
                  "ssh ubuntu@${aws_eip.elasticip_master.public_ip} sudo apt install kubelet kubeadm kubectl -y",
                  "ssh ubuntu@${aws_eip.elasticip_node1.public_ip} sudo apt install kubernetes-cni -y",
                  "ssh ubuntu@${aws_eip.elasticip_node1.public_ip} sudo apt install kubelet kubeadm kubectl -y",
                  "ssh ubuntu@${aws_eip.elasticip_node2.public_ip} sudo apt install kubernetes-cni -y",
                  "ssh ubuntu@${aws_eip.elasticip_node2.public_ip} sudo apt install kubelet kubeadm kubectl -y",
                  "ansible-playbook master.yml -i /home/ubuntu/origHosts",
                  "ansible-playbook workers.yml -i /home/ubuntu/origHosts",
                  "ansible hosts -m ping -i /home/ubuntu/origHosts",
                  "ls -lart",]
    on_failure = continue
  }

 provisioner "local-exec" {
    command = "rm origHosts"
}
}
