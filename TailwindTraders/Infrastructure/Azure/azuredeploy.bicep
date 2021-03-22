param baseName string = 'dsr'
param appName string = 'tailwindtraders'
@allowed([
  'test'
  'prod'
])
param environment string = 'test'
param logAnalyticsWorkspaceId string = ''

var applicationInsightsName_var = '${baseName}-${appName}-${environment}-ai'
var serverFarmName_var = '${baseName}-${appName}-${environment}-asp'
var webAppName_var = concat(baseName, appName, environment)

resource applicationInsightsName 'microsoft.insights/components@2020-02-02-preview' = {
  name: applicationInsightsName_var
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspaceId
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource serverFarmName 'Microsoft.Web/serverfarms@2018-02-01' = {
  name: serverFarmName_var
  location: resourceGroup().location
  sku: {
    name: 'S1'
    tier: 'Standard'
    size: 'S1'
    family: 'S'
    capacity: 1
  }
  kind: 'app'
  properties: {
    perSiteScaling: false
    maximumElasticWorkerCount: 1
    targetWorkerCount: 0
    targetWorkerSizeId: 0
  }
}

resource webAppName 'Microsoft.Web/sites@2018-11-01' = {
  name: webAppName_var
  location: resourceGroup().location
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${webAppName_var}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${webAppName_var}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverFarmName.id
    clientAffinityEnabled: true
  }
  dependsOn: [
    applicationInsightsName
  ]
}

resource webAppName_appsettings 'Microsoft.Web/sites/config@2018-11-01' = {
  name: '${webAppName.name}/appsettings'
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: reference('microsoft.insights/components/${applicationInsightsName_var}').InstrumentationKey
  }
  dependsOn: [
    applicationInsightsName
  ]
}

resource webAppName_web 'Microsoft.Web/sites/config@2018-11-01' = {
  name: '${webAppName.name}/web'
  location: resourceGroup().location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    phpVersion: '5.6'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$${webAppName_var}'
    azureStorageAccounts: {}
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    ftpsState: 'AllAllowed'
    reservedInstanceCount: 0
  }
}

resource webAppName_webAppName_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2018-11-01' = {
  name: '${webAppName.name}/${webAppName_var}.azurewebsites.net'
  properties: {
    siteName: 'variables(\'webAppName\')'
    hostNameType: 'Verified'
  }
}

resource webAppName_offline 'Microsoft.Web/sites/slots@2018-11-01' = {
  name: '${webAppName.name}/offline'
  location: resourceGroup().location
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${webAppName_var}-offline/${webAppName_var}-offline.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${webAppName_var}-offline/${webAppName_var}-offline.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverFarmName.id
    clientAffinityEnabled: true
  }
  dependsOn: [
    applicationInsightsName
  ]
}

resource webAppName_offline_appsettings 'Microsoft.Web/sites/slots/config@2018-11-01' = {
  name: '${webAppName_offline.name}/appsettings'
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: reference('microsoft.insights/components/${applicationInsightsName_var}').InstrumentationKey
  }
  dependsOn: [
    applicationInsightsName
  ]
}

resource webAppName_offline_web 'Microsoft.Web/sites/slots/config@2018-11-01' = {
  name: '${webAppName_offline.name}/web'
  location: resourceGroup().location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$${webAppName_var}__offline'
    azureStorageAccounts: {}
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    ftpsState: 'AllAllowed'
    reservedInstanceCount: 0
  }
  dependsOn: [
    webAppName
  ]
}

resource webAppName_offline_webAppName_offline_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2018-11-01' = {
  name: '${webAppName_offline.name}/${webAppName_var}-offline.azurewebsites.net'
  properties: {
    siteName: '${webAppName_var}(offline)'
    hostNameType: 'Verified'
  }
  dependsOn: [
    webAppName
  ]
}
