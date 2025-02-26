remote_file "#{Chef::Config['file_cache_path']}/openldap-2.6.6-4.el9.x86_64.rpm" do
  source 'https://github.com/dschlenk/opennms-cookbook/raw/refs/heads/master/files/default/openldap-2.6.6-4.el9.x86_64.rpm'
  not_if 'rpm -q openldap-2.6.6-4'
end

dnf_package 'openldap' do
  source "#{Chef::Config['file_cache_path']}/openldap-2.6.6-4.el9.x86_64.rpm"
  allow_downgrade true
  action :upgrade
end
