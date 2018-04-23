/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003249260000_1871713313_init();
    work_m_00000000000407460910_2522600198_init();
    work_m_00000000003077032594_3476153904_init();
    work_m_00000000004291469506_2955713906_init();
    work_m_00000000003226847769_1137345619_init();
    work_m_00000000000470828233_4285511994_init();
    work_m_00000000003650902644_1938225339_init();
    work_m_00000000002617849904_3095950680_init();
    work_m_00000000001981608515_0426247469_init();
    work_m_00000000003077032594_2931428527_init();
    work_m_00000000002059783859_2725559894_init();
    work_m_00000000003548625683_2170271176_init();
    work_m_00000000003281025883_2093783220_init();
    work_m_00000000000165975401_1865514868_init();
    work_m_00000000003987807305_3590671072_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003987807305_3590671072");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
