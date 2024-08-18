provider "aws" {
   region = var.region
}

resource "aws_lb_target_group" "ecs-alb-target-group" {
  name        = var.targetgroup_name 
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VpcId
}

resource "aws_lb_listener_rule" "alb_listener_rule" {
  listener_arn = "arn:aws:elasticloadbalancing:us-east-2:851725229101:loadbalancer/app/frontend-alb/6f497568a55617b0"
  priority     = var.priorityNumber

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-alb-target-group.arn
  }

  condition {
    path_pattern {
      values = [var.pathName]
    }
  }
}

output "target_group_arn" {
  value = aws_lb_target_group.ecs-alb-target-group.arn
}
