name 'pris-templates'
default_source :supermarket
metadata
run_list 'openldap_patch', 'pris_java::default', 'pris::default', 'pris_test::file_source', 'pris_test::http_source', 'pris_test::jdbc_source', 'pris_test::merge_source', 'pris_test::script_source', 'pris_test::xls_source'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
cookbook 'openldap_patch', path: 'test/fixtures/cookbooks/openldap_patch'
