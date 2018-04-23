<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="PC_out(31:0)" />
        <signal name="branch_pc(31:0)" />
        <signal name="PC_4(31:28),inst_field(25:0),N0,N0" />
        <signal name="Branch(1:0)" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="next_pc(31:0)" />
        <signal name="V5" />
        <signal name="N0" />
        <signal name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,V5,N0,N0" />
        <signal name="Imm_32(29:0),N0,N0" />
        <signal name="Imm_32(31:0)" />
        <signal name="ALU_out(31:0)" />
        <signal name="Data_out(31:0)" />
        <signal name="ALU_B(31:0)" />
        <signal name="WriteDATA(31:0)" />
        <signal name="inst_field(15:0)" />
        <signal name="ALU_Control(2:0)" />
        <signal name="ALUSrc_B" />
        <signal name="RegWrite" />
        <signal name="inst_field(25:21)" />
        <signal name="Jal" />
        <signal name="DatatoReg(1:0)" />
        <signal name="inst_field(20:16)" />
        <signal name="rt(4:0)" />
        <signal name="Wt_addr(4:0)" />
        <signal name="inst_field(15:11)" />
        <signal name="inst_field(25:0)" />
        <signal name="Data_in(31:0)" />
        <signal name="zero" />
        <signal name="overflow" />
        <signal name="RegDst" />
        <signal name="V5,V5,V5,V5,V5" />
        <signal name="PC_4(31:0)" />
        <signal name="inst_field(15:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0," />
        <signal name="rdata_A(31:0)" />
        <signal name="ALU_A(31:0)" />
        <signal name="ALUSrc_A" />
        <port polarity="Output" name="PC_out(31:0)" />
        <port polarity="Input" name="Branch(1:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="ALU_out(31:0)" />
        <port polarity="Output" name="Data_out(31:0)" />
        <port polarity="Input" name="ALU_Control(2:0)" />
        <port polarity="Input" name="ALUSrc_B" />
        <port polarity="Input" name="RegWrite" />
        <port polarity="Input" name="Jal" />
        <port polarity="Input" name="DatatoReg(1:0)" />
        <port polarity="Input" name="inst_field(25:0)" />
        <port polarity="Input" name="Data_in(31:0)" />
        <port polarity="Output" name="zero" />
        <port polarity="Output" name="overflow" />
        <port polarity="Input" name="RegDst" />
        <port polarity="Input" name="ALUSrc_A" />
        <blockdef name="REG32">
            <timestamp>2017-4-3T11:57:47</timestamp>
            <rect style="fillcolor:rgb(0,255,255);fillstyle:Solid" width="88" x="32" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="32" />
            <line x2="0" y1="-160" y2="-160" x1="32" />
            <line x2="0" y1="-96" y2="-96" x1="32" />
            <line x2="0" y1="-32" y2="-32" style="linewidth:W" x1="32" />
            <line x2="120" y1="-128" y2="-128" style="linewidth:W" x1="144" />
        </blockdef>
        <blockdef name="add_32">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <line x2="0" y1="-48" y2="-48" style="linewidth:W" x1="16" />
            <line x2="0" y1="-16" y2="-16" style="linewidth:W" x1="16" />
            <line x2="80" y1="4" y2="-16" x1="16" />
            <line x2="16" y1="-24" y2="4" x1="16" />
            <line x2="28" y1="-24" y2="-32" x1="16" />
            <line x2="28" y1="-40" y2="-32" x1="16" />
            <line x2="16" y1="-40" y2="-68" x1="16" />
            <line x2="80" y1="-68" y2="-48" x1="16" />
            <line x2="80" y1="-48" y2="-16" x1="80" />
            <line x2="96" y1="-32" y2="-32" style="linewidth:W" x1="80" />
        </blockdef>
        <blockdef name="MUX2T1_32">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <rect width="40" x="12" y="-100" height="100" />
            <line x2="32" y1="-112" y2="-100" x1="32" />
            <line x2="52" y1="-48" y2="-48" style="linewidth:W;linecolor:rgb(0,0,0)" x1="64" />
            <line x2="0" y1="-80" y2="-80" style="linewidth:W" x1="12" />
            <line x2="0" y1="-16" y2="-16" style="linewidth:W" x1="12" />
        </blockdef>
        <blockdef name="alu">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <line x2="140" y1="-216" y2="-136" style="linewidth:W;linecolor:rgb(255,0,0)" x1="64" />
            <line x2="140" y1="-72" y2="-136" style="linewidth:W;linecolor:rgb(255,0,0)" x1="64" />
            <line x2="64" y1="-72" y2="96" style="linewidth:W;linecolor:rgb(255,0,0)" x1="64" />
            <line x2="384" y1="-48" y2="-232" style="linewidth:W;linecolor:rgb(255,0,0)" x1="384" />
            <line x2="64" y1="-232" y2="-384" style="linewidth:W;linecolor:rgb(255,0,0)" x1="384" />
            <line x2="448" y1="-208" y2="-208" x1="384" />
            <rect width="64" x="384" y="-156" height="24" />
            <line x2="448" y1="-144" y2="-144" x1="384" />
            <line x2="448" y1="-80" y2="-80" x1="384" />
            <line x2="64" y1="-216" y2="-384" style="linewidth:W;linecolor:rgb(255,0,0)" x1="64" />
            <line x2="64" y1="-48" y2="96" style="linewidth:W;linecolor:rgb(255,0,0)" x1="384" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="4" height="24" />
            <line x2="0" y1="16" y2="16" x1="64" />
            <line x2="240" y1="-384" y2="-300" x1="240" />
            <rect width="16" x="232" y="-384" height="84" />
        </blockdef>
        <blockdef name="Regs">
            <timestamp>2017-4-3T11:57:46</timestamp>
            <rect style="linewidth:W;linecolor:rgb(255,0,0);fillcolor:rgb(254,180,229);fillstyle:Solid" width="352" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="240" y1="-496" y2="-448" x1="240" />
            <rect width="64" x="416" y="-396" height="24" />
            <line x2="480" y1="-384" y2="-384" x1="416" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <rect width="64" x="416" y="-124" height="24" />
            <line x2="480" y1="-112" y2="-112" x1="416" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="MUX2T1_5">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <line x2="16" y1="-80" y2="-72" x1="16" />
            <line x2="4" y1="-48" y2="-48" style="linewidth:W" x1="0" />
            <line x2="4" y1="-16" y2="-16" style="linewidth:W" x1="0" />
            <line x2="28" y1="-32" y2="-32" style="linewidth:W" x1="32" />
            <rect width="24" x="4" y="-72" height="72" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="Ext_32">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <circle style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" r="69" cx="185" cy="-33" />
            <line x2="124" y1="0" y2="0" style="linewidth:W" x1="96" />
            <line x2="272" y1="-64" y2="-64" style="linewidth:W" x1="248" />
            <rect style="linecolor:rgb(255,255,255)" width="128" x="120" y="-80" height="88" />
        </blockdef>
        <blockdef name="MUX4T1_32">
            <timestamp>2017-4-3T11:57:48</timestamp>
            <line x2="0" y1="-80" y2="-80" style="linewidth:W" x1="12" />
            <line x2="0" y1="-48" y2="-48" style="linewidth:W" x1="12" />
            <line x2="0" y1="-16" y2="-16" style="linewidth:W" x1="12" />
            <rect width="40" x="12" y="-136" height="128" />
            <line x2="0" y1="-112" y2="-112" style="linewidth:W" x1="12" />
            <line x2="32" y1="-136" y2="-144" style="linewidth:W" x1="32" />
            <line x2="52" y1="-96" y2="-96" style="linewidth:W;linecolor:rgb(0,0,0)" x1="64" />
        </blockdef>
        <block symbolname="REG32" name="XLXI_20">
            <blockpin signalname="next_pc(31:0)" name="D(31:0)" />
            <blockpin signalname="V5" name="CE" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="PC_out(31:0)" name="Q(31:0)" />
        </block>
        <block symbolname="add_32" name="XLXI_21">
            <blockpin signalname="PC_4(31:0)" name="c(31:0)" />
            <blockpin signalname="PC_out(31:0)" name="a(31:0)" />
            <blockpin signalname="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,V5,N0,N0" name="b(31:0)" />
        </block>
        <block symbolname="MUX4T1_32" name="XLXI_23">
            <blockpin signalname="Branch(1:0)" name="s(1:0)" />
            <blockpin signalname="PC_4(31:0)" name="I0(31:0)" />
            <blockpin signalname="branch_pc(31:0)" name="I1(31:0)" />
            <blockpin signalname="PC_4(31:28),inst_field(25:0),N0,N0" name="I2(31:0)" />
            <blockpin signalname="rdata_A(31:0)" name="I3(31:0)" />
            <blockpin signalname="next_pc(31:0)" name="o(31:0)" />
        </block>
        <block symbolname="add_32" name="XLXI_22">
            <blockpin signalname="branch_pc(31:0)" name="c(31:0)" />
            <blockpin signalname="PC_4(31:0)" name="a(31:0)" />
            <blockpin signalname="Imm_32(29:0),N0,N0" name="b(31:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_24">
            <blockpin signalname="V5" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_25">
            <blockpin signalname="N0" name="G" />
        </block>
        <block symbolname="alu" name="U1">
            <blockpin signalname="zero" name="zero" />
            <blockpin signalname="ALU_out(31:0)" name="res(31:0)" />
            <blockpin signalname="overflow" name="overflow" />
            <blockpin signalname="ALU_A(31:0)" name="A(31:0)" />
            <blockpin signalname="ALU_B(31:0)" name="B(31:0)" />
            <blockpin signalname="ALU_Control(2:0)" name="ALU_operation(2:0)" />
        </block>
        <block symbolname="Regs" name="U2">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="RegWrite" name="L_S" />
            <blockpin signalname="rdata_A(31:0)" name="rdata_A(31:0)" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="WriteDATA(31:0)" name="Wt_data(31:0)" />
            <blockpin signalname="Data_out(31:0)" name="rdata_B(31:0)" />
            <blockpin signalname="inst_field(25:21)" name="R_addr_A(4:0)" />
            <blockpin signalname="inst_field(20:16)" name="R_addr_B(4:0)" />
            <blockpin signalname="Wt_addr(4:0)" name="Wt_addr(4:0)" />
        </block>
        <block symbolname="MUX2T1_32" name="XLXI_15">
            <blockpin signalname="ALUSrc_B" name="s" />
            <blockpin signalname="Data_out(31:0)" name="I0(31:0)" />
            <blockpin signalname="Imm_32(31:0)" name="I1(31:0)" />
            <blockpin signalname="ALU_B(31:0)" name="o(31:0)" />
        </block>
        <block symbolname="Ext_32" name="XLXI_19">
            <blockpin signalname="inst_field(15:0)" name="imm_16(15:0)" />
            <blockpin signalname="Imm_32(31:0)" name="Imm_32(31:0)" />
        </block>
        <block symbolname="MUX2T1_5" name="XLXI_3">
            <blockpin signalname="V5,V5,V5,V5,V5" name="I1(4:0)" />
            <blockpin signalname="inst_field(20:16)" name="I0(4:0)" />
            <blockpin signalname="rt(4:0)" name="o(4:0)" />
            <blockpin signalname="Jal" name="s" />
        </block>
        <block symbolname="MUX2T1_5" name="XLXI_32">
            <blockpin signalname="inst_field(15:11)" name="I1(4:0)" />
            <blockpin signalname="rt(4:0)" name="I0(4:0)" />
            <blockpin signalname="Wt_addr(4:0)" name="o(4:0)" />
            <blockpin signalname="RegDst" name="s" />
        </block>
        <block symbolname="MUX4T1_32" name="XLXI_33">
            <blockpin signalname="DatatoReg(1:0)" name="s(1:0)" />
            <blockpin signalname="ALU_out(31:0)" name="I0(31:0)" />
            <blockpin signalname="Data_in(31:0)" name="I1(31:0)" />
            <blockpin signalname="inst_field(15:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0," name="I2(31:0)" />
            <blockpin signalname="PC_4(31:0)" name="I3(31:0)" />
            <blockpin signalname="WriteDATA(31:0)" name="o(31:0)" />
        </block>
        <block symbolname="MUX2T1_32" name="XLXI_34">
            <blockpin signalname="ALUSrc_A" name="s" />
            <blockpin signalname="rdata_A(31:0)" name="I0(31:0)" />
            <blockpin signalname="Data_out(31:0)" name="I1(31:0)" />
            <blockpin signalname="ALU_A(31:0)" name="o(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1248" y="720" name="XLXI_20" orien="R0">
        </instance>
        <instance x="1632" y="640" name="XLXI_21" orien="R0">
        </instance>
        <branch name="PC_out(31:0)">
            <wire x2="1552" y1="592" y2="592" x1="1392" />
            <wire x2="1632" y1="592" y2="592" x1="1552" />
            <wire x2="2880" y1="496" y2="496" x1="1552" />
            <wire x2="1552" y1="496" y2="592" x1="1552" />
        </branch>
        <instance x="2096" y="720" name="XLXI_23" orien="R0">
        </instance>
        <branch name="branch_pc(31:0)">
            <wire x2="2000" y1="640" y2="656" x1="2000" />
            <wire x2="2096" y1="640" y2="640" x1="2000" />
        </branch>
        <instance x="1904" y="688" name="XLXI_22" orien="R0">
        </instance>
        <branch name="PC_4(31:28),inst_field(25:0),N0,N0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="912" y="832" type="branch" />
            <wire x2="2064" y1="832" y2="832" x1="912" />
            <wire x2="2064" y1="672" y2="832" x1="2064" />
            <wire x2="2096" y1="672" y2="672" x1="2064" />
        </branch>
        <branch name="Branch(1:0)">
            <wire x2="2128" y1="368" y2="368" x1="912" />
            <wire x2="2128" y1="368" y2="576" x1="2128" />
        </branch>
        <branch name="rst">
            <wire x2="1248" y1="560" y2="560" x1="912" />
        </branch>
        <branch name="next_pc(31:0)">
            <wire x2="1248" y1="688" y2="688" x1="1184" />
            <wire x2="1184" y1="688" y2="784" x1="1184" />
            <wire x2="2240" y1="784" y2="784" x1="1184" />
            <wire x2="2240" y1="624" y2="624" x1="2160" />
            <wire x2="2240" y1="624" y2="784" x1="2240" />
        </branch>
        <instance x="1056" y="240" name="XLXI_24" orien="R0" />
        <branch name="V5">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="272" type="branch" />
            <wire x2="1120" y1="240" y2="272" x1="1120" />
            <wire x2="1168" y1="272" y2="272" x1="1120" />
            <wire x2="1120" y1="272" y2="624" x1="1120" />
            <wire x2="1248" y1="624" y2="624" x1="1120" />
        </branch>
        <instance x="1920" y="336" name="XLXI_25" orien="R0" />
        <branch name="N0">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2016" y="176" type="branch" />
            <wire x2="1984" y1="176" y2="208" x1="1984" />
            <wire x2="2016" y1="176" y2="176" x1="1984" />
        </branch>
        <branch name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,V5,N0,N0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1616" y="624" type="branch" />
            <wire x2="1632" y1="624" y2="624" x1="1616" />
        </branch>
        <branch name="Imm_32(29:0),N0,N0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="912" y="880" type="branch" />
            <wire x2="1840" y1="880" y2="880" x1="912" />
            <wire x2="1904" y1="672" y2="672" x1="1840" />
            <wire x2="1840" y1="672" y2="880" x1="1840" />
        </branch>
        <instance x="2176" y="1520" name="U1" orien="R0">
        </instance>
        <instance x="1440" y="1616" name="U2" orien="R0">
        </instance>
        <instance x="2048" y="1584" name="XLXI_15" orien="R0">
        </instance>
        <branch name="Imm_32(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="1888" type="branch" />
            <wire x2="1856" y1="1888" y2="1888" x1="1760" />
            <wire x2="1936" y1="1888" y2="1888" x1="1856" />
            <wire x2="2048" y1="1568" y2="1568" x1="1936" />
            <wire x2="1936" y1="1568" y2="1888" x1="1936" />
        </branch>
        <branch name="ALU_out(31:0)">
            <wire x2="1184" y1="1552" y2="1552" x1="1120" />
            <wire x2="1120" y1="1552" y2="1712" x1="1120" />
            <wire x2="2704" y1="1712" y2="1712" x1="1120" />
            <wire x2="2704" y1="1376" y2="1376" x1="2624" />
            <wire x2="2704" y1="1376" y2="1712" x1="2704" />
            <wire x2="2880" y1="1376" y2="1376" x1="2704" />
        </branch>
        <branch name="Data_out(31:0)">
            <wire x2="1952" y1="1504" y2="1504" x1="1920" />
            <wire x2="2000" y1="1504" y2="1504" x1="1952" />
            <wire x2="2048" y1="1504" y2="1504" x1="2000" />
            <wire x2="2000" y1="1504" y2="1952" x1="2000" />
            <wire x2="2880" y1="1952" y2="1952" x1="2000" />
            <wire x2="1984" y1="1296" y2="1296" x1="1952" />
            <wire x2="1952" y1="1296" y2="1504" x1="1952" />
        </branch>
        <branch name="ALU_B(31:0)">
            <wire x2="2176" y1="1536" y2="1536" x1="2112" />
        </branch>
        <branch name="WriteDATA(31:0)">
            <wire x2="1440" y1="1568" y2="1568" x1="1248" />
        </branch>
        <branch name="inst_field(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="1952" type="branch" />
            <wire x2="1152" y1="1952" y2="1952" x1="1056" />
            <wire x2="1584" y1="1952" y2="1952" x1="1152" />
        </branch>
        <branch name="ALU_Control(2:0)">
            <wire x2="2416" y1="992" y2="992" x1="912" />
            <wire x2="2416" y1="992" y2="1136" x1="2416" />
        </branch>
        <branch name="ALUSrc_B">
            <wire x2="2080" y1="1040" y2="1040" x1="912" />
            <wire x2="2080" y1="1040" y2="1472" x1="2080" />
        </branch>
        <branch name="RegWrite">
            <wire x2="1680" y1="1088" y2="1088" x1="912" />
            <wire x2="1680" y1="1088" y2="1120" x1="1680" />
        </branch>
        <branch name="inst_field(25:21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="1296" type="branch" />
            <wire x2="1184" y1="1296" y2="1296" x1="1056" />
            <wire x2="1440" y1="1296" y2="1296" x1="1184" />
        </branch>
        <branch name="Jal">
            <wire x2="1232" y1="1232" y2="1232" x1="912" />
            <wire x2="1232" y1="1232" y2="1360" x1="1232" />
        </branch>
        <bustap x2="1056" y1="1296" y2="1296" x1="960" />
        <bustap x2="1056" y1="1344" y2="1344" x1="960" />
        <bustap x2="1056" y1="1952" y2="1952" x1="960" />
        <branch name="DatatoReg(1:0)">
            <wire x2="1216" y1="1504" y2="1504" x1="912" />
            <wire x2="1216" y1="1504" y2="1520" x1="1216" />
        </branch>
        <instance x="1488" y="1952" name="XLXI_19" orien="R0">
        </instance>
        <branch name="inst_field(20:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="1344" type="branch" />
            <wire x2="1120" y1="1344" y2="1344" x1="1056" />
            <wire x2="1184" y1="1344" y2="1344" x1="1120" />
            <wire x2="1440" y1="1344" y2="1344" x1="1184" />
            <wire x2="1120" y1="1344" y2="1392" x1="1120" />
            <wire x2="1216" y1="1392" y2="1392" x1="1120" />
        </branch>
        <instance x="1216" y="1440" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1328" y="1456" name="XLXI_32" orien="R0">
        </instance>
        <branch name="rt(4:0)">
            <wire x2="1328" y1="1408" y2="1408" x1="1248" />
        </branch>
        <branch name="Wt_addr(4:0)">
            <wire x2="1440" y1="1424" y2="1424" x1="1360" />
        </branch>
        <bustap x2="1056" y1="1472" y2="1472" x1="960" />
        <branch name="inst_field(15:11)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1160" y="1472" type="branch" />
            <wire x2="1264" y1="1472" y2="1472" x1="1056" />
            <wire x2="1328" y1="1440" y2="1440" x1="1264" />
            <wire x2="1264" y1="1440" y2="1472" x1="1264" />
        </branch>
        <branch name="inst_field(25:0)">
            <wire x2="960" y1="1296" y2="1296" x1="912" />
            <wire x2="960" y1="1296" y2="1344" x1="960" />
            <wire x2="960" y1="1344" y2="1472" x1="960" />
            <wire x2="960" y1="1472" y2="1952" x1="960" />
        </branch>
        <branch name="Data_in(31:0)">
            <wire x2="1184" y1="1584" y2="1584" x1="912" />
        </branch>
        <instance x="1184" y="1664" name="XLXI_33" orien="R0">
        </instance>
        <branch name="zero">
            <wire x2="2880" y1="1312" y2="1312" x1="2624" />
        </branch>
        <branch name="overflow">
            <wire x2="2880" y1="1440" y2="1440" x1="2624" />
        </branch>
        <branch name="RegDst">
            <wire x2="1344" y1="1168" y2="1168" x1="912" />
            <wire x2="1344" y1="1168" y2="1376" x1="1344" />
        </branch>
        <branch name="V5,V5,V5,V5,V5">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="1424" type="branch" />
            <wire x2="1216" y1="1424" y2="1424" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="2880" y="1312" name="zero" orien="R0" />
        <iomarker fontsize="28" x="2880" y="1440" name="overflow" orien="R0" />
        <iomarker fontsize="28" x="2880" y="1376" name="ALU_out(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2880" y="1952" name="Data_out(31:0)" orien="R0" />
        <iomarker fontsize="28" x="912" y="992" name="ALU_Control(2:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="1088" name="RegWrite" orien="R180" />
        <iomarker fontsize="28" x="912" y="1296" name="inst_field(25:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="1040" name="ALUSrc_B" orien="R180" />
        <iomarker fontsize="28" x="912" y="1232" name="Jal" orien="R180" />
        <iomarker fontsize="28" x="912" y="1584" name="Data_in(31:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="1504" name="DatatoReg(1:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="1168" name="RegDst" orien="R180" />
        <iomarker fontsize="28" x="2880" y="496" name="PC_out(31:0)" orien="R0" />
        <iomarker fontsize="28" x="912" y="368" name="Branch(1:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="496" name="clk" orien="R180" />
        <iomarker fontsize="28" x="912" y="560" name="rst" orien="R180" />
        <branch name="PC_4(31:0)">
            <wire x2="1056" y1="944" y2="1648" x1="1056" />
            <wire x2="1184" y1="1648" y2="1648" x1="1056" />
            <wire x2="1808" y1="944" y2="944" x1="1056" />
            <wire x2="1808" y1="608" y2="608" x1="1728" />
            <wire x2="2096" y1="608" y2="608" x1="1808" />
            <wire x2="1808" y1="608" y2="640" x1="1808" />
            <wire x2="1904" y1="640" y2="640" x1="1808" />
            <wire x2="1808" y1="640" y2="944" x1="1808" />
        </branch>
        <branch name="inst_field(15:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="928" y="1616" type="branch" />
            <wire x2="1184" y1="1616" y2="1616" x1="928" />
        </branch>
        <instance x="1984" y="1312" name="XLXI_34" orien="R0">
        </instance>
        <branch name="rdata_A(31:0)">
            <wire x2="1968" y1="1232" y2="1232" x1="1920" />
            <wire x2="1984" y1="1232" y2="1232" x1="1968" />
            <wire x2="2096" y1="704" y2="704" x1="1968" />
            <wire x2="1968" y1="704" y2="1232" x1="1968" />
        </branch>
        <branch name="ALU_A(31:0)">
            <wire x2="2112" y1="1264" y2="1264" x1="2048" />
            <wire x2="2112" y1="1232" y2="1264" x1="2112" />
            <wire x2="2176" y1="1232" y2="1232" x1="2112" />
        </branch>
        <branch name="ALUSrc_A">
            <wire x2="2016" y1="912" y2="912" x1="912" />
            <wire x2="2016" y1="912" y2="1200" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="912" y="912" name="ALUSrc_A" orien="R180" />
        <branch name="clk">
            <wire x2="1152" y1="496" y2="496" x1="912" />
            <wire x2="1248" y1="496" y2="496" x1="1152" />
        </branch>
        <branch name="clk">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="1200" type="branch" />
            <wire x2="1440" y1="1200" y2="1200" x1="1408" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="1248" type="branch" />
            <wire x2="1440" y1="1248" y2="1248" x1="1408" />
        </branch>
    </sheet>
</drawing>