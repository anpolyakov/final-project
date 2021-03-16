### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
  {
    maven-dns = aws_instance.maven.public-dns,
    maven-ip = aws_instance.maven.public_ip
  },
  {
    tomcat-dns = aws_instance.tomcat.public-dns,
    tomcat-ip = aws_instance.tomcat.public_ip
  }
  )
  filename = "inventory"
}