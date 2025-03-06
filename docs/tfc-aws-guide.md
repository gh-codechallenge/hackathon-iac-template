# Setting Up a Terraform Cloud Organization and Managing Cloud Credentials

This guide will help you set up a **Terraform Cloud** organization and configure AWS/Azure credentials as variable sets to be consumed automatically.

## Prerequisites

- A **Terraform Cloud** account ([Sign up here](https://app.terraform.io/signup)).
- AWS or Azure credentials.
- Terraform CLI installed ([Install Terraform](https://developer.hashicorp.com/terraform/downloads)).
- API token for authentication.

---

## 1. Creating a Terraform Cloud Organization

1. Log in to **Terraform Cloud** ([Terraform Cloud](https://app.terraform.io)).
2. Click on **Organizations** > **Create a new organization**.
3. Enter an **Organization Name** (must be unique globally).
4. Choose an **Email Address** for notifications.
5. Click **Create organization**.
6. Once created, navigate to the **Settings** tab to configure organization policies if needed.

---

## 2. Storing AWS or Azure Credentials as Variable Sets

Terraform Cloud allows you to define reusable **variable sets** that can be applied to multiple workspaces.

### AWS Credentials

1. Navigate to **Your Organization** > **Variable Sets**.
2. Click **Create variable set**.
3. Name your variable set (e.g., `AWS Credentials`).
4. Select **Apply to all workspaces** or specific ones.
5. Add the following **environment variables**:

   - `AWS_ACCESS_KEY_ID` → **Value:** Your AWS access key ID (**Sensitive**)
   - `AWS_SECRET_ACCESS_KEY` → **Value:** Your AWS secret key (**Sensitive**)
   - `AWS_REGION` → **Value:** Your default AWS region

6. Click **Save variable set**.

### Azure Credentials

1. Navigate to **Your Organization** > **Variable Sets**.
2. Click **Create variable set**.
3. Name your variable set (e.g., `Azure Credentials`).
4. Select **Apply to all workspaces** or specific ones.
5. Add the following **environment variables**:

   - `ARM_CLIENT_ID` → **Value:** Your Azure service principal client ID (**Sensitive**)
   - `ARM_CLIENT_SECRET` → **Value:** Your Azure service principal client secret (**Sensitive**)
   - `ARM_SUBSCRIPTION_ID` → **Value:** Your Azure subscription ID
   - `ARM_TENANT_ID` → **Value:** Your Azure tenant ID

6. Click **Save variable set**.

---

## 3. Authenticating with a User Token

To authenticate Terraform CLI with Terraform Cloud, you need a user API token:

1. Go to **Your User Settings** > **Tokens**.
2. Click **Create an API token**.
3. Name your token (e.g., `Terraform CLI`), then click **Generate token**.
4. Copy the generated token (it won’t be shown again).
5. Authenticate your CLI:
   
   ```sh
   terraform login
   ```
   
6. When prompted, paste the API token.
7. Terraform CLI will now be authenticated with Terraform Cloud.

---

## 4. Verifying the Setup

To ensure Terraform Cloud is using the variable sets, run:

```sh
echo $TF_CLOUD_ORGANIZATION
echo $AWS_ACCESS_KEY_ID
echo $ARM_CLIENT_ID
```

You can also create a test workspace and run `terraform plan` to check if the credentials are applied correctly.

---

## Conclusion

You have successfully set up a Terraform Cloud organization, stored AWS/Azure credentials as variable sets, and authenticated with a user API token. You can now manage infrastructure using Terraform Cloud with automated authentication to your cloud provider.

For more details, refer to [Terraform Cloud Documentation](https://developer.hashicorp.com/terraform/cloud-docs).

