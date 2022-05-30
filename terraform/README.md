# Proof of concept for GKE + Redis

## Terraform

The terraform directory has all the necessary files to manage the Memorystore instance.

### `state.tf`

The `state.tf` file defines that this repository does not include a remote state management solution which makes parallel execution dangerous. More information can be found [here](https://medium.com/devops-mojo/terraform-remote-states-overview-what-is-terraform-remote-state-storage-introduction-936223a0e9d0).

### `variables.tf`

The `variables.tf` file contains all external variables to be able to easily configure even from CI the installations.

### `provider.tf`

The `provider.tf` file contains the `google-provider` configurations to be able to communicate with GCP APIs.

### `redis.tf`

The `redis.tf` file contains the configuration of the Memorystore instance. This resource will create a Redis instance with name `cache-1`, version `6.x`, read replica count `1`, and the size of `5 GB`.

### `vpc.tf`

The `vpc.tf` file contains the dedicated VPC network definition. It creates the VPC network called `app-network` .
