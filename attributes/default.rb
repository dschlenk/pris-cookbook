default['pris']['home'] = '/opt/opennms-pris'
default['pris']['version'] = '2.1.0-b2132'
default['pris']['archive'] = "opennms-pris-release-#{node['pris']['version']}.tar.gz"
default['pris']['download_url'] = "https://github.com/OpenNMS/opennms-provisioning-integration-server/releases/download/#{node['pris']['version']}/#{node['pris']['archive']}"
default['pris']['global'] = {
  driver: 'http',
  host: '127.0.0.1',
  port: 8000,
}
default['pris']['user'] = 'pris'
default['pris']['java_home'] = '/usr'
