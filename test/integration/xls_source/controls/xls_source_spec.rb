describe pris_requisition('myRouter') do
  its('requisition_name') { should eq 'myRouter' }
  its('source') { should eq 'xls' }
  its('source_properties') { should eq 'file' => '../myInventory.xls' }
  its('mapper') { should eq 'echo' }
  its('content') do
    should eq <<-EOF
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
  end
end

describe pris_requisition('myServer') do
  its('requisition_name') { should eq 'myServer' }
  its('source') { should eq 'xls' }
  its('source_properties') { should eq 'file' => '../myInventory.xls' }
  its('mapper') { should eq 'echo' }
  its('content') do
    should eq <<-EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model-import xmlns="http://xmlns.opennms.org/xsd/config/model-import" foreign-source="myServer">
    <node node-label="dc01" foreign-id="dc01" location="Default">
        <interface ip-addr="172.16.23.10" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Core-Infrastructure"/>
    </node>
    <node node-label="dc02" foreign-id="dc02" location="Default">
        <interface ip-addr="172.16.23.10" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Core-Infrastructure"/>
    </node>
    <node node-label="filesrv01" foreign-id="filesrv01" location="MyTestLocation">
        <interface ip-addr="172.16.23.11" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <interface ip-addr="172.16.23.12" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Core-Infrastructure"/>
        <category name="Core-Infrastructure"/>
    </node>
    <node node-label="exch01" foreign-id="exch01" location="MyTestLocation">
        <interface ip-addr="172.16.23.20" snmp-primary="P">
            <monitored-service service-name="SNMP"/>
            <monitored-service service-name="IMAP"/>
            <monitored-service service-name="SMTP"/>
            <monitored-service service-name="ICMP"/>
        </interface>
        <category name="Mail"/>
        <category name="Core-Infrastructure"/>
    </node>
</model-import>
EOF
  end
end
