### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
  {
    maven-dns = aws_eip.eip-maven.public-dns,
    maven-ip = aws_eip.eip-maven.public_ip
  },
  {
    tomcat-dns = aws_eip.eip-tomcat.public-dns,
    tomcat-ip = aws_eip.eip-tomcat.public_ip
  }
  )
  filename = "inventory"
}