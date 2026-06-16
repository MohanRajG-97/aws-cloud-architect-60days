locals {

  full_name = join(
    "-",
    [
      var.project,
      var.environment,
      "ec2"
    ]
  )

  split_name = split(
    "-",
    local.full_name
  )

  owner_count = length(
    var.owners
  )

  uppercase_project = upper(
    var.project
  )

  lowercase_environment = lower(
    var.environment
  )

  merged_tags = merge(
    var.common_tags,
    var.environment_tags
  )

  combined_owners = concat(
    var.owners,
    ["CloudTeam"]
  )

  department = lookup(
    local.merged_tags,
    "Department",
    "Unknown"
  )
}
