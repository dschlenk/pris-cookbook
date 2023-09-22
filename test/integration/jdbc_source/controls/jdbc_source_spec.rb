describe pris_requisition('foojdbc') do
  its('requisition_name') { should eq 'foojdbc' }
  its('source') { should eq 'jdbc' }
  its('source_properties') { should eq 'driver' => 'org.postgresql.Driver', 'url' => 'jdbc:postgresql://localhost:5432/opennms', 'user' => 'opennms', 'password' => 'opennms', 'selectStatement' => 'SELECT \'jdbc-node-fs-id\' AS Foreign_Id, \'jdbc-nodelabel\' AS Node_Label, \'127.0.0.1\' AS IP_Address, \'P\' AS MgmtType, 1 AS InterfaceStatus' }
  its('content') { should eq <<-EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model-import xmlns="http://xmlns.opennms.org/xsd/config/model-import" foreign-source="foojdbc">
    <node node-label="jdbc-nodelabel" foreign-id="jdbc-node-fs-id">
        <interface ip-addr="127.0.0.1" status="1" snmp-primary="P"/>
    </node>
</model-import>
EOF
  }
end
