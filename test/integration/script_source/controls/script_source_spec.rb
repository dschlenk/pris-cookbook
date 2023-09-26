describe pris_requisition('fooscript') do
  its('requisition_name') { should eq 'fooscript' }
  its('source') { should eq 'script' }
  its('source_properties') { should eq 'file' => 'myGroovySource.groovy', 'count' => '3' }
  its('content') do
    should eq <<-EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model-import xmlns="http://xmlns.opennms.org/xsd/config/model-import" foreign-source="fooscript">
    <node node-label="MyNodeLabel0" foreign-id="MyForeignId0">
        <interface ip-addr="127.0.0.0" status="1" snmp-primary="P">
            <monitored-service service-name="ICMP"/>
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="HTTP"/>
        </interface>
        <asset name="city" value="Fulda"/>
        <asset name="zip" value="36039"/>
        <asset name="country" value="Germany"/>
    </node>
    <node node-label="MyNodeLabel1" foreign-id="MyForeignId1">
        <interface ip-addr="127.0.0.1" status="1" snmp-primary="P">
            <monitored-service service-name="ICMP"/>
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="HTTP"/>
        </interface>
        <asset name="city" value="Fulda"/>
        <asset name="zip" value="36039"/>
        <asset name="country" value="Germany"/>
    </node>
    <node node-label="MyNodeLabel2" foreign-id="MyForeignId2">
        <interface ip-addr="127.0.0.2" status="1" snmp-primary="P">
            <monitored-service service-name="ICMP"/>
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="HTTP"/>
        </interface>
        <asset name="city" value="Fulda"/>
        <asset name="zip" value="36039"/>
        <asset name="country" value="Germany"/>
    </node>
</model-import>
EOF
  end
end
