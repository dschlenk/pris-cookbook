if platform_family?('rhel') && node['platform_version'].to_i == 6
  execute 'install corretto GPG key' do
    command 'rpm --import https://yum.corretto.aws/corretto.key'
    not_if { ::File.exist?('/etc/yum.repos.d/corretto.repo') }
  end
  execute 'install corretto yum repo' do
    command 'curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo'
    not_if { ::File.exist?('/etc/yum.repos.d/corretto.repo') }
  end
  yum_package 'java-11-amazon-corretto-devel'
else
  openjdk_pkg_install '8' do
    alternatives_priority 3
    reset_alternatives true
    default true
  end
  openjdk_pkg_install '11' do
    alternatives_priority 2
    reset_alternatives false
    default false
  end
end
