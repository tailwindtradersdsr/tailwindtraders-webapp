# Demonstration instructions for IAC

Login to Azure:

```bash
az login
```

Select customer subscription:

```bash
az account set --subscription 'Customer'
```

## Test Environment

Create resource group and deploy to it:

```bash
az group create \
    --name dsr-tailwindtraders-test-rg \
    --location eastus

az deployment group create \
    --resource-group dsr-tailwindtraders-test-rg \
    --template-file ./TailwindTraders/Infrastructure/Azure/azuredeploy.json \
    --parameters baseName=dsr appName=tailwindtraders environment=test logAnalyticsWorkspaceId="/subscriptions/c7f8ca1e-46f6-4a59-a039-15eaefd2337e/resourceGroups/defaultresourcegroup-eus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-c7f8ca1e-46f6-4a59-a039-15eaefd2337e-eus"
```

## Prod Environment

Create resource group and deploy to it:

```bash
az group create \
    --name dsr-tailwindtraders-prod-rg \
    --location eastus

az deployment group create \
    --resource-group dsr-tailwindtraders-prod-rg \
    --template-file ./TailwindTraders/Infrastructure/Azure/azuredeploy.json \
    --parameters baseName=dsr appName=tailwindtraders environment=test logAnalyticsWorkspaceId="/subscriptions/c7f8ca1e-46f6-4a59-a039-15eaefd2337e/resourceGroups/defaultresourcegroup-eus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-c7f8ca1e-46f6-4a59-a039-15eaefd2337e-eus"
```

## Bicep

Generate a bicep file from an ARM template.

```bash
../bicep decompile ./TailwindTraders/Infrastructure/Azure/azuredeploy.json
```

Generate am ARM Template from a bicep file.

```bash
../bicep build ./TailwindTraders/Infrastructure/Azure/azuredeploy.json --outfile azuredeploy.frombicep.json
```
