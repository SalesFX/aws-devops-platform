resource "aws_launch_template" "node" {
  name_prefix = "${var.eks.cluster_name}-node-"

  # Prefix delegation: disable EKS default max-pods calculation so the VPC CNI
  # can advertise the higher limit (110 pods) instead of the ENI-based limit (4).
  user_data = base64encode(<<-EOT
    MIME-Version: 1.0
    Content-Type: multipart/mixed; boundary="==BOUNDARY=="

    --==BOUNDARY==
    Content-Type: text/x-shellscript; charset="us-ascii"

    #!/bin/bash
    /etc/eks/bootstrap.sh ${var.eks.cluster_name} \
      --use-max-pods false \
      --kubelet-extra-args '--max-pods=110'

    --==BOUNDARY==--
  EOT
  )

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = var.eks.node_group.disk_size
      volume_type           = "gp3"
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = local.common_tags
  }
}
