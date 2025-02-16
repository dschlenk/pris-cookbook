name 'pris_file_source'
default_source :supermarket
run_list 'yum-centos-ct::default', 'pris_java::default', 'pris_test::file_source'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
