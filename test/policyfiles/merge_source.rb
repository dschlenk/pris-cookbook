name 'pris_merge_source'
default_source :supermarket
run_list 'pris_java::default', 'pris_test::merge_source'
cookbook 'pris', path: '../..'
cookbook 'pris_test', path: '../fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: '../fixtures/cookbooks/pris_java'
