# Create an IAM group
resource "aws_iam_group" "admin_group" {
  name = "admin"
}

# Attach the AdministratorAccess policy to the group
resource "aws_iam_group_policy_attachment" "admin_access" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create a user and add to the Administrators group (optional)
resource "aws_iam_user" "example_user" {
  name = "stephan"
}

resource "aws_iam_user_group_membership" "user_membership" {
  user = aws_iam_user.example_user.name
  groups = [
    aws_iam_group.admin_group.name
  ]
}

output "admin_group_name" {
  value = aws_iam_group.admin_group.name
}

output "admin_user_name" {
  value = aws_iam_user.example_user.name
}
