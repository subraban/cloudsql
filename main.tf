module "cli" {
  source = "../.."

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint = "${path.module}/script.sh"
  create_cmd_body       = "enable ${var.project_id}"

  destroy_cmd_entrypoint = "${path.module}/script.sh"
  destroy_cmd_body       = "disable ${var.project_id}"
}
