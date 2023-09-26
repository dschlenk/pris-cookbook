include_recipe 'pris_test::script_source'

pris_requisition 'do nothing because :create_if_missing fooscript' do
  action :create_if_missing
  requisition_name 'fooscript'
  source 'script'
  source_properties(
    'file' => 'myGroovySource.groovy',
    'count' => '5'
  )
end
