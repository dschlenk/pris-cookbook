# Chef Cookbook for OpenNMS PRIS

This cookbook installs [OpenNMS PRIS](https://github.com/OpenNMS/opennms-provisioning-integration-server) on rhel 6/7 derivatives.

## Requirements

 - CentOS 6 or CentOS 7
 - Java 11
 - Chef 13+

## Recipes

`default`: installs PRIS

## Attributes

```
default['pris']['home'] = '/opt/opennms-pris' # installation location
default['pris']['version'] = '2.0.0-b1051' # version to install
default['pris']['archive'] = "opennms-pris-release-#{node['pris']['version']}.tar.gz" # filename to download
default['pris']['download_url'] = "https://github.com/OpenNMS/opennms-provisioning-integration-server/releases/download/#{node['pris']['version']}/#{node['pris']['archive']}" # full download location
default['pris']['global'] = { # options for $PRIS_HOME/global.properties
  driver: 'http',
  host: '0.0.0.0',
  port: 8000,
}
default['pris']['user'] = 'pris' # the user to create and run the service as
default['pris']['java_home'] = '/usr' # the directory in which `bin/java` resides
```

## Resources

`pris_requisition`: creates a directory in `$PRIS_HOME/requisitions` for the requisition defined by this resource and manages the `requisition.properties` file according to the properties defined in the resource.

### Actions

- `:create`: creates or updates an existing requisition
- `:create_if_missing`: creates a new requisition if not already present
- `:delete`: deletes requisition if it exists

### Properties

| Name                | Name? | Type         | Default | Description                                                                   | Allowed Values                                                   |
| ------------------- | ----- | ------------ | ------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `requisition_name`  |   X   | String       |         | The name of the requisition. The resource name is used when null.             |                                                                  |
| `source`            |       | String       | 'file'  | The requisition source type.                                                  | file, http, jdbc, merge, script, xls, ocs.computers, ocs.devices |
| `source_properties` |       | Hash         | {}      | Additional properties to set prefixed by `source.`.                           |                                                                  |
| `mapper`            |       | String       | 'echo'  | The type of mapper to use.                                                    |                                                                  |
| `mapper_properties` |       | Hash         | {}      | Additional properties to set prefixed by `mapper.`.                           |                                                                  |
| `script_file`       |       | Array        | []      | Values are joined by a comma and set to the property `script.file`            |                                                                  |

## Usage

Include the default recipe in your run list if you'd like to install PRIS. Use the `pris_requisition` resource to manage requisitions. See the [recipes in the pris_test](test/fixtures/cookbooks/pris_test/recipes) test fixture cookbook and the corresponding [inspec tests](test/integration) for examples of using each different source type. Note that it is your responsibility to ensure that any external resources (files, etc) referenced by your requisition actually exist.

License & Authors
-----------------
- Author: David Schlenk <dschlenk@convergeone.com>

```text
Copyright: 2015-2023 ConvergeOne Holdings Corp

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
