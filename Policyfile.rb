name 'pris-templates'
default_source :supermarket
metadata
run_list 'pris_test::postgres', 'pris_test', 'pris_java::user'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
