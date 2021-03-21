# Demo Script for Fundamentals of DevOps in Azure

## Preparation

1. Open: https://github.com/organizations/tailwindtradersdsr/settings/installations
1. Uninstall Azure Boards App.
1. Uninstall Azure Pipelines App.
1. Open: https://dev.azure.com/dscottraynsfordlabs/Tailwind%20Traders%20(Special)
1. Remove GitHub connection.
1. Remove work item "Correct title on the main app page"

## Getting Started

### Create GitHub account and Organization

> Time: 2.5 min

1. Open https://github.com in private browser
1. Create new account…
1. Sign into my account dscottraynsford@outlook.com with password ...
1. Select `New Organization` from the new menu.
1. Choose free tier, but point out other tiers.
1. Fill in organization form with `tailwindtradersdemo`
1. Demonstrate already created organization https://github.com/tailwindtradersdsr

### Create Azure DevOps Organization

> Time: 2.5 min

1. Open https://dev.azure.com in private browser
1. Show `Start Free` and `Sign in to Azure DevOps`
1. Click `Start free with GitHub`
1. **Point out that as I already have an Azure DevOps organization it is displaying that, but if I didn't I would be invited to create one.**
1. Click `New Organization`.
1. Fill in organization form with `tailwindtradersdsr2`
1. Select location as Australia East, but show region drop down.
1. Create new organization.
1. **Point out need to create new project. Mention that most organizations only need one. Recommend not creating multiple.**
1. Enter `Tailwind Traders` as the project name.
1. Enter `Tailwind Traders Application` into description.
1. Make it `Public` but define the difference.
1. Expand advanced and talk about `Git` vs `TFVC` and work item process set to `Agile`.
1. Click `Project Settings`
1. Turn-off `Repos`.

## Azure DevOps Boards

### Connect Azure DevOps Boards to GitHub Organization

> Time: 2 min

**This is so that Azure DevOps boards can automatically link work items to mentions @AB

1. Click `Project Settings`
1. Select `GitHub connections`.
1. Select Boards and click `Connect your GitHub account`.
1. Click `Grant` next to `tailwindtradersdsr`.
1. Click `Authorize AzureBoards`.
1. Select `tailwindtradersdsr`.
1. Click `Save`.
1. Select `All respositories`.
1. Click `Approve, Install, & Authorize`.
1. Show `Installed GitHub Apps`.

### Demonstrate Dashboards

> Time: 2 min

1. Open Overview > Dashboards `https://dev.azure.com/tailwindtradersdsr/Tailwind%20Traders/_dashboards/dashboard/77a6fbc4-6f90-4236-b653-ce50d106668f`
1. Favorite the dashboard.
1. Create `New dashboard`
1. Name it `Build Overview`
1. Make it a `Project Dashboard`
1. Add some widgets related to build.

### Demonstrate Wiki

> Time: 1 min

1. Open Overview > Wiki `https://dev.azure.com/tailwindtradersdsr/Tailwind%20Traders/_wiki/wikis`
1. Click `Create project wiki`.
1. Enter the page title for the wiki and type some text, including an @ and a #.

### Demonstrate Boards

> Time: 5 min

1. Select `Work Items`.
1. Edit a work item.
1. Create a new story:
    1. Title: `Correct title on the main app page`
    1. Area: `Website Team`.
    1. Description: `Change title`.
    1. Set story points: 1.
    1. Save the item.
1. Select `Boards`.
1. Select Website Team Boards.
1. Point out story that was just created.
1. Add task: 'CHange title'
1. Add task: 'Update tests'
1. Move story to `Active`.
1. Note assigned to me.
1. Open work item and note the 'Links' to GitHub and Deployment
1. Select `Sprints`.
1. Change to `Tailwind Traders Team`.
1. Select `Capacity`
1. Configure Activity and Capacity per day and days off.
1. Select `Backlog`
1. Drag backlog items into Iteration
1. Select `Queries`.
1. Mention that you can create custom work item queries.
1. Select `Delivery Plans`
1. Create a new Delivery Plan and include both teams

## GitHub Planning

> Time: 2 min

Talk briefly about GitHub issues.

1. Point out issues and create one. NOTE: These don't get sent to Azure Boards.
1. Point out projects and create one.

## Version Control

1. Open `https://github.com/tailwindtradersdsr`
1. Indicate two repositories.
1. Show `New Repository` command and `Import repository`.
1. Open `tailwindtraders-webapp` repository: https://github.com/tailwindtradersdsr/tailwindtraders-webapp
1. Show application running: ...
1. Show application in Visual Studio 2019 and indicate .NET Core MVC with Tests.
1. Show Infrastructure folder.

## GitHub Codespaces

### Brief demonstration of GitHub Codespaces

> Time: 3 min

1. Open https://github.com/codepsaces in NORMAL browser to use PlagueHO account.
1. Show Source file.
1. In terminal run `./build.ps1 -Tasks test`

## Infrastructure as Code

### Display ARM Template

## Branches, Pull Requests and Continuous Integration & Automated Testing

### End-to-end demonstration

**Demonstrate making a change to the pipeline**

- [Dev/Test](https://dsrtailwindtraderstest.azurewebsites.net)
- [Dev/Test Offline](https://dsrtailwindtraderstest-offline.azurewebsites.net)
- [Prod](https://dsrtailwindtradersprod.azurewebsites.net)
- [Prod Offline](https://dsrtailwindtradersprod-offline.azurewebsites.net)


### Create Build Pipeline

1. Create a New Pipeline
1. Select Classic Editor - **Discus pipeline as code with YAML**
1. Select GitHub
1. Select Repository - tailwindtradersdsr/tailwindtraders-webapp
1. Click Continue.
1. Select ASP.NET Core
1. Click Apply.
1. Select Publish Artifact step and change artifact name to `WebApp`
1. Add new step `Publish Pipeline Artifacts`.
1. Set `Display Name` to `Publish ARM`.
1. Set `Artifact Name` to `Azure`.
1. Set `File or directory path` to `TailwindTraders/TailwindTraders.WebApp/Infrastructure/Azure`.
1. Select Triggers.
1. Enable Continuous Integration.
1. Enable Pull Request validation.
1. Rename the pipeline
1. Save the pipeline as `tailwindtraders-webapp.classic.new`.
1. Run the pipeline

### Create Branch Protection Rule

1. Open `Settings` of tailwindtraders-webapp: https://github.com/tailwindtradersdsr/tailwindtraders-webapp/settings
1. Select `Branches`.
1. Click `Add rule`.
1. Enter `main` in `Branch name pattern`.
1. Tick `Require pull request reviews before merging`.
1. Tick `Require status checks to pass before merging`.
1. Select `tailwindtraders-webapp.classic`.
1. Click `Save Changes`.

### 
