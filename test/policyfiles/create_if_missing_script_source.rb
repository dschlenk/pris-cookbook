name 'pris_create_if_missing_script_source'
default_source :supermarket
run_list 'yum-centos-ct::default', 'pris_java::default', 'pris_test::create_if_missing_script_source'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
