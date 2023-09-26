include_recipe 'pris_test::script_source'

pris_requisition 'edit fooscript' do
  requisition_name 'fooscript'
  source 'script'
  source_properties(
    'file' => 'myGroovySource.groovy',
    'count' => '5'
  )
end
