data "template_file" "wp" {
  template = "${file("startup-wp-template.bash")}"

  vars = {
    project = var.project
  }
}

resource "local_file" "wp-outfile" {
    content  = data.template_file.wp.rendered
    filename = "rendered-wp.bash"
}
