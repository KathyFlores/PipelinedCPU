<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ALU_Control(2:0)" />
        <signal name="RegWrite" />
        <signal name="Branch(1:0)" />
        <signal name="Jal" />
        <signal name="RegDst" />
        <signal name="ALUSrc_B" />
        <signal name="DatatoReg(1:0)" />
        <signal name="zero" />
        <signal name="Data_out(31:0)" />
        <signal name="Addr_out(31:0)" />
        <signal name="PC_out(31:0)" />
        <signal name="MIO_ready" />
        <signal name="INT" />
        <signal name="clk" />
        <signal name="reset" />
        <signal name="Data_in(31:0)" />
        <signal name="inst_in(31:0)" />
        <signal name="inst_in(25:0)" />
        <signal name="inst_in(31:26)" />
        <signal name="inst_in(5:0)" />
        <signal name="ALUSrc_A" />
        <signal name="CPU_MIO" />
        <signal name="mem_w" />
        <port polarity="Output" name="Data_out(31:0)" />
        <port polarity="Output" name="Addr_out(31:0)" />
        <port polarity="Output" name="PC_out(31:0)" />
        <port polarity="Input" name="MIO_ready" />
        <port polarity="Input" name="INT" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="Data_in(31:0)" />
        <port polarity="Input" name="inst_in(31:0)" />
        <port polarity="Output" name="CPU_MIO" />
        <port polarity="Output" name="mem_w" />
        <blockdef name="Data_path_more">
            <timestamp>2017-4-26T1:23:38</timestamp>
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <line x2="0" y1="-432" y2="-432" x1="64" />
            <line x2="0" y1="-368" y2="-368" style="linewidth:W" x1="64" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-240" y2="-240" style="linewidth:W" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="0" y1="-112" y2="-112" style="linewidth:W" x1="64" />
            <rect width="64" x="0" y="-652" height="24" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-576" y2="-576" style="linewidth:W" x1="64" />
            <line x2="0" y1="-752" y2="-752" x1="64" />
            <line x2="0" y1="-688" y2="-688" x1="64" />
            <rect width="64" x="416" y="-652" height="24" />
            <line x2="480" y1="-640" y2="-640" x1="416" />
            <rect width="64" x="416" y="-492" height="24" />
            <line x2="480" y1="-480" y2="-480" x1="416" />
            <rect width="64" x="416" y="-364" height="24" />
            <line x2="480" y1="-352" y2="-352" x1="416" />
            <line x2="416" y1="-240" y2="-240" x1="480" />
            <line x2="416" y1="-176" y2="-176" x1="480" />
            <rect style="linewidth:W;linecolor:rgb(0,0,255);fillcolor:rgb(0,255,255)" width="352" x="64" y="-808" height="804" />
        </blockdef>
        <blockdef name="SCPU_ctrl_more">
            <timestamp>2017-4-26T1:32:58</timestamp>
            <rect style="linewidth:W;linecolor:rgb(255,0,0);fillcolor:rgb(255,170,255)" width="336" x="64" y="-576" height="640" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" style="linewidth:W" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-160" y2="-160" style="linewidth:W" x1="400" />
            <line x2="0" y1="-352" y2="-352" style="linewidth:W" x1="64" />
            <line x2="0" y1="-432" y2="-432" style="linewidth:W" x1="64" />
            <line x2="464" y1="-288" y2="-288" style="linewidth:W" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="464" y1="32" y2="32" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <block symbolname="Data_path_more" name="path">
            <blockpin signalname="Branch(1:0)" name="Branch(1:0)" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="reset" name="rst" />
            <blockpin signalname="ALU_Control(2:0)" name="ALU_Control(2:0)" />
            <blockpin signalname="ALUSrc_B" name="ALUSrc_B" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="RegDst" name="RegDst" />
            <blockpin signalname="Jal" name="Jal" />
            <blockpin signalname="inst_in(25:0)" name="inst_field(25:0)" />
            <blockpin signalname="DatatoReg(1:0)" name="DatatoReg(1:0)" />
            <blockpin signalname="Data_in(31:0)" name="Data_in(31:0)" />
            <blockpin signalname="PC_out(31:0)" name="PC_out(31:0)" />
            <blockpin signalname="zero" name="zero" />
            <blockpin signalname="Addr_out(31:0)" name="ALU_out(31:0)" />
            <blockpin name="overflow" />
            <blockpin signalname="Data_out(31:0)" name="Data_out(31:0)" />
            <blockpin signalname="ALUSrc_A" name="ALUSrc_A" />
        </block>
        <block symbolname="SCPU_ctrl_more" name="ctrl">
            <blockpin signalname="RegDst" name="RegDst" />
            <blockpin signalname="ALUSrc_B" name="ALUSrc_B" />
            <blockpin signalname="DatatoReg(1:0)" name="DatatoReg(1:0)" />
            <blockpin signalname="Jal" name="Jal" />
            <blockpin signalname="ALU_Control(2:0)" name="ALU_Control(2:0)" />
            <blockpin signalname="inst_in(5:0)" name="Fun(5:0)" />
            <blockpin signalname="inst_in(31:26)" name="OPcode(5:0)" />
            <blockpin signalname="Branch(1:0)" name="Branch(1:0)" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="MIO_ready" name="MIO_ready" />
            <blockpin signalname="zero" name="zero" />
            <blockpin signalname="CPU_MIO" name="CPU_MIO" />
            <blockpin signalname="ALUSrc_A" name="ALUSrc_A" />
            <blockpin signalname="mem_w" name="mem_w" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="PC_out(31:0)">
            <wire x2="2320" y1="1104" y2="1104" x1="2176" />
        </branch>
        <branch name="MIO_ready">
            <wire x2="848" y1="1696" y2="1696" x1="640" />
        </branch>
        <branch name="INT">
            <wire x2="800" y1="1920" y2="1920" x1="640" />
        </branch>
        <branch name="reset">
            <wire x2="1696" y1="1056" y2="1056" x1="640" />
        </branch>
        <branch name="Data_in(31:0)">
            <wire x2="1696" y1="1104" y2="1104" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="992" name="clk" orien="R180" />
        <iomarker fontsize="28" x="640" y="1056" name="reset" orien="R180" />
        <iomarker fontsize="28" x="640" y="1104" name="Data_in(31:0)" orien="R180" />
        <branch name="inst_in(31:0)">
            <wire x2="656" y1="1168" y2="1168" x1="640" />
            <wire x2="656" y1="1168" y2="1200" x1="656" />
            <wire x2="656" y1="1200" y2="1360" x1="656" />
            <wire x2="656" y1="1360" y2="1440" x1="656" />
        </branch>
        <iomarker fontsize="28" x="640" y="1168" name="inst_in(31:0)" orien="R180" />
        <bustap x2="752" y1="1168" y2="1168" x1="656" />
        <bustap x2="752" y1="1360" y2="1360" x1="656" />
        <branch name="inst_in(31:26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1360" type="branch" />
            <wire x2="800" y1="1360" y2="1360" x1="752" />
            <wire x2="848" y1="1360" y2="1360" x1="800" />
        </branch>
        <bustap x2="752" y1="1440" y2="1440" x1="656" />
        <branch name="inst_in(5:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1440" type="branch" />
            <wire x2="800" y1="1440" y2="1440" x1="752" />
            <wire x2="848" y1="1440" y2="1440" x1="800" />
        </branch>
        <iomarker fontsize="28" x="640" y="1696" name="MIO_ready" orien="R180" />
        <iomarker fontsize="28" x="640" y="1920" name="INT" orien="R180" />
        <iomarker fontsize="28" x="2320" y="1392" name="Data_out(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1264" name="Addr_out(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1104" name="PC_out(31:0)" orien="R0" />
        <branch name="Data_out(31:0)">
            <wire x2="2320" y1="1392" y2="1392" x1="2176" />
        </branch>
        <branch name="Addr_out(31:0)">
            <wire x2="2320" y1="1264" y2="1264" x1="2176" />
        </branch>
        <branch name="inst_in(25:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1224" y="1168" type="branch" />
            <wire x2="1696" y1="1168" y2="1168" x1="752" />
        </branch>
        <branch name="clk">
            <wire x2="1696" y1="992" y2="992" x1="640" />
        </branch>
        <branch name="zero">
            <wire x2="768" y1="1744" y2="1872" x1="768" />
            <wire x2="2256" y1="1872" y2="1872" x1="768" />
            <wire x2="848" y1="1744" y2="1744" x1="768" />
            <wire x2="2256" y1="1504" y2="1504" x1="2176" />
            <wire x2="2256" y1="1504" y2="1872" x1="2256" />
        </branch>
        <branch name="DatatoReg(1:0)">
            <wire x2="1696" y1="1376" y2="1376" x1="1312" />
        </branch>
        <branch name="Jal">
            <wire x2="1696" y1="1440" y2="1440" x1="1312" />
        </branch>
        <branch name="RegDst">
            <wire x2="1696" y1="1248" y2="1248" x1="1312" />
        </branch>
        <branch name="RegWrite">
            <wire x2="1696" y1="1568" y2="1568" x1="1312" />
        </branch>
        <branch name="ALUSrc_B">
            <wire x2="1696" y1="1312" y2="1312" x1="1312" />
        </branch>
        <branch name="ALU_Control(2:0)">
            <wire x2="1696" y1="1632" y2="1632" x1="1312" />
        </branch>
        <branch name="Branch(1:0)">
            <wire x2="1696" y1="1504" y2="1504" x1="1312" />
        </branch>
        <instance x="1696" y="1744" name="path" orien="R0">
        </instance>
        <instance x="848" y="1792" name="ctrl" orien="R0">
        </instance>
        <branch name="ALUSrc_A">
            <wire x2="1696" y1="1696" y2="1696" x1="1312" />
        </branch>
        <branch name="CPU_MIO">
            <wire x2="1328" y1="1824" y2="1824" x1="1312" />
            <wire x2="2320" y1="1824" y2="1824" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1824" name="CPU_MIO" orien="R0" />
        <branch name="mem_w">
            <wire x2="2320" y1="1760" y2="1760" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1760" name="mem_w" orien="R0" />
    </sheet>
</drawing>