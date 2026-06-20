Day 38 - Terraform State Management

Concepts Learned:
- terraform state list
- terraform state show
- terraform state mv
- terraform state rm
- terraform plan -refresh-only

Key Learnings:
- Terraform State is Terraform's database.
- state mv safely renames resources.
- state rm removes Terraform tracking only.
- refresh synchronizes state with actual infrastructure.
- Never manually edit terraform.tfstate.

Enterprise Use Cases:
- Infrastructure refactoring
- Disaster recovery
- State repair
- Resource migration
- Production troubleshooting

Lab Results:
- Created EC2 and Security Group.
- Renamed state resource using state mv.
- Removed Security Group from state.
- Verified refresh behavior.
- Destroyed managed resources.
- Manually cleaned unmanaged Security Group.
