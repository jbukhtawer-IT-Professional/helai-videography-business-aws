#An EC2 instance is allowed to assume/use this role/Created the role/Give this role the permissions needed for Systems Manager
  resource "aws_iam_role" "ec2_ssm" {
    name = "${var.project_name}-ec2-ssm-role"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"

      Statement = [
        {
          Effect = "Allow"

          Principal = {
            Service = "ec2.amazonaws.com"
          }

          Action = "sts:AssumeRole"
        }
      ]
    })

    tags = {
      Name = "${var.project_name}-ec2-ssm-role"
    }
  }


#This attaches AWS's AmazonSSMManagedInstanceCore managed policy to our role/Give this role the permissions needed for Systems Manager
resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}



#This is the bridge between EC2 and the IAM role.
resource "aws_iam_instance_profile" "ec2_ssm" {
  name = "${var.project_name}-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm.name
}

