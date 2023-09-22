
describe pris_requisition('foomerge') do
  its('requisition_name') { should eq 'foomerge' }
  its('source') { should eq 'merge' }
  its('source_properties') { should eq 'A.url' => 'http://localhost:8000/requisitions/foo', 'A.keepAll' => 'false', 'B.url' => 'http://localhost:8000/requisitions/foohttp', 'B.keepAll' => 'true' }
  its('content') { should eq <<-EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model-import xmlns="http://xmlns.opennms.org/xsd/config/model-import" foreign-source="foomerge">
    <node node-label="127.0.0.2" foreign-id="127.0.0.2">
        <interface ip-addr="127.0.0.2" managed="true" snmp-primary="P"/>
    </node>
    <node node-label="127.0.0.1" foreign-id="127.0.0.1">
        <interface ip-addr="127.0.0.1" managed="true" snmp-primary="P"/>
    </node>
    <node node-label="172.0.0.3" foreign-id="172.0.0.3">
        <interface ip-addr="172.0.0.3" managed="true" snmp-primary="P"/>
    </node>
</model-import>
EOF
  }
end
