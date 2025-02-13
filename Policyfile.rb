name 'opennms-templates'
default_source :supermarket
metadata
run_list 'opennms::postgres', ''pris_test', 'pris_java'
cookbook 'pris_test', path: 'test/fixtures/cookbooks/pris_test'
cookbook 'pris_java', path: 'test/fixtures/cookbooks/pris_java'
