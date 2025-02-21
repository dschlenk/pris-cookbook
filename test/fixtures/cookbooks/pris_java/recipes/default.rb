openjdk_pkg_install '8' do
  alternatives_priority 3
  reset_alternatives true
  default false
end
openjdk_pkg_install '11' do
  alternatives_priority 2
  reset_alternatives false
  default true
end
openjdk_pkg_install '17' do
  alternatives_priority 1
  reset_alternatives false
  default false
end
