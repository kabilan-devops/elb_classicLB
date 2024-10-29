resource "aws_elb" "terra_lb" {
  name = "terra-lb"
  availability_zones = ["us-west-2a", "us-west-2b"]

  listener{
    instance_port = 80
    instance_protocol ="http"
    lb_port= 80
    lb_protocol ="http"
  }
  health_check{
    healthy_threshold=2
    unhealthy_threshold=2
    timeout= 5
    target="HTTP:80/"
    interval=30
  }
#   ELB Attachment
  instances=["${aws_instance.terra1.id}", "${aws_instance.terra2.id}"]
  cross_zone_load_balancing=true
  idle_timeout=40
  tags={
    Name="terra_lb"
  }

}

