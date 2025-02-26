name 'pris_jdbc_source'
default_source :supermarket
run_list 'openldap_patch', 'pris_java::default', 'pris_test::jdbc_source'
cookbook 'pris', path: '../..'
cookbook 'pris_test', path: '../fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: '../fixtures/cookbooks/pris_java'
cookbook 'openldap_patch', path: '../fixtures/cookbooks/openldap_patch'
