
describe pris_requisition('myRouter') do
  its('requisition_name') { should eq 'myRouter' }
  its('source') { should eq 'xls' }
  its('source_properties') { should eq 'file' => '../myInventory.csv', 'count' => '3' }
  its('mapper') { should eq 'echo' }
  its('content') { should eq <<-EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model-import xmlns="http://xmlns.opennms.org/xsd/config/model-import" foreign-source="myRouter">
    <node node-label="bbone-gw1" foreign-id="bbone-gw1">
        <interface ip-addr="10.0.23.1" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Backbone"/>
    </node>
    <node node-label="bbone-gw2" foreign-id="bbone-gw2">
        <interface ip-addr="10.0.23.2" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Backbone"/>
    </node>
    <node node-label="rt-01" foreign-id="rt-01">
        <interface ip-addr="172.16.23.1" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Office"/>
    </node>
    <node node-label="rt-02" foreign-id="rt-02">
        <interface ip-addr="172.16.23.2" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <interface ip-addr="172.16.23.3" snmp-primary="S">
            <monitored-service service-name="ICMP"/>
            <monitored-service service-name="StrafePing"/>
        </interface>
        <interface ip-addr="192.168.30.1" snmp-primary="N"/>
        <category name="Office"/>
    </node>
</model-import>
EOF
  }
end
