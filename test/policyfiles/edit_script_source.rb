name 'pris_edit_script_source'
default_source :supermarket
run_list 'yum-centos-ct::default', 'pris_java::default', 'pris_test::edit_script_source'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
