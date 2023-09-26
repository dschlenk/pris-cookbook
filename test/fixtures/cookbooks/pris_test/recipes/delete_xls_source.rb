include_recipe 'pris_test::xls_source'

pris_requisition 'delete myRouter' do
  action :delete
  requisition_name 'myRouter'
end
