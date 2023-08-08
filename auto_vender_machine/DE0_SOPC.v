//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2012 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_0_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_0_in_endofpacket,
                                         DE0_SOPC_clock_0_in_readdata,
                                         DE0_SOPC_clock_0_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_0_in_address,
                                         DE0_SOPC_clock_0_in_byteenable,
                                         DE0_SOPC_clock_0_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_0_in_nativeaddress,
                                         DE0_SOPC_clock_0_in_read,
                                         DE0_SOPC_clock_0_in_readdata_from_sa,
                                         DE0_SOPC_clock_0_in_reset_n,
                                         DE0_SOPC_clock_0_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_0_in_write,
                                         DE0_SOPC_clock_0_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_0_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_0_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_0_in,
                                         d1_DE0_SOPC_clock_0_in_end_xfer
                                      )
;

  output  [  3: 0] DE0_SOPC_clock_0_in_address;
  output  [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  output           DE0_SOPC_clock_0_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  output           DE0_SOPC_clock_0_in_read;
  output  [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  output           DE0_SOPC_clock_0_in_reset_n;
  output           DE0_SOPC_clock_0_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_0_in_write;
  output  [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_0_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_0_in;
  output           d1_DE0_SOPC_clock_0_in_end_xfer;
  input            DE0_SOPC_clock_0_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_0_in_readdata;
  input            DE0_SOPC_clock_0_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] DE0_SOPC_clock_0_in_address;
  wire             DE0_SOPC_clock_0_in_allgrants;
  wire             DE0_SOPC_clock_0_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_0_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_0_in_any_continuerequest;
  wire             DE0_SOPC_clock_0_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_0_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_0_in_arb_share_set_values;
  wire             DE0_SOPC_clock_0_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_0_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  wire             DE0_SOPC_clock_0_in_end_xfer;
  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_0_in_firsttransfer;
  wire             DE0_SOPC_clock_0_in_grant_vector;
  wire             DE0_SOPC_clock_0_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_0_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_0_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  wire             DE0_SOPC_clock_0_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_0_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  reg              DE0_SOPC_clock_0_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_0_in_reset_n;
  reg              DE0_SOPC_clock_0_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_0_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_0_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_0_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_0_in_waits_for_read;
  wire             DE0_SOPC_clock_0_in_waits_for_write;
  wire             DE0_SOPC_clock_0_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_0_in;
  reg              d1_DE0_SOPC_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_0_in_end_xfer;
    end


  assign DE0_SOPC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_0_in));
  //assign DE0_SOPC_clock_0_in_readdata_from_sa = DE0_SOPC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_readdata_from_sa = DE0_SOPC_clock_0_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_0_in = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1801040) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_0_in_waitrequest_from_sa = DE0_SOPC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_waitrequest_from_sa = DE0_SOPC_clock_0_in_waitrequest;

  //DE0_SOPC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_0_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_0_in;

  //DE0_SOPC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_arb_share_counter_next_value = DE0_SOPC_clock_0_in_firsttransfer ? (DE0_SOPC_clock_0_in_arb_share_set_values - 1) : |DE0_SOPC_clock_0_in_arb_share_counter ? (DE0_SOPC_clock_0_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_0_in_allgrants = |DE0_SOPC_clock_0_in_grant_vector;

  //DE0_SOPC_clock_0_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_end_xfer = ~(DE0_SOPC_clock_0_in_waits_for_read | DE0_SOPC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in = DE0_SOPC_clock_0_in_end_xfer & (~DE0_SOPC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & DE0_SOPC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & ~DE0_SOPC_clock_0_in_non_bursting_master_requests);

  //DE0_SOPC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_0_in_arb_counter_enable)
          DE0_SOPC_clock_0_in_arb_share_counter <= DE0_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & ~DE0_SOPC_clock_0_in_non_bursting_master_requests))
          DE0_SOPC_clock_0_in_slavearbiterlockenable <= |DE0_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_0_in_slavearbiterlockenable2 = |DE0_SOPC_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_0_in = cpu_data_master_requests_DE0_SOPC_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_0_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_0_in_endofpacket_from_sa = DE0_SOPC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_endofpacket_from_sa = DE0_SOPC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_0_in = cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_0_in = cpu_data_master_requests_DE0_SOPC_clock_0_in;

  //allow new arb cycle for DE0_SOPC_clock_0/in, which is an e_assign
  assign DE0_SOPC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_0_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_0_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_reset_n = reset_n;

  //DE0_SOPC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_0_in_firsttransfer = DE0_SOPC_clock_0_in_begins_xfer ? DE0_SOPC_clock_0_in_unreg_firsttransfer : DE0_SOPC_clock_0_in_reg_firsttransfer;

  //DE0_SOPC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_0_in_unreg_firsttransfer = ~(DE0_SOPC_clock_0_in_slavearbiterlockenable & DE0_SOPC_clock_0_in_any_continuerequest);

  //DE0_SOPC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_0_in_begins_xfer)
          DE0_SOPC_clock_0_in_reg_firsttransfer <= DE0_SOPC_clock_0_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_0_in_beginbursttransfer_internal = DE0_SOPC_clock_0_in_begins_xfer;

  //DE0_SOPC_clock_0_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_0_in_read = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_read;

  //DE0_SOPC_clock_0_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_0_in_write = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_write;

  assign shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_0_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_address = shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_0_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_0_in_end_xfer <= DE0_SOPC_clock_0_in_end_xfer;
    end


  //DE0_SOPC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_0_in_waits_for_read = DE0_SOPC_clock_0_in_in_a_read_cycle & DE0_SOPC_clock_0_in_waitrequest_from_sa;

  //DE0_SOPC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_0_in_in_a_read_cycle;

  //DE0_SOPC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_0_in_waits_for_write = DE0_SOPC_clock_0_in_in_a_write_cycle & DE0_SOPC_clock_0_in_waitrequest_from_sa;

  //DE0_SOPC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_0_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_0_in_counter = 0;
  //DE0_SOPC_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_byteenable = (cpu_data_master_granted_DE0_SOPC_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_0_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_0_out_address,
                                          DE0_SOPC_clock_0_out_byteenable,
                                          DE0_SOPC_clock_0_out_granted_pll_s1,
                                          DE0_SOPC_clock_0_out_qualified_request_pll_s1,
                                          DE0_SOPC_clock_0_out_read,
                                          DE0_SOPC_clock_0_out_read_data_valid_pll_s1,
                                          DE0_SOPC_clock_0_out_requests_pll_s1,
                                          DE0_SOPC_clock_0_out_write,
                                          DE0_SOPC_clock_0_out_writedata,
                                          clk,
                                          d1_pll_s1_end_xfer,
                                          pll_s1_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_0_out_address_to_slave,
                                          DE0_SOPC_clock_0_out_readdata,
                                          DE0_SOPC_clock_0_out_reset_n,
                                          DE0_SOPC_clock_0_out_waitrequest
                                       )
;

  output  [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  output           DE0_SOPC_clock_0_out_reset_n;
  output           DE0_SOPC_clock_0_out_waitrequest;
  input   [  3: 0] DE0_SOPC_clock_0_out_address;
  input   [  1: 0] DE0_SOPC_clock_0_out_byteenable;
  input            DE0_SOPC_clock_0_out_granted_pll_s1;
  input            DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  input            DE0_SOPC_clock_0_out_read;
  input            DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  input            DE0_SOPC_clock_0_out_requests_pll_s1;
  input            DE0_SOPC_clock_0_out_write;
  input   [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  input            clk;
  input            d1_pll_s1_end_xfer;
  input   [ 15: 0] pll_s1_readdata_from_sa;
  input            reset_n;

  reg     [  3: 0] DE0_SOPC_clock_0_out_address_last_time;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_0_out_byteenable_last_time;
  reg              DE0_SOPC_clock_0_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  wire             DE0_SOPC_clock_0_out_reset_n;
  wire             DE0_SOPC_clock_0_out_run;
  wire             DE0_SOPC_clock_0_out_waitrequest;
  reg              DE0_SOPC_clock_0_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((~DE0_SOPC_clock_0_out_qualified_request_pll_s1 | ~DE0_SOPC_clock_0_out_read | (1 & ~d1_pll_s1_end_xfer & DE0_SOPC_clock_0_out_read))) & ((~DE0_SOPC_clock_0_out_qualified_request_pll_s1 | ~DE0_SOPC_clock_0_out_write | (1 & DE0_SOPC_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_0_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_0_out_address_to_slave = DE0_SOPC_clock_0_out_address;

  //DE0_SOPC_clock_0/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_0_out_readdata = pll_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_0_out_waitrequest = ~DE0_SOPC_clock_0_out_run;

  //DE0_SOPC_clock_0_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_address_last_time <= DE0_SOPC_clock_0_out_address;
    end


  //DE0_SOPC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_0_out_waitrequest & (DE0_SOPC_clock_0_out_read | DE0_SOPC_clock_0_out_write);
    end


  //DE0_SOPC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_address != DE0_SOPC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_byteenable_last_time <= DE0_SOPC_clock_0_out_byteenable;
    end


  //DE0_SOPC_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_byteenable != DE0_SOPC_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_read_last_time <= DE0_SOPC_clock_0_out_read;
    end


  //DE0_SOPC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_read != DE0_SOPC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_write_last_time <= DE0_SOPC_clock_0_out_write;
    end


  //DE0_SOPC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_write != DE0_SOPC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_writedata_last_time <= DE0_SOPC_clock_0_out_writedata;
    end


  //DE0_SOPC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_writedata != DE0_SOPC_clock_0_out_writedata_last_time) & DE0_SOPC_clock_0_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_1_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_1_in_endofpacket,
                                         DE0_SOPC_clock_1_in_readdata,
                                         DE0_SOPC_clock_1_in_waitrequest,
                                         clk,
                                         dma_read_master_address_to_slave,
                                         dma_read_master_chipselect,
                                         dma_read_master_latency_counter,
                                         dma_read_master_read_n,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_1_in_address,
                                         DE0_SOPC_clock_1_in_byteenable,
                                         DE0_SOPC_clock_1_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_1_in_nativeaddress,
                                         DE0_SOPC_clock_1_in_read,
                                         DE0_SOPC_clock_1_in_readdata_from_sa,
                                         DE0_SOPC_clock_1_in_reset_n,
                                         DE0_SOPC_clock_1_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_1_in_write,
                                         d1_DE0_SOPC_clock_1_in_end_xfer,
                                         dma_read_master_granted_DE0_SOPC_clock_1_in,
                                         dma_read_master_qualified_request_DE0_SOPC_clock_1_in,
                                         dma_read_master_read_data_valid_DE0_SOPC_clock_1_in,
                                         dma_read_master_requests_DE0_SOPC_clock_1_in
                                      )
;

  output  [ 22: 0] DE0_SOPC_clock_1_in_address;
  output  [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  output           DE0_SOPC_clock_1_in_endofpacket_from_sa;
  output  [ 21: 0] DE0_SOPC_clock_1_in_nativeaddress;
  output           DE0_SOPC_clock_1_in_read;
  output  [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  output           DE0_SOPC_clock_1_in_reset_n;
  output           DE0_SOPC_clock_1_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_1_in_write;
  output           d1_DE0_SOPC_clock_1_in_end_xfer;
  output           dma_read_master_granted_DE0_SOPC_clock_1_in;
  output           dma_read_master_qualified_request_DE0_SOPC_clock_1_in;
  output           dma_read_master_read_data_valid_DE0_SOPC_clock_1_in;
  output           dma_read_master_requests_DE0_SOPC_clock_1_in;
  input            DE0_SOPC_clock_1_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_1_in_readdata;
  input            DE0_SOPC_clock_1_in_waitrequest;
  input            clk;
  input   [ 23: 0] dma_read_master_address_to_slave;
  input            dma_read_master_chipselect;
  input            dma_read_master_latency_counter;
  input            dma_read_master_read_n;
  input            reset_n;

  wire    [ 22: 0] DE0_SOPC_clock_1_in_address;
  wire             DE0_SOPC_clock_1_in_allgrants;
  wire             DE0_SOPC_clock_1_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_1_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_1_in_any_continuerequest;
  wire             DE0_SOPC_clock_1_in_arb_counter_enable;
  reg              DE0_SOPC_clock_1_in_arb_share_counter;
  wire             DE0_SOPC_clock_1_in_arb_share_counter_next_value;
  wire             DE0_SOPC_clock_1_in_arb_share_set_values;
  wire             DE0_SOPC_clock_1_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_1_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  wire             DE0_SOPC_clock_1_in_end_xfer;
  wire             DE0_SOPC_clock_1_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_1_in_firsttransfer;
  wire             DE0_SOPC_clock_1_in_grant_vector;
  wire             DE0_SOPC_clock_1_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_1_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_1_in_master_qreq_vector;
  wire    [ 21: 0] DE0_SOPC_clock_1_in_nativeaddress;
  wire             DE0_SOPC_clock_1_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_1_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  reg              DE0_SOPC_clock_1_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_1_in_reset_n;
  reg              DE0_SOPC_clock_1_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_1_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_1_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_1_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_1_in_waits_for_read;
  wire             DE0_SOPC_clock_1_in_waits_for_write;
  wire             DE0_SOPC_clock_1_in_write;
  reg              d1_DE0_SOPC_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  wire             dma_read_master_arbiterlock;
  wire             dma_read_master_arbiterlock2;
  wire             dma_read_master_continuerequest;
  wire             dma_read_master_granted_DE0_SOPC_clock_1_in;
  wire             dma_read_master_qualified_request_DE0_SOPC_clock_1_in;
  wire             dma_read_master_read_data_valid_DE0_SOPC_clock_1_in;
  wire             dma_read_master_requests_DE0_SOPC_clock_1_in;
  wire             dma_read_master_saved_grant_DE0_SOPC_clock_1_in;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_SOPC_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_1_in_end_xfer;
    end


  assign DE0_SOPC_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((dma_read_master_qualified_request_DE0_SOPC_clock_1_in));
  //assign DE0_SOPC_clock_1_in_readdata_from_sa = DE0_SOPC_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_readdata_from_sa = DE0_SOPC_clock_1_in_readdata;

  assign dma_read_master_requests_DE0_SOPC_clock_1_in = (({dma_read_master_address_to_slave[23] , 23'b0} == 24'h800000) & dma_read_master_chipselect) & (~dma_read_master_read_n & dma_read_master_chipselect);
  //assign DE0_SOPC_clock_1_in_waitrequest_from_sa = DE0_SOPC_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_waitrequest_from_sa = DE0_SOPC_clock_1_in_waitrequest;

  //DE0_SOPC_clock_1_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_1_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_non_bursting_master_requests = dma_read_master_requests_DE0_SOPC_clock_1_in;

  //DE0_SOPC_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_arb_share_counter_next_value = DE0_SOPC_clock_1_in_firsttransfer ? (DE0_SOPC_clock_1_in_arb_share_set_values - 1) : |DE0_SOPC_clock_1_in_arb_share_counter ? (DE0_SOPC_clock_1_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_1_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_1_in_allgrants = |DE0_SOPC_clock_1_in_grant_vector;

  //DE0_SOPC_clock_1_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_end_xfer = ~(DE0_SOPC_clock_1_in_waits_for_read | DE0_SOPC_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in = DE0_SOPC_clock_1_in_end_xfer & (~DE0_SOPC_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & DE0_SOPC_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & ~DE0_SOPC_clock_1_in_non_bursting_master_requests);

  //DE0_SOPC_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_1_in_arb_counter_enable)
          DE0_SOPC_clock_1_in_arb_share_counter <= DE0_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & ~DE0_SOPC_clock_1_in_non_bursting_master_requests))
          DE0_SOPC_clock_1_in_slavearbiterlockenable <= |DE0_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //dma/read_master DE0_SOPC_clock_1/in arbiterlock, which is an e_assign
  assign dma_read_master_arbiterlock = DE0_SOPC_clock_1_in_slavearbiterlockenable & dma_read_master_continuerequest;

  //DE0_SOPC_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_1_in_slavearbiterlockenable2 = |DE0_SOPC_clock_1_in_arb_share_counter_next_value;

  //dma/read_master DE0_SOPC_clock_1/in arbiterlock2, which is an e_assign
  assign dma_read_master_arbiterlock2 = DE0_SOPC_clock_1_in_slavearbiterlockenable2 & dma_read_master_continuerequest;

  //DE0_SOPC_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_1_in_any_continuerequest = 1;

  //dma_read_master_continuerequest continued request, which is an e_assign
  assign dma_read_master_continuerequest = 1;

  assign dma_read_master_qualified_request_DE0_SOPC_clock_1_in = dma_read_master_requests_DE0_SOPC_clock_1_in & ~(((~dma_read_master_read_n & dma_read_master_chipselect) & ((dma_read_master_latency_counter != 0))));
  //local readdatavalid dma_read_master_read_data_valid_DE0_SOPC_clock_1_in, which is an e_mux
  assign dma_read_master_read_data_valid_DE0_SOPC_clock_1_in = dma_read_master_granted_DE0_SOPC_clock_1_in & (~dma_read_master_read_n & dma_read_master_chipselect) & ~DE0_SOPC_clock_1_in_waits_for_read;

  //assign DE0_SOPC_clock_1_in_endofpacket_from_sa = DE0_SOPC_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_endofpacket_from_sa = DE0_SOPC_clock_1_in_endofpacket;

  //master is always granted when requested
  assign dma_read_master_granted_DE0_SOPC_clock_1_in = dma_read_master_qualified_request_DE0_SOPC_clock_1_in;

  //dma/read_master saved-grant DE0_SOPC_clock_1/in, which is an e_assign
  assign dma_read_master_saved_grant_DE0_SOPC_clock_1_in = dma_read_master_requests_DE0_SOPC_clock_1_in;

  //allow new arb cycle for DE0_SOPC_clock_1/in, which is an e_assign
  assign DE0_SOPC_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_1_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_1_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_reset_n = reset_n;

  //DE0_SOPC_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_1_in_firsttransfer = DE0_SOPC_clock_1_in_begins_xfer ? DE0_SOPC_clock_1_in_unreg_firsttransfer : DE0_SOPC_clock_1_in_reg_firsttransfer;

  //DE0_SOPC_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_1_in_unreg_firsttransfer = ~(DE0_SOPC_clock_1_in_slavearbiterlockenable & DE0_SOPC_clock_1_in_any_continuerequest);

  //DE0_SOPC_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_1_in_begins_xfer)
          DE0_SOPC_clock_1_in_reg_firsttransfer <= DE0_SOPC_clock_1_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_1_in_beginbursttransfer_internal = DE0_SOPC_clock_1_in_begins_xfer;

  //DE0_SOPC_clock_1_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_1_in_read = dma_read_master_granted_DE0_SOPC_clock_1_in & (~dma_read_master_read_n & dma_read_master_chipselect);

  //DE0_SOPC_clock_1_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_1_in_write = 0;

  //DE0_SOPC_clock_1_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_address = dma_read_master_address_to_slave;

  //slaveid DE0_SOPC_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_nativeaddress = dma_read_master_address_to_slave >> 1;

  //d1_DE0_SOPC_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_1_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_1_in_end_xfer <= DE0_SOPC_clock_1_in_end_xfer;
    end


  //DE0_SOPC_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_1_in_waits_for_read = DE0_SOPC_clock_1_in_in_a_read_cycle & DE0_SOPC_clock_1_in_waitrequest_from_sa;

  //DE0_SOPC_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_in_a_read_cycle = dma_read_master_granted_DE0_SOPC_clock_1_in & (~dma_read_master_read_n & dma_read_master_chipselect);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_1_in_in_a_read_cycle;

  //DE0_SOPC_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_1_in_waits_for_write = DE0_SOPC_clock_1_in_in_a_write_cycle & DE0_SOPC_clock_1_in_waitrequest_from_sa;

  //DE0_SOPC_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_1_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_1_in_counter = 0;
  //DE0_SOPC_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_1_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_1_out_address,
                                          DE0_SOPC_clock_1_out_byteenable,
                                          DE0_SOPC_clock_1_out_granted_sdram_s1,
                                          DE0_SOPC_clock_1_out_qualified_request_sdram_s1,
                                          DE0_SOPC_clock_1_out_read,
                                          DE0_SOPC_clock_1_out_read_data_valid_sdram_s1,
                                          DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register,
                                          DE0_SOPC_clock_1_out_requests_sdram_s1,
                                          DE0_SOPC_clock_1_out_write,
                                          DE0_SOPC_clock_1_out_writedata,
                                          clk,
                                          d1_sdram_s1_end_xfer,
                                          reset_n,
                                          sdram_s1_readdata_from_sa,
                                          sdram_s1_waitrequest_from_sa,

                                         // outputs:
                                          DE0_SOPC_clock_1_out_address_to_slave,
                                          DE0_SOPC_clock_1_out_readdata,
                                          DE0_SOPC_clock_1_out_reset_n,
                                          DE0_SOPC_clock_1_out_waitrequest
                                       )
;

  output  [ 22: 0] DE0_SOPC_clock_1_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  output           DE0_SOPC_clock_1_out_reset_n;
  output           DE0_SOPC_clock_1_out_waitrequest;
  input   [ 22: 0] DE0_SOPC_clock_1_out_address;
  input   [  1: 0] DE0_SOPC_clock_1_out_byteenable;
  input            DE0_SOPC_clock_1_out_granted_sdram_s1;
  input            DE0_SOPC_clock_1_out_qualified_request_sdram_s1;
  input            DE0_SOPC_clock_1_out_read;
  input            DE0_SOPC_clock_1_out_read_data_valid_sdram_s1;
  input            DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register;
  input            DE0_SOPC_clock_1_out_requests_sdram_s1;
  input            DE0_SOPC_clock_1_out_write;
  input   [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 22: 0] DE0_SOPC_clock_1_out_address_last_time;
  wire    [ 22: 0] DE0_SOPC_clock_1_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_1_out_byteenable_last_time;
  reg              DE0_SOPC_clock_1_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  wire             DE0_SOPC_clock_1_out_reset_n;
  wire             DE0_SOPC_clock_1_out_run;
  wire             DE0_SOPC_clock_1_out_waitrequest;
  reg              DE0_SOPC_clock_1_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (DE0_SOPC_clock_1_out_qualified_request_sdram_s1 | DE0_SOPC_clock_1_out_read_data_valid_sdram_s1 | ~DE0_SOPC_clock_1_out_requests_sdram_s1) & (DE0_SOPC_clock_1_out_granted_sdram_s1 | ~DE0_SOPC_clock_1_out_qualified_request_sdram_s1) & ((~DE0_SOPC_clock_1_out_qualified_request_sdram_s1 | ~DE0_SOPC_clock_1_out_read | (DE0_SOPC_clock_1_out_read_data_valid_sdram_s1 & DE0_SOPC_clock_1_out_read))) & ((~DE0_SOPC_clock_1_out_qualified_request_sdram_s1 | ~(DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_1_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_1_out_address_to_slave = DE0_SOPC_clock_1_out_address;

  //DE0_SOPC_clock_1/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_1_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_1_out_waitrequest = ~DE0_SOPC_clock_1_out_run;

  //DE0_SOPC_clock_1_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_address_last_time <= DE0_SOPC_clock_1_out_address;
    end


  //DE0_SOPC_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_1_out_waitrequest & (DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write);
    end


  //DE0_SOPC_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_address != DE0_SOPC_clock_1_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_byteenable_last_time <= DE0_SOPC_clock_1_out_byteenable;
    end


  //DE0_SOPC_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_byteenable != DE0_SOPC_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_read_last_time <= DE0_SOPC_clock_1_out_read;
    end


  //DE0_SOPC_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_read != DE0_SOPC_clock_1_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_write_last_time <= DE0_SOPC_clock_1_out_write;
    end


  //DE0_SOPC_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_write != DE0_SOPC_clock_1_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_writedata_last_time <= DE0_SOPC_clock_1_out_writedata;
    end


  //DE0_SOPC_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_writedata != DE0_SOPC_clock_1_out_writedata_last_time) & DE0_SOPC_clock_1_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_2_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_2_in_endofpacket,
                                         DE0_SOPC_clock_2_in_readdata,
                                         DE0_SOPC_clock_2_in_waitrequest,
                                         clk,
                                         dma_write_master_address_to_slave,
                                         dma_write_master_byteenable,
                                         dma_write_master_chipselect,
                                         dma_write_master_write_n,
                                         dma_write_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_2_in_address,
                                         DE0_SOPC_clock_2_in_byteenable,
                                         DE0_SOPC_clock_2_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_2_in_nativeaddress,
                                         DE0_SOPC_clock_2_in_read,
                                         DE0_SOPC_clock_2_in_readdata_from_sa,
                                         DE0_SOPC_clock_2_in_reset_n,
                                         DE0_SOPC_clock_2_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_2_in_write,
                                         DE0_SOPC_clock_2_in_writedata,
                                         d1_DE0_SOPC_clock_2_in_end_xfer,
                                         dma_write_master_granted_DE0_SOPC_clock_2_in,
                                         dma_write_master_qualified_request_DE0_SOPC_clock_2_in,
                                         dma_write_master_requests_DE0_SOPC_clock_2_in
                                      )
;

  output  [ 22: 0] DE0_SOPC_clock_2_in_address;
  output  [  1: 0] DE0_SOPC_clock_2_in_byteenable;
  output           DE0_SOPC_clock_2_in_endofpacket_from_sa;
  output  [ 21: 0] DE0_SOPC_clock_2_in_nativeaddress;
  output           DE0_SOPC_clock_2_in_read;
  output  [ 15: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  output           DE0_SOPC_clock_2_in_reset_n;
  output           DE0_SOPC_clock_2_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_2_in_write;
  output  [ 15: 0] DE0_SOPC_clock_2_in_writedata;
  output           d1_DE0_SOPC_clock_2_in_end_xfer;
  output           dma_write_master_granted_DE0_SOPC_clock_2_in;
  output           dma_write_master_qualified_request_DE0_SOPC_clock_2_in;
  output           dma_write_master_requests_DE0_SOPC_clock_2_in;
  input            DE0_SOPC_clock_2_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_2_in_readdata;
  input            DE0_SOPC_clock_2_in_waitrequest;
  input            clk;
  input   [ 23: 0] dma_write_master_address_to_slave;
  input   [  1: 0] dma_write_master_byteenable;
  input            dma_write_master_chipselect;
  input            dma_write_master_write_n;
  input   [ 15: 0] dma_write_master_writedata;
  input            reset_n;

  wire    [ 22: 0] DE0_SOPC_clock_2_in_address;
  wire             DE0_SOPC_clock_2_in_allgrants;
  wire             DE0_SOPC_clock_2_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_2_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_2_in_any_continuerequest;
  wire             DE0_SOPC_clock_2_in_arb_counter_enable;
  reg              DE0_SOPC_clock_2_in_arb_share_counter;
  wire             DE0_SOPC_clock_2_in_arb_share_counter_next_value;
  wire             DE0_SOPC_clock_2_in_arb_share_set_values;
  wire             DE0_SOPC_clock_2_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_2_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_2_in_byteenable;
  wire             DE0_SOPC_clock_2_in_end_xfer;
  wire             DE0_SOPC_clock_2_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_2_in_firsttransfer;
  wire             DE0_SOPC_clock_2_in_grant_vector;
  wire             DE0_SOPC_clock_2_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_2_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_2_in_master_qreq_vector;
  wire    [ 21: 0] DE0_SOPC_clock_2_in_nativeaddress;
  wire             DE0_SOPC_clock_2_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_2_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  reg              DE0_SOPC_clock_2_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_2_in_reset_n;
  reg              DE0_SOPC_clock_2_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_2_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_2_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_2_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_2_in_waits_for_read;
  wire             DE0_SOPC_clock_2_in_waits_for_write;
  wire             DE0_SOPC_clock_2_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_writedata;
  reg              d1_DE0_SOPC_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  wire             dma_write_master_arbiterlock;
  wire             dma_write_master_arbiterlock2;
  wire             dma_write_master_continuerequest;
  wire             dma_write_master_granted_DE0_SOPC_clock_2_in;
  wire             dma_write_master_qualified_request_DE0_SOPC_clock_2_in;
  wire             dma_write_master_requests_DE0_SOPC_clock_2_in;
  wire             dma_write_master_saved_grant_DE0_SOPC_clock_2_in;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_SOPC_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_2_in_end_xfer;
    end


  assign DE0_SOPC_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((dma_write_master_qualified_request_DE0_SOPC_clock_2_in));
  //assign DE0_SOPC_clock_2_in_readdata_from_sa = DE0_SOPC_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_readdata_from_sa = DE0_SOPC_clock_2_in_readdata;

  assign dma_write_master_requests_DE0_SOPC_clock_2_in = (({dma_write_master_address_to_slave[23] , 23'b0} == 24'h800000) & dma_write_master_chipselect) & (~dma_write_master_write_n & dma_write_master_chipselect);
  //assign DE0_SOPC_clock_2_in_waitrequest_from_sa = DE0_SOPC_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_waitrequest_from_sa = DE0_SOPC_clock_2_in_waitrequest;

  //DE0_SOPC_clock_2_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_2_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_non_bursting_master_requests = dma_write_master_requests_DE0_SOPC_clock_2_in;

  //DE0_SOPC_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_arb_share_counter_next_value = DE0_SOPC_clock_2_in_firsttransfer ? (DE0_SOPC_clock_2_in_arb_share_set_values - 1) : |DE0_SOPC_clock_2_in_arb_share_counter ? (DE0_SOPC_clock_2_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_2_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_2_in_allgrants = |DE0_SOPC_clock_2_in_grant_vector;

  //DE0_SOPC_clock_2_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_end_xfer = ~(DE0_SOPC_clock_2_in_waits_for_read | DE0_SOPC_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in = DE0_SOPC_clock_2_in_end_xfer & (~DE0_SOPC_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & DE0_SOPC_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & ~DE0_SOPC_clock_2_in_non_bursting_master_requests);

  //DE0_SOPC_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_2_in_arb_counter_enable)
          DE0_SOPC_clock_2_in_arb_share_counter <= DE0_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & ~DE0_SOPC_clock_2_in_non_bursting_master_requests))
          DE0_SOPC_clock_2_in_slavearbiterlockenable <= |DE0_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //dma/write_master DE0_SOPC_clock_2/in arbiterlock, which is an e_assign
  assign dma_write_master_arbiterlock = DE0_SOPC_clock_2_in_slavearbiterlockenable & dma_write_master_continuerequest;

  //DE0_SOPC_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_2_in_slavearbiterlockenable2 = |DE0_SOPC_clock_2_in_arb_share_counter_next_value;

  //dma/write_master DE0_SOPC_clock_2/in arbiterlock2, which is an e_assign
  assign dma_write_master_arbiterlock2 = DE0_SOPC_clock_2_in_slavearbiterlockenable2 & dma_write_master_continuerequest;

  //DE0_SOPC_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_2_in_any_continuerequest = 1;

  //dma_write_master_continuerequest continued request, which is an e_assign
  assign dma_write_master_continuerequest = 1;

  assign dma_write_master_qualified_request_DE0_SOPC_clock_2_in = dma_write_master_requests_DE0_SOPC_clock_2_in;
  //DE0_SOPC_clock_2_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_writedata = dma_write_master_writedata;

  //assign DE0_SOPC_clock_2_in_endofpacket_from_sa = DE0_SOPC_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_endofpacket_from_sa = DE0_SOPC_clock_2_in_endofpacket;

  //master is always granted when requested
  assign dma_write_master_granted_DE0_SOPC_clock_2_in = dma_write_master_qualified_request_DE0_SOPC_clock_2_in;

  //dma/write_master saved-grant DE0_SOPC_clock_2/in, which is an e_assign
  assign dma_write_master_saved_grant_DE0_SOPC_clock_2_in = dma_write_master_requests_DE0_SOPC_clock_2_in;

  //allow new arb cycle for DE0_SOPC_clock_2/in, which is an e_assign
  assign DE0_SOPC_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_2_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_2_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_reset_n = reset_n;

  //DE0_SOPC_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_2_in_firsttransfer = DE0_SOPC_clock_2_in_begins_xfer ? DE0_SOPC_clock_2_in_unreg_firsttransfer : DE0_SOPC_clock_2_in_reg_firsttransfer;

  //DE0_SOPC_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_2_in_unreg_firsttransfer = ~(DE0_SOPC_clock_2_in_slavearbiterlockenable & DE0_SOPC_clock_2_in_any_continuerequest);

  //DE0_SOPC_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_2_in_begins_xfer)
          DE0_SOPC_clock_2_in_reg_firsttransfer <= DE0_SOPC_clock_2_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_2_in_beginbursttransfer_internal = DE0_SOPC_clock_2_in_begins_xfer;

  //DE0_SOPC_clock_2_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_2_in_read = 0;

  //DE0_SOPC_clock_2_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_2_in_write = dma_write_master_granted_DE0_SOPC_clock_2_in & (~dma_write_master_write_n & dma_write_master_chipselect);

  //DE0_SOPC_clock_2_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_address = dma_write_master_address_to_slave;

  //slaveid DE0_SOPC_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_nativeaddress = dma_write_master_address_to_slave >> 1;

  //d1_DE0_SOPC_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_2_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_2_in_end_xfer <= DE0_SOPC_clock_2_in_end_xfer;
    end


  //DE0_SOPC_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_2_in_waits_for_read = DE0_SOPC_clock_2_in_in_a_read_cycle & DE0_SOPC_clock_2_in_waitrequest_from_sa;

  //DE0_SOPC_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_in_a_read_cycle = 0;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_2_in_in_a_read_cycle;

  //DE0_SOPC_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_2_in_waits_for_write = DE0_SOPC_clock_2_in_in_a_write_cycle & DE0_SOPC_clock_2_in_waitrequest_from_sa;

  //DE0_SOPC_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_in_a_write_cycle = dma_write_master_granted_DE0_SOPC_clock_2_in & (~dma_write_master_write_n & dma_write_master_chipselect);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_2_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_2_in_counter = 0;
  //DE0_SOPC_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_byteenable = (dma_write_master_granted_DE0_SOPC_clock_2_in)? dma_write_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_2/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_2_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_2_out_address,
                                          DE0_SOPC_clock_2_out_byteenable,
                                          DE0_SOPC_clock_2_out_granted_sdram_s1,
                                          DE0_SOPC_clock_2_out_qualified_request_sdram_s1,
                                          DE0_SOPC_clock_2_out_read,
                                          DE0_SOPC_clock_2_out_read_data_valid_sdram_s1,
                                          DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register,
                                          DE0_SOPC_clock_2_out_requests_sdram_s1,
                                          DE0_SOPC_clock_2_out_write,
                                          DE0_SOPC_clock_2_out_writedata,
                                          clk,
                                          d1_sdram_s1_end_xfer,
                                          reset_n,
                                          sdram_s1_readdata_from_sa,
                                          sdram_s1_waitrequest_from_sa,

                                         // outputs:
                                          DE0_SOPC_clock_2_out_address_to_slave,
                                          DE0_SOPC_clock_2_out_readdata,
                                          DE0_SOPC_clock_2_out_reset_n,
                                          DE0_SOPC_clock_2_out_waitrequest
                                       )
;

  output  [ 22: 0] DE0_SOPC_clock_2_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_2_out_readdata;
  output           DE0_SOPC_clock_2_out_reset_n;
  output           DE0_SOPC_clock_2_out_waitrequest;
  input   [ 22: 0] DE0_SOPC_clock_2_out_address;
  input   [  1: 0] DE0_SOPC_clock_2_out_byteenable;
  input            DE0_SOPC_clock_2_out_granted_sdram_s1;
  input            DE0_SOPC_clock_2_out_qualified_request_sdram_s1;
  input            DE0_SOPC_clock_2_out_read;
  input            DE0_SOPC_clock_2_out_read_data_valid_sdram_s1;
  input            DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register;
  input            DE0_SOPC_clock_2_out_requests_sdram_s1;
  input            DE0_SOPC_clock_2_out_write;
  input   [ 15: 0] DE0_SOPC_clock_2_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 22: 0] DE0_SOPC_clock_2_out_address_last_time;
  wire    [ 22: 0] DE0_SOPC_clock_2_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_2_out_byteenable_last_time;
  reg              DE0_SOPC_clock_2_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_2_out_readdata;
  wire             DE0_SOPC_clock_2_out_reset_n;
  wire             DE0_SOPC_clock_2_out_run;
  wire             DE0_SOPC_clock_2_out_waitrequest;
  reg              DE0_SOPC_clock_2_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_2_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (DE0_SOPC_clock_2_out_qualified_request_sdram_s1 | DE0_SOPC_clock_2_out_read_data_valid_sdram_s1 | ~DE0_SOPC_clock_2_out_requests_sdram_s1) & (DE0_SOPC_clock_2_out_granted_sdram_s1 | ~DE0_SOPC_clock_2_out_qualified_request_sdram_s1) & ((~DE0_SOPC_clock_2_out_qualified_request_sdram_s1 | ~DE0_SOPC_clock_2_out_read | (DE0_SOPC_clock_2_out_read_data_valid_sdram_s1 & DE0_SOPC_clock_2_out_read))) & ((~DE0_SOPC_clock_2_out_qualified_request_sdram_s1 | ~(DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_2_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_2_out_address_to_slave = DE0_SOPC_clock_2_out_address;

  //DE0_SOPC_clock_2/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_2_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_2_out_waitrequest = ~DE0_SOPC_clock_2_out_run;

  //DE0_SOPC_clock_2_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_address_last_time <= DE0_SOPC_clock_2_out_address;
    end


  //DE0_SOPC_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_2_out_waitrequest & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write);
    end


  //DE0_SOPC_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_address != DE0_SOPC_clock_2_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_byteenable_last_time <= DE0_SOPC_clock_2_out_byteenable;
    end


  //DE0_SOPC_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_byteenable != DE0_SOPC_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_read_last_time <= DE0_SOPC_clock_2_out_read;
    end


  //DE0_SOPC_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_read != DE0_SOPC_clock_2_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_write_last_time <= DE0_SOPC_clock_2_out_write;
    end


  //DE0_SOPC_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_write != DE0_SOPC_clock_2_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_writedata_last_time <= DE0_SOPC_clock_2_out_writedata;
    end


  //DE0_SOPC_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_writedata != DE0_SOPC_clock_2_out_writedata_last_time) & DE0_SOPC_clock_2_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_3_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_3_in_endofpacket,
                                         DE0_SOPC_clock_3_in_readdata,
                                         DE0_SOPC_clock_3_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_3_in_address,
                                         DE0_SOPC_clock_3_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_3_in_nativeaddress,
                                         DE0_SOPC_clock_3_in_read,
                                         DE0_SOPC_clock_3_in_readdata_from_sa,
                                         DE0_SOPC_clock_3_in_reset_n,
                                         DE0_SOPC_clock_3_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_3_in_write,
                                         DE0_SOPC_clock_3_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_3_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_3_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_3_in,
                                         d1_DE0_SOPC_clock_3_in_end_xfer
                                      )
;

  output  [  1: 0] DE0_SOPC_clock_3_in_address;
  output           DE0_SOPC_clock_3_in_endofpacket_from_sa;
  output  [  1: 0] DE0_SOPC_clock_3_in_nativeaddress;
  output           DE0_SOPC_clock_3_in_read;
  output  [  7: 0] DE0_SOPC_clock_3_in_readdata_from_sa;
  output           DE0_SOPC_clock_3_in_reset_n;
  output           DE0_SOPC_clock_3_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_3_in_write;
  output  [  7: 0] DE0_SOPC_clock_3_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_3_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_3_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_3_in;
  output           d1_DE0_SOPC_clock_3_in_end_xfer;
  input            DE0_SOPC_clock_3_in_endofpacket;
  input   [  7: 0] DE0_SOPC_clock_3_in_readdata;
  input            DE0_SOPC_clock_3_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] DE0_SOPC_clock_3_in_address;
  wire             DE0_SOPC_clock_3_in_allgrants;
  wire             DE0_SOPC_clock_3_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_3_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_3_in_any_continuerequest;
  wire             DE0_SOPC_clock_3_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_3_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_3_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_3_in_arb_share_set_values;
  wire             DE0_SOPC_clock_3_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_3_in_begins_xfer;
  wire             DE0_SOPC_clock_3_in_end_xfer;
  wire             DE0_SOPC_clock_3_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_3_in_firsttransfer;
  wire             DE0_SOPC_clock_3_in_grant_vector;
  wire             DE0_SOPC_clock_3_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_3_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_3_in_master_qreq_vector;
  wire    [  1: 0] DE0_SOPC_clock_3_in_nativeaddress;
  wire             DE0_SOPC_clock_3_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_3_in_pretend_byte_enable;
  wire             DE0_SOPC_clock_3_in_read;
  wire    [  7: 0] DE0_SOPC_clock_3_in_readdata_from_sa;
  reg              DE0_SOPC_clock_3_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_3_in_reset_n;
  reg              DE0_SOPC_clock_3_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_3_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_3_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_3_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_3_in_waits_for_read;
  wire             DE0_SOPC_clock_3_in_waits_for_write;
  wire             DE0_SOPC_clock_3_in_write;
  wire    [  7: 0] DE0_SOPC_clock_3_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_3_in;
  reg              d1_DE0_SOPC_clock_3_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_3_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_3_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_3_in_end_xfer;
    end


  assign DE0_SOPC_clock_3_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_3_in));
  //assign DE0_SOPC_clock_3_in_readdata_from_sa = DE0_SOPC_clock_3_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_3_in_readdata_from_sa = DE0_SOPC_clock_3_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_3_in = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18010f0) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_3_in_waitrequest_from_sa = DE0_SOPC_clock_3_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_3_in_waitrequest_from_sa = DE0_SOPC_clock_3_in_waitrequest;

  //DE0_SOPC_clock_3_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_3_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_3_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_3_in;

  //DE0_SOPC_clock_3_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_3_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_3_in_arb_share_counter_next_value = DE0_SOPC_clock_3_in_firsttransfer ? (DE0_SOPC_clock_3_in_arb_share_set_values - 1) : |DE0_SOPC_clock_3_in_arb_share_counter ? (DE0_SOPC_clock_3_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_3_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_3_in_allgrants = |DE0_SOPC_clock_3_in_grant_vector;

  //DE0_SOPC_clock_3_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_3_in_end_xfer = ~(DE0_SOPC_clock_3_in_waits_for_read | DE0_SOPC_clock_3_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in = DE0_SOPC_clock_3_in_end_xfer & (~DE0_SOPC_clock_3_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_3_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_3_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in & DE0_SOPC_clock_3_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in & ~DE0_SOPC_clock_3_in_non_bursting_master_requests);

  //DE0_SOPC_clock_3_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_3_in_arb_counter_enable)
          DE0_SOPC_clock_3_in_arb_share_counter <= DE0_SOPC_clock_3_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_3_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_3_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_3_in & ~DE0_SOPC_clock_3_in_non_bursting_master_requests))
          DE0_SOPC_clock_3_in_slavearbiterlockenable <= |DE0_SOPC_clock_3_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_3/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_3_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_3_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_3_in_slavearbiterlockenable2 = |DE0_SOPC_clock_3_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_3/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_3_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_3_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_3_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_3_in = cpu_data_master_requests_DE0_SOPC_clock_3_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_3_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_3_in_endofpacket_from_sa = DE0_SOPC_clock_3_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_3_in_endofpacket_from_sa = DE0_SOPC_clock_3_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_3_in = cpu_data_master_qualified_request_DE0_SOPC_clock_3_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_3/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_3_in = cpu_data_master_requests_DE0_SOPC_clock_3_in;

  //allow new arb cycle for DE0_SOPC_clock_3/in, which is an e_assign
  assign DE0_SOPC_clock_3_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_3_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_3_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_3_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_3_in_reset_n = reset_n;

  //DE0_SOPC_clock_3_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_3_in_firsttransfer = DE0_SOPC_clock_3_in_begins_xfer ? DE0_SOPC_clock_3_in_unreg_firsttransfer : DE0_SOPC_clock_3_in_reg_firsttransfer;

  //DE0_SOPC_clock_3_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_3_in_unreg_firsttransfer = ~(DE0_SOPC_clock_3_in_slavearbiterlockenable & DE0_SOPC_clock_3_in_any_continuerequest);

  //DE0_SOPC_clock_3_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_3_in_begins_xfer)
          DE0_SOPC_clock_3_in_reg_firsttransfer <= DE0_SOPC_clock_3_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_3_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_3_in_beginbursttransfer_internal = DE0_SOPC_clock_3_in_begins_xfer;

  //DE0_SOPC_clock_3_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_3_in_read = cpu_data_master_granted_DE0_SOPC_clock_3_in & cpu_data_master_read;

  //DE0_SOPC_clock_3_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_3_in_write = ((cpu_data_master_granted_DE0_SOPC_clock_3_in & cpu_data_master_write)) & DE0_SOPC_clock_3_in_pretend_byte_enable;

  assign shifted_address_to_DE0_SOPC_clock_3_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_3_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_address = shifted_address_to_DE0_SOPC_clock_3_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_3_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_3_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_3_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_3_in_end_xfer <= DE0_SOPC_clock_3_in_end_xfer;
    end


  //DE0_SOPC_clock_3_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_3_in_waits_for_read = DE0_SOPC_clock_3_in_in_a_read_cycle & DE0_SOPC_clock_3_in_waitrequest_from_sa;

  //DE0_SOPC_clock_3_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_3_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_3_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_3_in_in_a_read_cycle;

  //DE0_SOPC_clock_3_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_3_in_waits_for_write = DE0_SOPC_clock_3_in_in_a_write_cycle & DE0_SOPC_clock_3_in_waitrequest_from_sa;

  //DE0_SOPC_clock_3_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_3_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_3_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_3_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_3_in_counter = 0;
  //DE0_SOPC_clock_3_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_3_in_pretend_byte_enable = (cpu_data_master_granted_DE0_SOPC_clock_3_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_3/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_3_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_3_out_address,
                                          DE0_SOPC_clock_3_out_granted_mode_sw_s1,
                                          DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1,
                                          DE0_SOPC_clock_3_out_read,
                                          DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1,
                                          DE0_SOPC_clock_3_out_requests_mode_sw_s1,
                                          DE0_SOPC_clock_3_out_write,
                                          DE0_SOPC_clock_3_out_writedata,
                                          clk,
                                          d1_mode_sw_s1_end_xfer,
                                          mode_sw_s1_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_3_out_address_to_slave,
                                          DE0_SOPC_clock_3_out_readdata,
                                          DE0_SOPC_clock_3_out_reset_n,
                                          DE0_SOPC_clock_3_out_waitrequest
                                       )
;

  output  [  1: 0] DE0_SOPC_clock_3_out_address_to_slave;
  output  [  7: 0] DE0_SOPC_clock_3_out_readdata;
  output           DE0_SOPC_clock_3_out_reset_n;
  output           DE0_SOPC_clock_3_out_waitrequest;
  input   [  1: 0] DE0_SOPC_clock_3_out_address;
  input            DE0_SOPC_clock_3_out_granted_mode_sw_s1;
  input            DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1;
  input            DE0_SOPC_clock_3_out_read;
  input            DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1;
  input            DE0_SOPC_clock_3_out_requests_mode_sw_s1;
  input            DE0_SOPC_clock_3_out_write;
  input   [  7: 0] DE0_SOPC_clock_3_out_writedata;
  input            clk;
  input            d1_mode_sw_s1_end_xfer;
  input            mode_sw_s1_readdata_from_sa;
  input            reset_n;

  reg     [  1: 0] DE0_SOPC_clock_3_out_address_last_time;
  wire    [  1: 0] DE0_SOPC_clock_3_out_address_to_slave;
  reg              DE0_SOPC_clock_3_out_read_last_time;
  wire    [  7: 0] DE0_SOPC_clock_3_out_readdata;
  wire             DE0_SOPC_clock_3_out_reset_n;
  wire             DE0_SOPC_clock_3_out_run;
  wire             DE0_SOPC_clock_3_out_waitrequest;
  reg              DE0_SOPC_clock_3_out_write_last_time;
  reg     [  7: 0] DE0_SOPC_clock_3_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((~DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1 | ~DE0_SOPC_clock_3_out_read | (1 & ~d1_mode_sw_s1_end_xfer & DE0_SOPC_clock_3_out_read))) & ((~DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1 | ~DE0_SOPC_clock_3_out_write | (1 & DE0_SOPC_clock_3_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_3_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_3_out_address_to_slave = DE0_SOPC_clock_3_out_address;

  //DE0_SOPC_clock_3/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_3_out_readdata = mode_sw_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_3_out_waitrequest = ~DE0_SOPC_clock_3_out_run;

  //DE0_SOPC_clock_3_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_3_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_3_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_3_out_address_last_time <= DE0_SOPC_clock_3_out_address;
    end


  //DE0_SOPC_clock_3/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_3_out_waitrequest & (DE0_SOPC_clock_3_out_read | DE0_SOPC_clock_3_out_write);
    end


  //DE0_SOPC_clock_3_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_3_out_address != DE0_SOPC_clock_3_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_3_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_3_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_3_out_read_last_time <= DE0_SOPC_clock_3_out_read;
    end


  //DE0_SOPC_clock_3_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_3_out_read != DE0_SOPC_clock_3_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_3_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_3_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_3_out_write_last_time <= DE0_SOPC_clock_3_out_write;
    end


  //DE0_SOPC_clock_3_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_3_out_write != DE0_SOPC_clock_3_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_3_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_3_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_3_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_3_out_writedata_last_time <= DE0_SOPC_clock_3_out_writedata;
    end


  //DE0_SOPC_clock_3_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_3_out_writedata != DE0_SOPC_clock_3_out_writedata_last_time) & DE0_SOPC_clock_3_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_3_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_4_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_4_in_endofpacket,
                                         DE0_SOPC_clock_4_in_readdata,
                                         DE0_SOPC_clock_4_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_4_in_address,
                                         DE0_SOPC_clock_4_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_4_in_nativeaddress,
                                         DE0_SOPC_clock_4_in_read,
                                         DE0_SOPC_clock_4_in_readdata_from_sa,
                                         DE0_SOPC_clock_4_in_reset_n,
                                         DE0_SOPC_clock_4_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_4_in_write,
                                         DE0_SOPC_clock_4_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_4_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_4_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_4_in,
                                         d1_DE0_SOPC_clock_4_in_end_xfer
                                      )
;

  output  [  1: 0] DE0_SOPC_clock_4_in_address;
  output           DE0_SOPC_clock_4_in_endofpacket_from_sa;
  output  [  1: 0] DE0_SOPC_clock_4_in_nativeaddress;
  output           DE0_SOPC_clock_4_in_read;
  output  [  7: 0] DE0_SOPC_clock_4_in_readdata_from_sa;
  output           DE0_SOPC_clock_4_in_reset_n;
  output           DE0_SOPC_clock_4_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_4_in_write;
  output  [  7: 0] DE0_SOPC_clock_4_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_4_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_4_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_4_in;
  output           d1_DE0_SOPC_clock_4_in_end_xfer;
  input            DE0_SOPC_clock_4_in_endofpacket;
  input   [  7: 0] DE0_SOPC_clock_4_in_readdata;
  input            DE0_SOPC_clock_4_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] DE0_SOPC_clock_4_in_address;
  wire             DE0_SOPC_clock_4_in_allgrants;
  wire             DE0_SOPC_clock_4_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_4_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_4_in_any_continuerequest;
  wire             DE0_SOPC_clock_4_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_4_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_4_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_4_in_arb_share_set_values;
  wire             DE0_SOPC_clock_4_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_4_in_begins_xfer;
  wire             DE0_SOPC_clock_4_in_end_xfer;
  wire             DE0_SOPC_clock_4_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_4_in_firsttransfer;
  wire             DE0_SOPC_clock_4_in_grant_vector;
  wire             DE0_SOPC_clock_4_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_4_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_4_in_master_qreq_vector;
  wire    [  1: 0] DE0_SOPC_clock_4_in_nativeaddress;
  wire             DE0_SOPC_clock_4_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_4_in_pretend_byte_enable;
  wire             DE0_SOPC_clock_4_in_read;
  wire    [  7: 0] DE0_SOPC_clock_4_in_readdata_from_sa;
  reg              DE0_SOPC_clock_4_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_4_in_reset_n;
  reg              DE0_SOPC_clock_4_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_4_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_4_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_4_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_4_in_waits_for_read;
  wire             DE0_SOPC_clock_4_in_waits_for_write;
  wire             DE0_SOPC_clock_4_in_write;
  wire    [  7: 0] DE0_SOPC_clock_4_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_4_in;
  reg              d1_DE0_SOPC_clock_4_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_4_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_4_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_4_in_end_xfer;
    end


  assign DE0_SOPC_clock_4_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_4_in));
  //assign DE0_SOPC_clock_4_in_readdata_from_sa = DE0_SOPC_clock_4_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_4_in_readdata_from_sa = DE0_SOPC_clock_4_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_4_in = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1801100) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_4_in_waitrequest_from_sa = DE0_SOPC_clock_4_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_4_in_waitrequest_from_sa = DE0_SOPC_clock_4_in_waitrequest;

  //DE0_SOPC_clock_4_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_4_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_4_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_4_in;

  //DE0_SOPC_clock_4_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_4_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_4_in_arb_share_counter_next_value = DE0_SOPC_clock_4_in_firsttransfer ? (DE0_SOPC_clock_4_in_arb_share_set_values - 1) : |DE0_SOPC_clock_4_in_arb_share_counter ? (DE0_SOPC_clock_4_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_4_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_4_in_allgrants = |DE0_SOPC_clock_4_in_grant_vector;

  //DE0_SOPC_clock_4_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_4_in_end_xfer = ~(DE0_SOPC_clock_4_in_waits_for_read | DE0_SOPC_clock_4_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in = DE0_SOPC_clock_4_in_end_xfer & (~DE0_SOPC_clock_4_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_4_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_4_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in & DE0_SOPC_clock_4_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in & ~DE0_SOPC_clock_4_in_non_bursting_master_requests);

  //DE0_SOPC_clock_4_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_4_in_arb_counter_enable)
          DE0_SOPC_clock_4_in_arb_share_counter <= DE0_SOPC_clock_4_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_4_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_4_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_4_in & ~DE0_SOPC_clock_4_in_non_bursting_master_requests))
          DE0_SOPC_clock_4_in_slavearbiterlockenable <= |DE0_SOPC_clock_4_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_4/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_4_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_4_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_4_in_slavearbiterlockenable2 = |DE0_SOPC_clock_4_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_4/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_4_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_4_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_4_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_4_in = cpu_data_master_requests_DE0_SOPC_clock_4_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_4_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_4_in_endofpacket_from_sa = DE0_SOPC_clock_4_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_4_in_endofpacket_from_sa = DE0_SOPC_clock_4_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_4_in = cpu_data_master_qualified_request_DE0_SOPC_clock_4_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_4/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_4_in = cpu_data_master_requests_DE0_SOPC_clock_4_in;

  //allow new arb cycle for DE0_SOPC_clock_4/in, which is an e_assign
  assign DE0_SOPC_clock_4_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_4_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_4_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_4_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_4_in_reset_n = reset_n;

  //DE0_SOPC_clock_4_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_4_in_firsttransfer = DE0_SOPC_clock_4_in_begins_xfer ? DE0_SOPC_clock_4_in_unreg_firsttransfer : DE0_SOPC_clock_4_in_reg_firsttransfer;

  //DE0_SOPC_clock_4_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_4_in_unreg_firsttransfer = ~(DE0_SOPC_clock_4_in_slavearbiterlockenable & DE0_SOPC_clock_4_in_any_continuerequest);

  //DE0_SOPC_clock_4_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_4_in_begins_xfer)
          DE0_SOPC_clock_4_in_reg_firsttransfer <= DE0_SOPC_clock_4_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_4_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_4_in_beginbursttransfer_internal = DE0_SOPC_clock_4_in_begins_xfer;

  //DE0_SOPC_clock_4_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_4_in_read = cpu_data_master_granted_DE0_SOPC_clock_4_in & cpu_data_master_read;

  //DE0_SOPC_clock_4_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_4_in_write = ((cpu_data_master_granted_DE0_SOPC_clock_4_in & cpu_data_master_write)) & DE0_SOPC_clock_4_in_pretend_byte_enable;

  assign shifted_address_to_DE0_SOPC_clock_4_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_4_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_address = shifted_address_to_DE0_SOPC_clock_4_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_4_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_4_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_4_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_4_in_end_xfer <= DE0_SOPC_clock_4_in_end_xfer;
    end


  //DE0_SOPC_clock_4_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_4_in_waits_for_read = DE0_SOPC_clock_4_in_in_a_read_cycle & DE0_SOPC_clock_4_in_waitrequest_from_sa;

  //DE0_SOPC_clock_4_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_4_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_4_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_4_in_in_a_read_cycle;

  //DE0_SOPC_clock_4_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_4_in_waits_for_write = DE0_SOPC_clock_4_in_in_a_write_cycle & DE0_SOPC_clock_4_in_waitrequest_from_sa;

  //DE0_SOPC_clock_4_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_4_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_4_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_4_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_4_in_counter = 0;
  //DE0_SOPC_clock_4_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_4_in_pretend_byte_enable = (cpu_data_master_granted_DE0_SOPC_clock_4_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_4/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_4_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_4_out_address,
                                          DE0_SOPC_clock_4_out_granted_lcd_display_control_slave,
                                          DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave,
                                          DE0_SOPC_clock_4_out_read,
                                          DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave,
                                          DE0_SOPC_clock_4_out_requests_lcd_display_control_slave,
                                          DE0_SOPC_clock_4_out_write,
                                          DE0_SOPC_clock_4_out_writedata,
                                          clk,
                                          d1_lcd_display_control_slave_end_xfer,
                                          lcd_display_control_slave_readdata_from_sa,
                                          lcd_display_control_slave_wait_counter_eq_0,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_4_out_address_to_slave,
                                          DE0_SOPC_clock_4_out_readdata,
                                          DE0_SOPC_clock_4_out_reset_n,
                                          DE0_SOPC_clock_4_out_waitrequest
                                       )
;

  output  [  1: 0] DE0_SOPC_clock_4_out_address_to_slave;
  output  [  7: 0] DE0_SOPC_clock_4_out_readdata;
  output           DE0_SOPC_clock_4_out_reset_n;
  output           DE0_SOPC_clock_4_out_waitrequest;
  input   [  1: 0] DE0_SOPC_clock_4_out_address;
  input            DE0_SOPC_clock_4_out_granted_lcd_display_control_slave;
  input            DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave;
  input            DE0_SOPC_clock_4_out_read;
  input            DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave;
  input            DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;
  input            DE0_SOPC_clock_4_out_write;
  input   [  7: 0] DE0_SOPC_clock_4_out_writedata;
  input            clk;
  input            d1_lcd_display_control_slave_end_xfer;
  input   [  7: 0] lcd_display_control_slave_readdata_from_sa;
  input            lcd_display_control_slave_wait_counter_eq_0;
  input            reset_n;

  reg     [  1: 0] DE0_SOPC_clock_4_out_address_last_time;
  wire    [  1: 0] DE0_SOPC_clock_4_out_address_to_slave;
  reg              DE0_SOPC_clock_4_out_read_last_time;
  wire    [  7: 0] DE0_SOPC_clock_4_out_readdata;
  wire             DE0_SOPC_clock_4_out_reset_n;
  wire             DE0_SOPC_clock_4_out_run;
  wire             DE0_SOPC_clock_4_out_waitrequest;
  reg              DE0_SOPC_clock_4_out_write_last_time;
  reg     [  7: 0] DE0_SOPC_clock_4_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((~DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave | ~DE0_SOPC_clock_4_out_read | (1 & ((lcd_display_control_slave_wait_counter_eq_0 & ~d1_lcd_display_control_slave_end_xfer)) & DE0_SOPC_clock_4_out_read))) & ((~DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave | ~DE0_SOPC_clock_4_out_write | (1 & ((lcd_display_control_slave_wait_counter_eq_0 & ~d1_lcd_display_control_slave_end_xfer)) & DE0_SOPC_clock_4_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_4_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_4_out_address_to_slave = DE0_SOPC_clock_4_out_address;

  //DE0_SOPC_clock_4/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_4_out_readdata = lcd_display_control_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_4_out_waitrequest = ~DE0_SOPC_clock_4_out_run;

  //DE0_SOPC_clock_4_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_4_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_4_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_4_out_address_last_time <= DE0_SOPC_clock_4_out_address;
    end


  //DE0_SOPC_clock_4/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_4_out_waitrequest & (DE0_SOPC_clock_4_out_read | DE0_SOPC_clock_4_out_write);
    end


  //DE0_SOPC_clock_4_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_4_out_address != DE0_SOPC_clock_4_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_4_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_4_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_4_out_read_last_time <= DE0_SOPC_clock_4_out_read;
    end


  //DE0_SOPC_clock_4_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_4_out_read != DE0_SOPC_clock_4_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_4_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_4_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_4_out_write_last_time <= DE0_SOPC_clock_4_out_write;
    end


  //DE0_SOPC_clock_4_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_4_out_write != DE0_SOPC_clock_4_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_4_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_4_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_4_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_4_out_writedata_last_time <= DE0_SOPC_clock_4_out_writedata;
    end


  //DE0_SOPC_clock_4_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_4_out_writedata != DE0_SOPC_clock_4_out_writedata_last_time) & DE0_SOPC_clock_4_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_4_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_5_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_5_in_endofpacket,
                                         DE0_SOPC_clock_5_in_readdata,
                                         DE0_SOPC_clock_5_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_5_in_address,
                                         DE0_SOPC_clock_5_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_5_in_nativeaddress,
                                         DE0_SOPC_clock_5_in_read,
                                         DE0_SOPC_clock_5_in_readdata_from_sa,
                                         DE0_SOPC_clock_5_in_reset_n,
                                         DE0_SOPC_clock_5_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_5_in_write,
                                         DE0_SOPC_clock_5_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_5_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_5_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_5_in,
                                         d1_DE0_SOPC_clock_5_in_end_xfer
                                      )
;

  output  [  1: 0] DE0_SOPC_clock_5_in_address;
  output           DE0_SOPC_clock_5_in_endofpacket_from_sa;
  output  [  1: 0] DE0_SOPC_clock_5_in_nativeaddress;
  output           DE0_SOPC_clock_5_in_read;
  output  [  7: 0] DE0_SOPC_clock_5_in_readdata_from_sa;
  output           DE0_SOPC_clock_5_in_reset_n;
  output           DE0_SOPC_clock_5_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_5_in_write;
  output  [  7: 0] DE0_SOPC_clock_5_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_5_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_5_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_5_in;
  output           d1_DE0_SOPC_clock_5_in_end_xfer;
  input            DE0_SOPC_clock_5_in_endofpacket;
  input   [  7: 0] DE0_SOPC_clock_5_in_readdata;
  input            DE0_SOPC_clock_5_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] DE0_SOPC_clock_5_in_address;
  wire             DE0_SOPC_clock_5_in_allgrants;
  wire             DE0_SOPC_clock_5_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_5_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_5_in_any_continuerequest;
  wire             DE0_SOPC_clock_5_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_5_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_5_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_5_in_arb_share_set_values;
  wire             DE0_SOPC_clock_5_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_5_in_begins_xfer;
  wire             DE0_SOPC_clock_5_in_end_xfer;
  wire             DE0_SOPC_clock_5_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_5_in_firsttransfer;
  wire             DE0_SOPC_clock_5_in_grant_vector;
  wire             DE0_SOPC_clock_5_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_5_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_5_in_master_qreq_vector;
  wire    [  1: 0] DE0_SOPC_clock_5_in_nativeaddress;
  wire             DE0_SOPC_clock_5_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_5_in_pretend_byte_enable;
  wire             DE0_SOPC_clock_5_in_read;
  wire    [  7: 0] DE0_SOPC_clock_5_in_readdata_from_sa;
  reg              DE0_SOPC_clock_5_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_5_in_reset_n;
  reg              DE0_SOPC_clock_5_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_5_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_5_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_5_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_5_in_waits_for_read;
  wire             DE0_SOPC_clock_5_in_waits_for_write;
  wire             DE0_SOPC_clock_5_in_write;
  wire    [  7: 0] DE0_SOPC_clock_5_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_5_in;
  reg              d1_DE0_SOPC_clock_5_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_5_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_5_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_5_in_end_xfer;
    end


  assign DE0_SOPC_clock_5_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_5_in));
  //assign DE0_SOPC_clock_5_in_readdata_from_sa = DE0_SOPC_clock_5_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_5_in_readdata_from_sa = DE0_SOPC_clock_5_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_5_in = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1801110) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_5_in_waitrequest_from_sa = DE0_SOPC_clock_5_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_5_in_waitrequest_from_sa = DE0_SOPC_clock_5_in_waitrequest;

  //DE0_SOPC_clock_5_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_5_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_5_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_5_in;

  //DE0_SOPC_clock_5_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_5_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_5_in_arb_share_counter_next_value = DE0_SOPC_clock_5_in_firsttransfer ? (DE0_SOPC_clock_5_in_arb_share_set_values - 1) : |DE0_SOPC_clock_5_in_arb_share_counter ? (DE0_SOPC_clock_5_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_5_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_5_in_allgrants = |DE0_SOPC_clock_5_in_grant_vector;

  //DE0_SOPC_clock_5_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_5_in_end_xfer = ~(DE0_SOPC_clock_5_in_waits_for_read | DE0_SOPC_clock_5_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in = DE0_SOPC_clock_5_in_end_xfer & (~DE0_SOPC_clock_5_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_5_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_5_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in & DE0_SOPC_clock_5_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in & ~DE0_SOPC_clock_5_in_non_bursting_master_requests);

  //DE0_SOPC_clock_5_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_5_in_arb_counter_enable)
          DE0_SOPC_clock_5_in_arb_share_counter <= DE0_SOPC_clock_5_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_5_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_5_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_5_in & ~DE0_SOPC_clock_5_in_non_bursting_master_requests))
          DE0_SOPC_clock_5_in_slavearbiterlockenable <= |DE0_SOPC_clock_5_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_5/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_5_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_5_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_5_in_slavearbiterlockenable2 = |DE0_SOPC_clock_5_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_5/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_5_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_5_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_5_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_5_in = cpu_data_master_requests_DE0_SOPC_clock_5_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_5_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_5_in_endofpacket_from_sa = DE0_SOPC_clock_5_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_5_in_endofpacket_from_sa = DE0_SOPC_clock_5_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_5_in = cpu_data_master_qualified_request_DE0_SOPC_clock_5_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_5/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_5_in = cpu_data_master_requests_DE0_SOPC_clock_5_in;

  //allow new arb cycle for DE0_SOPC_clock_5/in, which is an e_assign
  assign DE0_SOPC_clock_5_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_5_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_5_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_5_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_5_in_reset_n = reset_n;

  //DE0_SOPC_clock_5_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_5_in_firsttransfer = DE0_SOPC_clock_5_in_begins_xfer ? DE0_SOPC_clock_5_in_unreg_firsttransfer : DE0_SOPC_clock_5_in_reg_firsttransfer;

  //DE0_SOPC_clock_5_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_5_in_unreg_firsttransfer = ~(DE0_SOPC_clock_5_in_slavearbiterlockenable & DE0_SOPC_clock_5_in_any_continuerequest);

  //DE0_SOPC_clock_5_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_5_in_begins_xfer)
          DE0_SOPC_clock_5_in_reg_firsttransfer <= DE0_SOPC_clock_5_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_5_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_5_in_beginbursttransfer_internal = DE0_SOPC_clock_5_in_begins_xfer;

  //DE0_SOPC_clock_5_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_5_in_read = cpu_data_master_granted_DE0_SOPC_clock_5_in & cpu_data_master_read;

  //DE0_SOPC_clock_5_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_5_in_write = ((cpu_data_master_granted_DE0_SOPC_clock_5_in & cpu_data_master_write)) & DE0_SOPC_clock_5_in_pretend_byte_enable;

  assign shifted_address_to_DE0_SOPC_clock_5_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_5_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_address = shifted_address_to_DE0_SOPC_clock_5_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_5_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_5_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_5_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_5_in_end_xfer <= DE0_SOPC_clock_5_in_end_xfer;
    end


  //DE0_SOPC_clock_5_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_5_in_waits_for_read = DE0_SOPC_clock_5_in_in_a_read_cycle & DE0_SOPC_clock_5_in_waitrequest_from_sa;

  //DE0_SOPC_clock_5_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_5_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_5_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_5_in_in_a_read_cycle;

  //DE0_SOPC_clock_5_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_5_in_waits_for_write = DE0_SOPC_clock_5_in_in_a_write_cycle & DE0_SOPC_clock_5_in_waitrequest_from_sa;

  //DE0_SOPC_clock_5_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_5_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_5_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_5_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_5_in_counter = 0;
  //DE0_SOPC_clock_5_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_5_in_pretend_byte_enable = (cpu_data_master_granted_DE0_SOPC_clock_5_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_5/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_5_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_5_out_address,
                                          DE0_SOPC_clock_5_out_granted_led_pwm_s1,
                                          DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1,
                                          DE0_SOPC_clock_5_out_read,
                                          DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1,
                                          DE0_SOPC_clock_5_out_requests_led_pwm_s1,
                                          DE0_SOPC_clock_5_out_write,
                                          DE0_SOPC_clock_5_out_writedata,
                                          clk,
                                          d1_led_pwm_s1_end_xfer,
                                          led_pwm_s1_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_5_out_address_to_slave,
                                          DE0_SOPC_clock_5_out_readdata,
                                          DE0_SOPC_clock_5_out_reset_n,
                                          DE0_SOPC_clock_5_out_waitrequest
                                       )
;

  output  [  1: 0] DE0_SOPC_clock_5_out_address_to_slave;
  output  [  7: 0] DE0_SOPC_clock_5_out_readdata;
  output           DE0_SOPC_clock_5_out_reset_n;
  output           DE0_SOPC_clock_5_out_waitrequest;
  input   [  1: 0] DE0_SOPC_clock_5_out_address;
  input            DE0_SOPC_clock_5_out_granted_led_pwm_s1;
  input            DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1;
  input            DE0_SOPC_clock_5_out_read;
  input            DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1;
  input            DE0_SOPC_clock_5_out_requests_led_pwm_s1;
  input            DE0_SOPC_clock_5_out_write;
  input   [  7: 0] DE0_SOPC_clock_5_out_writedata;
  input            clk;
  input            d1_led_pwm_s1_end_xfer;
  input   [  7: 0] led_pwm_s1_readdata_from_sa;
  input            reset_n;

  reg     [  1: 0] DE0_SOPC_clock_5_out_address_last_time;
  wire    [  1: 0] DE0_SOPC_clock_5_out_address_to_slave;
  reg              DE0_SOPC_clock_5_out_read_last_time;
  wire    [  7: 0] DE0_SOPC_clock_5_out_readdata;
  wire             DE0_SOPC_clock_5_out_reset_n;
  wire             DE0_SOPC_clock_5_out_run;
  wire             DE0_SOPC_clock_5_out_waitrequest;
  reg              DE0_SOPC_clock_5_out_write_last_time;
  reg     [  7: 0] DE0_SOPC_clock_5_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((~DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1 | ~DE0_SOPC_clock_5_out_read | (1 & ~d1_led_pwm_s1_end_xfer & DE0_SOPC_clock_5_out_read))) & ((~DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1 | ~DE0_SOPC_clock_5_out_write | (1 & DE0_SOPC_clock_5_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_5_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_5_out_address_to_slave = DE0_SOPC_clock_5_out_address;

  //DE0_SOPC_clock_5/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_5_out_readdata = led_pwm_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_5_out_waitrequest = ~DE0_SOPC_clock_5_out_run;

  //DE0_SOPC_clock_5_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_5_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_5_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_5_out_address_last_time <= DE0_SOPC_clock_5_out_address;
    end


  //DE0_SOPC_clock_5/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_5_out_waitrequest & (DE0_SOPC_clock_5_out_read | DE0_SOPC_clock_5_out_write);
    end


  //DE0_SOPC_clock_5_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_5_out_address != DE0_SOPC_clock_5_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_5_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_5_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_5_out_read_last_time <= DE0_SOPC_clock_5_out_read;
    end


  //DE0_SOPC_clock_5_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_5_out_read != DE0_SOPC_clock_5_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_5_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_5_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_5_out_write_last_time <= DE0_SOPC_clock_5_out_write;
    end


  //DE0_SOPC_clock_5_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_5_out_write != DE0_SOPC_clock_5_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_5_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_5_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_5_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_5_out_writedata_last_time <= DE0_SOPC_clock_5_out_writedata;
    end


  //DE0_SOPC_clock_5_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_5_out_writedata != DE0_SOPC_clock_5_out_writedata_last_time) & DE0_SOPC_clock_5_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_5_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_6_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_6_in_endofpacket,
                                         DE0_SOPC_clock_6_in_readdata,
                                         DE0_SOPC_clock_6_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_6_in_address,
                                         DE0_SOPC_clock_6_in_byteenable,
                                         DE0_SOPC_clock_6_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_6_in_nativeaddress,
                                         DE0_SOPC_clock_6_in_read,
                                         DE0_SOPC_clock_6_in_readdata_from_sa,
                                         DE0_SOPC_clock_6_in_reset_n,
                                         DE0_SOPC_clock_6_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_6_in_write,
                                         DE0_SOPC_clock_6_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_6_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_6_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_6_in,
                                         d1_DE0_SOPC_clock_6_in_end_xfer
                                      )
;

  output  [  4: 0] DE0_SOPC_clock_6_in_address;
  output  [  3: 0] DE0_SOPC_clock_6_in_byteenable;
  output           DE0_SOPC_clock_6_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_6_in_nativeaddress;
  output           DE0_SOPC_clock_6_in_read;
  output  [ 31: 0] DE0_SOPC_clock_6_in_readdata_from_sa;
  output           DE0_SOPC_clock_6_in_reset_n;
  output           DE0_SOPC_clock_6_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_6_in_write;
  output  [ 31: 0] DE0_SOPC_clock_6_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_6_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_6_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_6_in;
  output           d1_DE0_SOPC_clock_6_in_end_xfer;
  input            DE0_SOPC_clock_6_in_endofpacket;
  input   [ 31: 0] DE0_SOPC_clock_6_in_readdata;
  input            DE0_SOPC_clock_6_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  4: 0] DE0_SOPC_clock_6_in_address;
  wire             DE0_SOPC_clock_6_in_allgrants;
  wire             DE0_SOPC_clock_6_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_6_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_6_in_any_continuerequest;
  wire             DE0_SOPC_clock_6_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_6_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_6_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_6_in_arb_share_set_values;
  wire             DE0_SOPC_clock_6_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_6_in_begins_xfer;
  wire    [  3: 0] DE0_SOPC_clock_6_in_byteenable;
  wire             DE0_SOPC_clock_6_in_end_xfer;
  wire             DE0_SOPC_clock_6_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_6_in_firsttransfer;
  wire             DE0_SOPC_clock_6_in_grant_vector;
  wire             DE0_SOPC_clock_6_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_6_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_6_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_6_in_nativeaddress;
  wire             DE0_SOPC_clock_6_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_6_in_read;
  wire    [ 31: 0] DE0_SOPC_clock_6_in_readdata_from_sa;
  reg              DE0_SOPC_clock_6_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_6_in_reset_n;
  reg              DE0_SOPC_clock_6_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_6_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_6_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_6_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_6_in_waits_for_read;
  wire             DE0_SOPC_clock_6_in_waits_for_write;
  wire             DE0_SOPC_clock_6_in_write;
  wire    [ 31: 0] DE0_SOPC_clock_6_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_6_in;
  reg              d1_DE0_SOPC_clock_6_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_6_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_6_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_6_in_end_xfer;
    end


  assign DE0_SOPC_clock_6_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_6_in));
  //assign DE0_SOPC_clock_6_in_readdata_from_sa = DE0_SOPC_clock_6_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_6_in_readdata_from_sa = DE0_SOPC_clock_6_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_6_in = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1801060) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_6_in_waitrequest_from_sa = DE0_SOPC_clock_6_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_6_in_waitrequest_from_sa = DE0_SOPC_clock_6_in_waitrequest;

  //DE0_SOPC_clock_6_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_6_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_6_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_6_in;

  //DE0_SOPC_clock_6_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_6_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_6_in_arb_share_counter_next_value = DE0_SOPC_clock_6_in_firsttransfer ? (DE0_SOPC_clock_6_in_arb_share_set_values - 1) : |DE0_SOPC_clock_6_in_arb_share_counter ? (DE0_SOPC_clock_6_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_6_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_6_in_allgrants = |DE0_SOPC_clock_6_in_grant_vector;

  //DE0_SOPC_clock_6_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_6_in_end_xfer = ~(DE0_SOPC_clock_6_in_waits_for_read | DE0_SOPC_clock_6_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in = DE0_SOPC_clock_6_in_end_xfer & (~DE0_SOPC_clock_6_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_6_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_6_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in & DE0_SOPC_clock_6_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in & ~DE0_SOPC_clock_6_in_non_bursting_master_requests);

  //DE0_SOPC_clock_6_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_6_in_arb_counter_enable)
          DE0_SOPC_clock_6_in_arb_share_counter <= DE0_SOPC_clock_6_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_6_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_6_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_6_in & ~DE0_SOPC_clock_6_in_non_bursting_master_requests))
          DE0_SOPC_clock_6_in_slavearbiterlockenable <= |DE0_SOPC_clock_6_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_6/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_6_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_6_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_6_in_slavearbiterlockenable2 = |DE0_SOPC_clock_6_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_6/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_6_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_6_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_6_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_6_in = cpu_data_master_requests_DE0_SOPC_clock_6_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_6_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_6_in_endofpacket_from_sa = DE0_SOPC_clock_6_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_6_in_endofpacket_from_sa = DE0_SOPC_clock_6_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_6_in = cpu_data_master_qualified_request_DE0_SOPC_clock_6_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_6/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_6_in = cpu_data_master_requests_DE0_SOPC_clock_6_in;

  //allow new arb cycle for DE0_SOPC_clock_6/in, which is an e_assign
  assign DE0_SOPC_clock_6_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_6_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_6_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_6_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_6_in_reset_n = reset_n;

  //DE0_SOPC_clock_6_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_6_in_firsttransfer = DE0_SOPC_clock_6_in_begins_xfer ? DE0_SOPC_clock_6_in_unreg_firsttransfer : DE0_SOPC_clock_6_in_reg_firsttransfer;

  //DE0_SOPC_clock_6_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_6_in_unreg_firsttransfer = ~(DE0_SOPC_clock_6_in_slavearbiterlockenable & DE0_SOPC_clock_6_in_any_continuerequest);

  //DE0_SOPC_clock_6_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_6_in_begins_xfer)
          DE0_SOPC_clock_6_in_reg_firsttransfer <= DE0_SOPC_clock_6_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_6_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_6_in_beginbursttransfer_internal = DE0_SOPC_clock_6_in_begins_xfer;

  //DE0_SOPC_clock_6_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_6_in_read = cpu_data_master_granted_DE0_SOPC_clock_6_in & cpu_data_master_read;

  //DE0_SOPC_clock_6_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_6_in_write = cpu_data_master_granted_DE0_SOPC_clock_6_in & cpu_data_master_write;

  assign shifted_address_to_DE0_SOPC_clock_6_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_6_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_address = shifted_address_to_DE0_SOPC_clock_6_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_6_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_6_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_6_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_6_in_end_xfer <= DE0_SOPC_clock_6_in_end_xfer;
    end


  //DE0_SOPC_clock_6_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_6_in_waits_for_read = DE0_SOPC_clock_6_in_in_a_read_cycle & DE0_SOPC_clock_6_in_waitrequest_from_sa;

  //DE0_SOPC_clock_6_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_6_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_6_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_6_in_in_a_read_cycle;

  //DE0_SOPC_clock_6_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_6_in_waits_for_write = DE0_SOPC_clock_6_in_in_a_write_cycle & DE0_SOPC_clock_6_in_waitrequest_from_sa;

  //DE0_SOPC_clock_6_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_6_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_6_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_6_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_6_in_counter = 0;
  //DE0_SOPC_clock_6_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_6_in_byteenable = (cpu_data_master_granted_DE0_SOPC_clock_6_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_6/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_6_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_6_out_address,
                                          DE0_SOPC_clock_6_out_byteenable,
                                          DE0_SOPC_clock_6_out_granted_dma_control_port_slave,
                                          DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave,
                                          DE0_SOPC_clock_6_out_read,
                                          DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave,
                                          DE0_SOPC_clock_6_out_requests_dma_control_port_slave,
                                          DE0_SOPC_clock_6_out_write,
                                          DE0_SOPC_clock_6_out_writedata,
                                          clk,
                                          d1_dma_control_port_slave_end_xfer,
                                          dma_control_port_slave_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_6_out_address_to_slave,
                                          DE0_SOPC_clock_6_out_readdata,
                                          DE0_SOPC_clock_6_out_reset_n,
                                          DE0_SOPC_clock_6_out_waitrequest
                                       )
;

  output  [  4: 0] DE0_SOPC_clock_6_out_address_to_slave;
  output  [ 31: 0] DE0_SOPC_clock_6_out_readdata;
  output           DE0_SOPC_clock_6_out_reset_n;
  output           DE0_SOPC_clock_6_out_waitrequest;
  input   [  4: 0] DE0_SOPC_clock_6_out_address;
  input   [  3: 0] DE0_SOPC_clock_6_out_byteenable;
  input            DE0_SOPC_clock_6_out_granted_dma_control_port_slave;
  input            DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave;
  input            DE0_SOPC_clock_6_out_read;
  input            DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave;
  input            DE0_SOPC_clock_6_out_requests_dma_control_port_slave;
  input            DE0_SOPC_clock_6_out_write;
  input   [ 31: 0] DE0_SOPC_clock_6_out_writedata;
  input            clk;
  input            d1_dma_control_port_slave_end_xfer;
  input   [ 23: 0] dma_control_port_slave_readdata_from_sa;
  input            reset_n;

  reg     [  4: 0] DE0_SOPC_clock_6_out_address_last_time;
  wire    [  4: 0] DE0_SOPC_clock_6_out_address_to_slave;
  reg     [  3: 0] DE0_SOPC_clock_6_out_byteenable_last_time;
  reg              DE0_SOPC_clock_6_out_read_last_time;
  wire    [ 31: 0] DE0_SOPC_clock_6_out_readdata;
  wire             DE0_SOPC_clock_6_out_reset_n;
  wire             DE0_SOPC_clock_6_out_run;
  wire             DE0_SOPC_clock_6_out_waitrequest;
  reg              DE0_SOPC_clock_6_out_write_last_time;
  reg     [ 31: 0] DE0_SOPC_clock_6_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave | ~(DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write) | (1 & ~d1_dma_control_port_slave_end_xfer & (DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write)))) & ((~DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave | ~(DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write) | (1 & ~d1_dma_control_port_slave_end_xfer & (DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_6_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_6_out_address_to_slave = DE0_SOPC_clock_6_out_address;

  //DE0_SOPC_clock_6/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_6_out_readdata = dma_control_port_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_6_out_waitrequest = ~DE0_SOPC_clock_6_out_run;

  //DE0_SOPC_clock_6_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_6_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_6_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_6_out_address_last_time <= DE0_SOPC_clock_6_out_address;
    end


  //DE0_SOPC_clock_6/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_6_out_waitrequest & (DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write);
    end


  //DE0_SOPC_clock_6_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_6_out_address != DE0_SOPC_clock_6_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_6_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_6_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_6_out_byteenable_last_time <= DE0_SOPC_clock_6_out_byteenable;
    end


  //DE0_SOPC_clock_6_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_6_out_byteenable != DE0_SOPC_clock_6_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_6_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_6_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_6_out_read_last_time <= DE0_SOPC_clock_6_out_read;
    end


  //DE0_SOPC_clock_6_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_6_out_read != DE0_SOPC_clock_6_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_6_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_6_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_6_out_write_last_time <= DE0_SOPC_clock_6_out_write;
    end


  //DE0_SOPC_clock_6_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_6_out_write != DE0_SOPC_clock_6_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_6_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_6_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_6_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_6_out_writedata_last_time <= DE0_SOPC_clock_6_out_writedata;
    end


  //DE0_SOPC_clock_6_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_6_out_writedata != DE0_SOPC_clock_6_out_writedata_last_time) & DE0_SOPC_clock_6_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_6_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_7_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_7_in_endofpacket,
                                         DE0_SOPC_clock_7_in_readdata,
                                         DE0_SOPC_clock_7_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_7_in_address,
                                         DE0_SOPC_clock_7_in_byteenable,
                                         DE0_SOPC_clock_7_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_7_in_nativeaddress,
                                         DE0_SOPC_clock_7_in_read,
                                         DE0_SOPC_clock_7_in_readdata_from_sa,
                                         DE0_SOPC_clock_7_in_reset_n,
                                         DE0_SOPC_clock_7_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_7_in_write,
                                         DE0_SOPC_clock_7_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_7_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_7_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_7_in,
                                         d1_DE0_SOPC_clock_7_in_end_xfer
                                      )
;

  output  [  3: 0] DE0_SOPC_clock_7_in_address;
  output  [  1: 0] DE0_SOPC_clock_7_in_byteenable;
  output           DE0_SOPC_clock_7_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_7_in_nativeaddress;
  output           DE0_SOPC_clock_7_in_read;
  output  [ 15: 0] DE0_SOPC_clock_7_in_readdata_from_sa;
  output           DE0_SOPC_clock_7_in_reset_n;
  output           DE0_SOPC_clock_7_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_7_in_write;
  output  [ 15: 0] DE0_SOPC_clock_7_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_7_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_7_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_7_in;
  output           d1_DE0_SOPC_clock_7_in_end_xfer;
  input            DE0_SOPC_clock_7_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_7_in_readdata;
  input            DE0_SOPC_clock_7_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] DE0_SOPC_clock_7_in_address;
  wire             DE0_SOPC_clock_7_in_allgrants;
  wire             DE0_SOPC_clock_7_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_7_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_7_in_any_continuerequest;
  wire             DE0_SOPC_clock_7_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_7_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_7_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_7_in_arb_share_set_values;
  wire             DE0_SOPC_clock_7_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_7_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_7_in_byteenable;
  wire             DE0_SOPC_clock_7_in_end_xfer;
  wire             DE0_SOPC_clock_7_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_7_in_firsttransfer;
  wire             DE0_SOPC_clock_7_in_grant_vector;
  wire             DE0_SOPC_clock_7_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_7_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_7_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_7_in_nativeaddress;
  wire             DE0_SOPC_clock_7_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_7_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_7_in_readdata_from_sa;
  reg              DE0_SOPC_clock_7_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_7_in_reset_n;
  reg              DE0_SOPC_clock_7_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_7_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_7_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_7_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_7_in_waits_for_read;
  wire             DE0_SOPC_clock_7_in_waits_for_write;
  wire             DE0_SOPC_clock_7_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_7_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_7_in;
  reg              d1_DE0_SOPC_clock_7_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_7_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_7_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_7_in_end_xfer;
    end


  assign DE0_SOPC_clock_7_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_7_in));
  //assign DE0_SOPC_clock_7_in_readdata_from_sa = DE0_SOPC_clock_7_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_7_in_readdata_from_sa = DE0_SOPC_clock_7_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_7_in = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1801080) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_7_in_waitrequest_from_sa = DE0_SOPC_clock_7_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_7_in_waitrequest_from_sa = DE0_SOPC_clock_7_in_waitrequest;

  //DE0_SOPC_clock_7_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_7_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_7_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_7_in;

  //DE0_SOPC_clock_7_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_7_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_7_in_arb_share_counter_next_value = DE0_SOPC_clock_7_in_firsttransfer ? (DE0_SOPC_clock_7_in_arb_share_set_values - 1) : |DE0_SOPC_clock_7_in_arb_share_counter ? (DE0_SOPC_clock_7_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_7_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_7_in_allgrants = |DE0_SOPC_clock_7_in_grant_vector;

  //DE0_SOPC_clock_7_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_7_in_end_xfer = ~(DE0_SOPC_clock_7_in_waits_for_read | DE0_SOPC_clock_7_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in = DE0_SOPC_clock_7_in_end_xfer & (~DE0_SOPC_clock_7_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_7_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_7_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in & DE0_SOPC_clock_7_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in & ~DE0_SOPC_clock_7_in_non_bursting_master_requests);

  //DE0_SOPC_clock_7_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_7_in_arb_counter_enable)
          DE0_SOPC_clock_7_in_arb_share_counter <= DE0_SOPC_clock_7_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_7_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_7_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_7_in & ~DE0_SOPC_clock_7_in_non_bursting_master_requests))
          DE0_SOPC_clock_7_in_slavearbiterlockenable <= |DE0_SOPC_clock_7_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_7/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_7_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_7_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_7_in_slavearbiterlockenable2 = |DE0_SOPC_clock_7_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_7/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_7_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_7_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_7_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_7_in = cpu_data_master_requests_DE0_SOPC_clock_7_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_7_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_7_in_endofpacket_from_sa = DE0_SOPC_clock_7_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_7_in_endofpacket_from_sa = DE0_SOPC_clock_7_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_7_in = cpu_data_master_qualified_request_DE0_SOPC_clock_7_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_7/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_7_in = cpu_data_master_requests_DE0_SOPC_clock_7_in;

  //allow new arb cycle for DE0_SOPC_clock_7/in, which is an e_assign
  assign DE0_SOPC_clock_7_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_7_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_7_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_7_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_7_in_reset_n = reset_n;

  //DE0_SOPC_clock_7_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_7_in_firsttransfer = DE0_SOPC_clock_7_in_begins_xfer ? DE0_SOPC_clock_7_in_unreg_firsttransfer : DE0_SOPC_clock_7_in_reg_firsttransfer;

  //DE0_SOPC_clock_7_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_7_in_unreg_firsttransfer = ~(DE0_SOPC_clock_7_in_slavearbiterlockenable & DE0_SOPC_clock_7_in_any_continuerequest);

  //DE0_SOPC_clock_7_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_7_in_begins_xfer)
          DE0_SOPC_clock_7_in_reg_firsttransfer <= DE0_SOPC_clock_7_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_7_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_7_in_beginbursttransfer_internal = DE0_SOPC_clock_7_in_begins_xfer;

  //DE0_SOPC_clock_7_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_7_in_read = cpu_data_master_granted_DE0_SOPC_clock_7_in & cpu_data_master_read;

  //DE0_SOPC_clock_7_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_7_in_write = cpu_data_master_granted_DE0_SOPC_clock_7_in & cpu_data_master_write;

  assign shifted_address_to_DE0_SOPC_clock_7_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_7_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_address = shifted_address_to_DE0_SOPC_clock_7_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_7_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_7_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_7_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_7_in_end_xfer <= DE0_SOPC_clock_7_in_end_xfer;
    end


  //DE0_SOPC_clock_7_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_7_in_waits_for_read = DE0_SOPC_clock_7_in_in_a_read_cycle & DE0_SOPC_clock_7_in_waitrequest_from_sa;

  //DE0_SOPC_clock_7_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_7_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_7_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_7_in_in_a_read_cycle;

  //DE0_SOPC_clock_7_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_7_in_waits_for_write = DE0_SOPC_clock_7_in_in_a_write_cycle & DE0_SOPC_clock_7_in_waitrequest_from_sa;

  //DE0_SOPC_clock_7_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_7_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_7_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_7_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_7_in_counter = 0;
  //DE0_SOPC_clock_7_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_7_in_byteenable = (cpu_data_master_granted_DE0_SOPC_clock_7_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_7/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_7_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_7_out_address,
                                          DE0_SOPC_clock_7_out_byteenable,
                                          DE0_SOPC_clock_7_out_granted_uart2_s1,
                                          DE0_SOPC_clock_7_out_qualified_request_uart2_s1,
                                          DE0_SOPC_clock_7_out_read,
                                          DE0_SOPC_clock_7_out_read_data_valid_uart2_s1,
                                          DE0_SOPC_clock_7_out_requests_uart2_s1,
                                          DE0_SOPC_clock_7_out_write,
                                          DE0_SOPC_clock_7_out_writedata,
                                          clk,
                                          d1_uart2_s1_end_xfer,
                                          reset_n,
                                          uart2_s1_readdata_from_sa,

                                         // outputs:
                                          DE0_SOPC_clock_7_out_address_to_slave,
                                          DE0_SOPC_clock_7_out_readdata,
                                          DE0_SOPC_clock_7_out_reset_n,
                                          DE0_SOPC_clock_7_out_waitrequest
                                       )
;

  output  [  3: 0] DE0_SOPC_clock_7_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_7_out_readdata;
  output           DE0_SOPC_clock_7_out_reset_n;
  output           DE0_SOPC_clock_7_out_waitrequest;
  input   [  3: 0] DE0_SOPC_clock_7_out_address;
  input   [  1: 0] DE0_SOPC_clock_7_out_byteenable;
  input            DE0_SOPC_clock_7_out_granted_uart2_s1;
  input            DE0_SOPC_clock_7_out_qualified_request_uart2_s1;
  input            DE0_SOPC_clock_7_out_read;
  input            DE0_SOPC_clock_7_out_read_data_valid_uart2_s1;
  input            DE0_SOPC_clock_7_out_requests_uart2_s1;
  input            DE0_SOPC_clock_7_out_write;
  input   [ 15: 0] DE0_SOPC_clock_7_out_writedata;
  input            clk;
  input            d1_uart2_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] uart2_s1_readdata_from_sa;

  reg     [  3: 0] DE0_SOPC_clock_7_out_address_last_time;
  wire    [  3: 0] DE0_SOPC_clock_7_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_7_out_byteenable_last_time;
  reg              DE0_SOPC_clock_7_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_7_out_readdata;
  wire             DE0_SOPC_clock_7_out_reset_n;
  wire             DE0_SOPC_clock_7_out_run;
  wire             DE0_SOPC_clock_7_out_waitrequest;
  reg              DE0_SOPC_clock_7_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_7_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_3;
  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & ((~DE0_SOPC_clock_7_out_qualified_request_uart2_s1 | ~(DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write) | (1 & ~d1_uart2_s1_end_xfer & (DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write)))) & ((~DE0_SOPC_clock_7_out_qualified_request_uart2_s1 | ~(DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write) | (1 & ~d1_uart2_s1_end_xfer & (DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_7_out_run = r_3;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_7_out_address_to_slave = DE0_SOPC_clock_7_out_address;

  //DE0_SOPC_clock_7/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_7_out_readdata = uart2_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_7_out_waitrequest = ~DE0_SOPC_clock_7_out_run;

  //DE0_SOPC_clock_7_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_7_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_7_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_7_out_address_last_time <= DE0_SOPC_clock_7_out_address;
    end


  //DE0_SOPC_clock_7/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_7_out_waitrequest & (DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write);
    end


  //DE0_SOPC_clock_7_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_7_out_address != DE0_SOPC_clock_7_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_7_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_7_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_7_out_byteenable_last_time <= DE0_SOPC_clock_7_out_byteenable;
    end


  //DE0_SOPC_clock_7_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_7_out_byteenable != DE0_SOPC_clock_7_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_7_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_7_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_7_out_read_last_time <= DE0_SOPC_clock_7_out_read;
    end


  //DE0_SOPC_clock_7_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_7_out_read != DE0_SOPC_clock_7_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_7_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_7_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_7_out_write_last_time <= DE0_SOPC_clock_7_out_write;
    end


  //DE0_SOPC_clock_7_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_7_out_write != DE0_SOPC_clock_7_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_7_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_7_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_7_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_7_out_writedata_last_time <= DE0_SOPC_clock_7_out_writedata;
    end


  //DE0_SOPC_clock_7_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_7_out_writedata != DE0_SOPC_clock_7_out_writedata_last_time) & DE0_SOPC_clock_7_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_7_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_8_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_8_in_endofpacket,
                                         DE0_SOPC_clock_8_in_readdata,
                                         DE0_SOPC_clock_8_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_8_in_address,
                                         DE0_SOPC_clock_8_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_8_in_nativeaddress,
                                         DE0_SOPC_clock_8_in_read,
                                         DE0_SOPC_clock_8_in_readdata_from_sa,
                                         DE0_SOPC_clock_8_in_reset_n,
                                         DE0_SOPC_clock_8_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_8_in_write,
                                         DE0_SOPC_clock_8_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_8_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_8_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_8_in,
                                         d1_DE0_SOPC_clock_8_in_end_xfer
                                      )
;

  output  [  2: 0] DE0_SOPC_clock_8_in_address;
  output           DE0_SOPC_clock_8_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_8_in_nativeaddress;
  output           DE0_SOPC_clock_8_in_read;
  output  [  7: 0] DE0_SOPC_clock_8_in_readdata_from_sa;
  output           DE0_SOPC_clock_8_in_reset_n;
  output           DE0_SOPC_clock_8_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_8_in_write;
  output  [  7: 0] DE0_SOPC_clock_8_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_8_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_8_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_8_in;
  output           d1_DE0_SOPC_clock_8_in_end_xfer;
  input            DE0_SOPC_clock_8_in_endofpacket;
  input   [  7: 0] DE0_SOPC_clock_8_in_readdata;
  input            DE0_SOPC_clock_8_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  2: 0] DE0_SOPC_clock_8_in_address;
  wire             DE0_SOPC_clock_8_in_allgrants;
  wire             DE0_SOPC_clock_8_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_8_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_8_in_any_continuerequest;
  wire             DE0_SOPC_clock_8_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_8_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_8_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_8_in_arb_share_set_values;
  wire             DE0_SOPC_clock_8_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_8_in_begins_xfer;
  wire             DE0_SOPC_clock_8_in_end_xfer;
  wire             DE0_SOPC_clock_8_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_8_in_firsttransfer;
  wire             DE0_SOPC_clock_8_in_grant_vector;
  wire             DE0_SOPC_clock_8_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_8_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_8_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_8_in_nativeaddress;
  wire             DE0_SOPC_clock_8_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_8_in_pretend_byte_enable;
  wire             DE0_SOPC_clock_8_in_read;
  wire    [  7: 0] DE0_SOPC_clock_8_in_readdata_from_sa;
  reg              DE0_SOPC_clock_8_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_8_in_reset_n;
  reg              DE0_SOPC_clock_8_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_8_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_8_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_8_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_8_in_waits_for_read;
  wire             DE0_SOPC_clock_8_in_waits_for_write;
  wire             DE0_SOPC_clock_8_in_write;
  wire    [  7: 0] DE0_SOPC_clock_8_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_8_in;
  reg              d1_DE0_SOPC_clock_8_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DE0_SOPC_clock_8_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_8_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_8_in_end_xfer;
    end


  assign DE0_SOPC_clock_8_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_8_in));
  //assign DE0_SOPC_clock_8_in_readdata_from_sa = DE0_SOPC_clock_8_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_8_in_readdata_from_sa = DE0_SOPC_clock_8_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_8_in = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h18010a0) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_8_in_waitrequest_from_sa = DE0_SOPC_clock_8_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_8_in_waitrequest_from_sa = DE0_SOPC_clock_8_in_waitrequest;

  //DE0_SOPC_clock_8_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_8_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_8_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_8_in;

  //DE0_SOPC_clock_8_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_8_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_8_in_arb_share_counter_next_value = DE0_SOPC_clock_8_in_firsttransfer ? (DE0_SOPC_clock_8_in_arb_share_set_values - 1) : |DE0_SOPC_clock_8_in_arb_share_counter ? (DE0_SOPC_clock_8_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_8_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_8_in_allgrants = |DE0_SOPC_clock_8_in_grant_vector;

  //DE0_SOPC_clock_8_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_8_in_end_xfer = ~(DE0_SOPC_clock_8_in_waits_for_read | DE0_SOPC_clock_8_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in = DE0_SOPC_clock_8_in_end_xfer & (~DE0_SOPC_clock_8_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_8_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_8_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in & DE0_SOPC_clock_8_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in & ~DE0_SOPC_clock_8_in_non_bursting_master_requests);

  //DE0_SOPC_clock_8_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_8_in_arb_counter_enable)
          DE0_SOPC_clock_8_in_arb_share_counter <= DE0_SOPC_clock_8_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_8_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_8_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_8_in & ~DE0_SOPC_clock_8_in_non_bursting_master_requests))
          DE0_SOPC_clock_8_in_slavearbiterlockenable <= |DE0_SOPC_clock_8_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_8/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_8_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_8_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_8_in_slavearbiterlockenable2 = |DE0_SOPC_clock_8_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_8/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_8_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_8_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_8_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_8_in = cpu_data_master_requests_DE0_SOPC_clock_8_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_8_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_8_in_endofpacket_from_sa = DE0_SOPC_clock_8_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_8_in_endofpacket_from_sa = DE0_SOPC_clock_8_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_8_in = cpu_data_master_qualified_request_DE0_SOPC_clock_8_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_8/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_8_in = cpu_data_master_requests_DE0_SOPC_clock_8_in;

  //allow new arb cycle for DE0_SOPC_clock_8/in, which is an e_assign
  assign DE0_SOPC_clock_8_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_8_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_8_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_8_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_8_in_reset_n = reset_n;

  //DE0_SOPC_clock_8_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_8_in_firsttransfer = DE0_SOPC_clock_8_in_begins_xfer ? DE0_SOPC_clock_8_in_unreg_firsttransfer : DE0_SOPC_clock_8_in_reg_firsttransfer;

  //DE0_SOPC_clock_8_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_8_in_unreg_firsttransfer = ~(DE0_SOPC_clock_8_in_slavearbiterlockenable & DE0_SOPC_clock_8_in_any_continuerequest);

  //DE0_SOPC_clock_8_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_8_in_begins_xfer)
          DE0_SOPC_clock_8_in_reg_firsttransfer <= DE0_SOPC_clock_8_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_8_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_8_in_beginbursttransfer_internal = DE0_SOPC_clock_8_in_begins_xfer;

  //DE0_SOPC_clock_8_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_8_in_read = cpu_data_master_granted_DE0_SOPC_clock_8_in & cpu_data_master_read;

  //DE0_SOPC_clock_8_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_8_in_write = ((cpu_data_master_granted_DE0_SOPC_clock_8_in & cpu_data_master_write)) & DE0_SOPC_clock_8_in_pretend_byte_enable;

  assign shifted_address_to_DE0_SOPC_clock_8_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_8_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_address = shifted_address_to_DE0_SOPC_clock_8_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_8_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_8_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_8_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_8_in_end_xfer <= DE0_SOPC_clock_8_in_end_xfer;
    end


  //DE0_SOPC_clock_8_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_8_in_waits_for_read = DE0_SOPC_clock_8_in_in_a_read_cycle & DE0_SOPC_clock_8_in_waitrequest_from_sa;

  //DE0_SOPC_clock_8_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_8_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_8_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_8_in_in_a_read_cycle;

  //DE0_SOPC_clock_8_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_8_in_waits_for_write = DE0_SOPC_clock_8_in_in_a_write_cycle & DE0_SOPC_clock_8_in_waitrequest_from_sa;

  //DE0_SOPC_clock_8_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_8_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_8_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_8_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_8_in_counter = 0;
  //DE0_SOPC_clock_8_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_8_in_pretend_byte_enable = (cpu_data_master_granted_DE0_SOPC_clock_8_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_8/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_8_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_8_out_address,
                                          DE0_SOPC_clock_8_out_granted_SEG7_s1,
                                          DE0_SOPC_clock_8_out_qualified_request_SEG7_s1,
                                          DE0_SOPC_clock_8_out_read,
                                          DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1,
                                          DE0_SOPC_clock_8_out_requests_SEG7_s1,
                                          DE0_SOPC_clock_8_out_write,
                                          DE0_SOPC_clock_8_out_writedata,
                                          SEG7_s1_readdata_from_sa,
                                          clk,
                                          d1_SEG7_s1_end_xfer,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_8_out_address_to_slave,
                                          DE0_SOPC_clock_8_out_readdata,
                                          DE0_SOPC_clock_8_out_reset_n,
                                          DE0_SOPC_clock_8_out_waitrequest
                                       )
;

  output  [  2: 0] DE0_SOPC_clock_8_out_address_to_slave;
  output  [  7: 0] DE0_SOPC_clock_8_out_readdata;
  output           DE0_SOPC_clock_8_out_reset_n;
  output           DE0_SOPC_clock_8_out_waitrequest;
  input   [  2: 0] DE0_SOPC_clock_8_out_address;
  input            DE0_SOPC_clock_8_out_granted_SEG7_s1;
  input            DE0_SOPC_clock_8_out_qualified_request_SEG7_s1;
  input            DE0_SOPC_clock_8_out_read;
  input            DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1;
  input            DE0_SOPC_clock_8_out_requests_SEG7_s1;
  input            DE0_SOPC_clock_8_out_write;
  input   [  7: 0] DE0_SOPC_clock_8_out_writedata;
  input   [  7: 0] SEG7_s1_readdata_from_sa;
  input            clk;
  input            d1_SEG7_s1_end_xfer;
  input            reset_n;

  reg     [  2: 0] DE0_SOPC_clock_8_out_address_last_time;
  wire    [  2: 0] DE0_SOPC_clock_8_out_address_to_slave;
  reg              DE0_SOPC_clock_8_out_read_last_time;
  wire    [  7: 0] DE0_SOPC_clock_8_out_readdata;
  wire             DE0_SOPC_clock_8_out_reset_n;
  wire             DE0_SOPC_clock_8_out_run;
  wire             DE0_SOPC_clock_8_out_waitrequest;
  reg              DE0_SOPC_clock_8_out_write_last_time;
  reg     [  7: 0] DE0_SOPC_clock_8_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~DE0_SOPC_clock_8_out_qualified_request_SEG7_s1 | ~(DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write) | (1 & (DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write)))) & ((~DE0_SOPC_clock_8_out_qualified_request_SEG7_s1 | ~(DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write) | (1 & (DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_8_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_8_out_address_to_slave = DE0_SOPC_clock_8_out_address;

  //DE0_SOPC_clock_8/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_8_out_readdata = SEG7_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_8_out_waitrequest = ~DE0_SOPC_clock_8_out_run;

  //DE0_SOPC_clock_8_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_8_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_8_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_8_out_address_last_time <= DE0_SOPC_clock_8_out_address;
    end


  //DE0_SOPC_clock_8/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_8_out_waitrequest & (DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write);
    end


  //DE0_SOPC_clock_8_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_8_out_address != DE0_SOPC_clock_8_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_8_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_8_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_8_out_read_last_time <= DE0_SOPC_clock_8_out_read;
    end


  //DE0_SOPC_clock_8_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_8_out_read != DE0_SOPC_clock_8_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_8_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_8_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_8_out_write_last_time <= DE0_SOPC_clock_8_out_write;
    end


  //DE0_SOPC_clock_8_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_8_out_write != DE0_SOPC_clock_8_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_8_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_8_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_8_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_8_out_writedata_last_time <= DE0_SOPC_clock_8_out_writedata;
    end


  //DE0_SOPC_clock_8_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_8_out_writedata != DE0_SOPC_clock_8_out_writedata_last_time) & DE0_SOPC_clock_8_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_8_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SEG7_s1_arbitrator (
                            // inputs:
                             DE0_SOPC_clock_8_out_address_to_slave,
                             DE0_SOPC_clock_8_out_nativeaddress,
                             DE0_SOPC_clock_8_out_read,
                             DE0_SOPC_clock_8_out_write,
                             DE0_SOPC_clock_8_out_writedata,
                             SEG7_s1_readdata,
                             clk,
                             reset_n,

                            // outputs:
                             DE0_SOPC_clock_8_out_granted_SEG7_s1,
                             DE0_SOPC_clock_8_out_qualified_request_SEG7_s1,
                             DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1,
                             DE0_SOPC_clock_8_out_requests_SEG7_s1,
                             SEG7_s1_address,
                             SEG7_s1_read,
                             SEG7_s1_readdata_from_sa,
                             SEG7_s1_reset,
                             SEG7_s1_write,
                             SEG7_s1_writedata,
                             d1_SEG7_s1_end_xfer
                          )
;

  output           DE0_SOPC_clock_8_out_granted_SEG7_s1;
  output           DE0_SOPC_clock_8_out_qualified_request_SEG7_s1;
  output           DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1;
  output           DE0_SOPC_clock_8_out_requests_SEG7_s1;
  output  [  2: 0] SEG7_s1_address;
  output           SEG7_s1_read;
  output  [  7: 0] SEG7_s1_readdata_from_sa;
  output           SEG7_s1_reset;
  output           SEG7_s1_write;
  output  [  7: 0] SEG7_s1_writedata;
  output           d1_SEG7_s1_end_xfer;
  input   [  2: 0] DE0_SOPC_clock_8_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_8_out_nativeaddress;
  input            DE0_SOPC_clock_8_out_read;
  input            DE0_SOPC_clock_8_out_write;
  input   [  7: 0] DE0_SOPC_clock_8_out_writedata;
  input   [  7: 0] SEG7_s1_readdata;
  input            clk;
  input            reset_n;

  wire             DE0_SOPC_clock_8_out_arbiterlock;
  wire             DE0_SOPC_clock_8_out_arbiterlock2;
  wire             DE0_SOPC_clock_8_out_continuerequest;
  wire             DE0_SOPC_clock_8_out_granted_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_qualified_request_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_requests_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_saved_grant_SEG7_s1;
  wire    [  2: 0] SEG7_s1_address;
  wire             SEG7_s1_allgrants;
  wire             SEG7_s1_allow_new_arb_cycle;
  wire             SEG7_s1_any_bursting_master_saved_grant;
  wire             SEG7_s1_any_continuerequest;
  wire             SEG7_s1_arb_counter_enable;
  reg              SEG7_s1_arb_share_counter;
  wire             SEG7_s1_arb_share_counter_next_value;
  wire             SEG7_s1_arb_share_set_values;
  wire             SEG7_s1_beginbursttransfer_internal;
  wire             SEG7_s1_begins_xfer;
  wire             SEG7_s1_end_xfer;
  wire             SEG7_s1_firsttransfer;
  wire             SEG7_s1_grant_vector;
  wire             SEG7_s1_in_a_read_cycle;
  wire             SEG7_s1_in_a_write_cycle;
  wire             SEG7_s1_master_qreq_vector;
  wire             SEG7_s1_non_bursting_master_requests;
  wire             SEG7_s1_pretend_byte_enable;
  wire             SEG7_s1_read;
  wire    [  7: 0] SEG7_s1_readdata_from_sa;
  reg              SEG7_s1_reg_firsttransfer;
  wire             SEG7_s1_reset;
  reg              SEG7_s1_slavearbiterlockenable;
  wire             SEG7_s1_slavearbiterlockenable2;
  wire             SEG7_s1_unreg_firsttransfer;
  wire             SEG7_s1_waits_for_read;
  wire             SEG7_s1_waits_for_write;
  wire             SEG7_s1_write;
  wire    [  7: 0] SEG7_s1_writedata;
  reg              d1_SEG7_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SEG7_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_SEG7_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SEG7_s1_end_xfer;
    end


  assign SEG7_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_8_out_qualified_request_SEG7_s1));
  //assign SEG7_s1_readdata_from_sa = SEG7_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SEG7_s1_readdata_from_sa = SEG7_s1_readdata;

  assign DE0_SOPC_clock_8_out_requests_SEG7_s1 = (1) & (DE0_SOPC_clock_8_out_read | DE0_SOPC_clock_8_out_write);
  //SEG7_s1_arb_share_counter set values, which is an e_mux
  assign SEG7_s1_arb_share_set_values = 1;

  //SEG7_s1_non_bursting_master_requests mux, which is an e_mux
  assign SEG7_s1_non_bursting_master_requests = DE0_SOPC_clock_8_out_requests_SEG7_s1;

  //SEG7_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign SEG7_s1_any_bursting_master_saved_grant = 0;

  //SEG7_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign SEG7_s1_arb_share_counter_next_value = SEG7_s1_firsttransfer ? (SEG7_s1_arb_share_set_values - 1) : |SEG7_s1_arb_share_counter ? (SEG7_s1_arb_share_counter - 1) : 0;

  //SEG7_s1_allgrants all slave grants, which is an e_mux
  assign SEG7_s1_allgrants = |SEG7_s1_grant_vector;

  //SEG7_s1_end_xfer assignment, which is an e_assign
  assign SEG7_s1_end_xfer = ~(SEG7_s1_waits_for_read | SEG7_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_SEG7_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SEG7_s1 = SEG7_s1_end_xfer & (~SEG7_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SEG7_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign SEG7_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_SEG7_s1 & SEG7_s1_allgrants) | (end_xfer_arb_share_counter_term_SEG7_s1 & ~SEG7_s1_non_bursting_master_requests);

  //SEG7_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_s1_arb_share_counter <= 0;
      else if (SEG7_s1_arb_counter_enable)
          SEG7_s1_arb_share_counter <= SEG7_s1_arb_share_counter_next_value;
    end


  //SEG7_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_s1_slavearbiterlockenable <= 0;
      else if ((|SEG7_s1_master_qreq_vector & end_xfer_arb_share_counter_term_SEG7_s1) | (end_xfer_arb_share_counter_term_SEG7_s1 & ~SEG7_s1_non_bursting_master_requests))
          SEG7_s1_slavearbiterlockenable <= |SEG7_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_8/out SEG7/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_8_out_arbiterlock = SEG7_s1_slavearbiterlockenable & DE0_SOPC_clock_8_out_continuerequest;

  //SEG7_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SEG7_s1_slavearbiterlockenable2 = |SEG7_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_8/out SEG7/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_8_out_arbiterlock2 = SEG7_s1_slavearbiterlockenable2 & DE0_SOPC_clock_8_out_continuerequest;

  //SEG7_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign SEG7_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_8_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_8_out_continuerequest = 1;

  assign DE0_SOPC_clock_8_out_qualified_request_SEG7_s1 = DE0_SOPC_clock_8_out_requests_SEG7_s1;
  //SEG7_s1_writedata mux, which is an e_mux
  assign SEG7_s1_writedata = DE0_SOPC_clock_8_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_8_out_granted_SEG7_s1 = DE0_SOPC_clock_8_out_qualified_request_SEG7_s1;

  //DE0_SOPC_clock_8/out saved-grant SEG7/s1, which is an e_assign
  assign DE0_SOPC_clock_8_out_saved_grant_SEG7_s1 = DE0_SOPC_clock_8_out_requests_SEG7_s1;

  //allow new arb cycle for SEG7/s1, which is an e_assign
  assign SEG7_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign SEG7_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign SEG7_s1_master_qreq_vector = 1;

  //~SEG7_s1_reset assignment, which is an e_assign
  assign SEG7_s1_reset = ~reset_n;

  //SEG7_s1_firsttransfer first transaction, which is an e_assign
  assign SEG7_s1_firsttransfer = SEG7_s1_begins_xfer ? SEG7_s1_unreg_firsttransfer : SEG7_s1_reg_firsttransfer;

  //SEG7_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign SEG7_s1_unreg_firsttransfer = ~(SEG7_s1_slavearbiterlockenable & SEG7_s1_any_continuerequest);

  //SEG7_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_s1_reg_firsttransfer <= 1'b1;
      else if (SEG7_s1_begins_xfer)
          SEG7_s1_reg_firsttransfer <= SEG7_s1_unreg_firsttransfer;
    end


  //SEG7_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SEG7_s1_beginbursttransfer_internal = SEG7_s1_begins_xfer;

  //SEG7_s1_read assignment, which is an e_mux
  assign SEG7_s1_read = DE0_SOPC_clock_8_out_granted_SEG7_s1 & DE0_SOPC_clock_8_out_read;

  //SEG7_s1_write assignment, which is an e_mux
  assign SEG7_s1_write = ((DE0_SOPC_clock_8_out_granted_SEG7_s1 & DE0_SOPC_clock_8_out_write)) & SEG7_s1_pretend_byte_enable;

  //SEG7_s1_address mux, which is an e_mux
  assign SEG7_s1_address = DE0_SOPC_clock_8_out_nativeaddress;

  //d1_SEG7_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SEG7_s1_end_xfer <= 1;
      else 
        d1_SEG7_s1_end_xfer <= SEG7_s1_end_xfer;
    end


  //SEG7_s1_waits_for_read in a cycle, which is an e_mux
  assign SEG7_s1_waits_for_read = SEG7_s1_in_a_read_cycle & 0;

  //SEG7_s1_in_a_read_cycle assignment, which is an e_assign
  assign SEG7_s1_in_a_read_cycle = DE0_SOPC_clock_8_out_granted_SEG7_s1 & DE0_SOPC_clock_8_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SEG7_s1_in_a_read_cycle;

  //SEG7_s1_waits_for_write in a cycle, which is an e_mux
  assign SEG7_s1_waits_for_write = SEG7_s1_in_a_write_cycle & 0;

  //SEG7_s1_in_a_write_cycle assignment, which is an e_assign
  assign SEG7_s1_in_a_write_cycle = DE0_SOPC_clock_8_out_granted_SEG7_s1 & DE0_SOPC_clock_8_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SEG7_s1_in_a_write_cycle;

  assign wait_for_SEG7_s1_counter = 0;
  //SEG7_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign SEG7_s1_pretend_byte_enable = (DE0_SOPC_clock_8_out_granted_SEG7_s1)? {1 {1'b1}} :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SEG7/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module buttons_s1_arbitrator (
                               // inputs:
                                buttons_s1_irq,
                                buttons_s1_readdata,
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_read,
                                cpu_data_master_waitrequest,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                reset_n,

                               // outputs:
                                buttons_s1_address,
                                buttons_s1_chipselect,
                                buttons_s1_irq_from_sa,
                                buttons_s1_readdata_from_sa,
                                buttons_s1_reset_n,
                                buttons_s1_write_n,
                                buttons_s1_writedata,
                                cpu_data_master_granted_buttons_s1,
                                cpu_data_master_qualified_request_buttons_s1,
                                cpu_data_master_read_data_valid_buttons_s1,
                                cpu_data_master_requests_buttons_s1,
                                d1_buttons_s1_end_xfer
                             )
;

  output  [  1: 0] buttons_s1_address;
  output           buttons_s1_chipselect;
  output           buttons_s1_irq_from_sa;
  output  [  2: 0] buttons_s1_readdata_from_sa;
  output           buttons_s1_reset_n;
  output           buttons_s1_write_n;
  output  [  2: 0] buttons_s1_writedata;
  output           cpu_data_master_granted_buttons_s1;
  output           cpu_data_master_qualified_request_buttons_s1;
  output           cpu_data_master_read_data_valid_buttons_s1;
  output           cpu_data_master_requests_buttons_s1;
  output           d1_buttons_s1_end_xfer;
  input            buttons_s1_irq;
  input   [  2: 0] buttons_s1_readdata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] buttons_s1_address;
  wire             buttons_s1_allgrants;
  wire             buttons_s1_allow_new_arb_cycle;
  wire             buttons_s1_any_bursting_master_saved_grant;
  wire             buttons_s1_any_continuerequest;
  wire             buttons_s1_arb_counter_enable;
  reg     [  1: 0] buttons_s1_arb_share_counter;
  wire    [  1: 0] buttons_s1_arb_share_counter_next_value;
  wire    [  1: 0] buttons_s1_arb_share_set_values;
  wire             buttons_s1_beginbursttransfer_internal;
  wire             buttons_s1_begins_xfer;
  wire             buttons_s1_chipselect;
  wire             buttons_s1_end_xfer;
  wire             buttons_s1_firsttransfer;
  wire             buttons_s1_grant_vector;
  wire             buttons_s1_in_a_read_cycle;
  wire             buttons_s1_in_a_write_cycle;
  wire             buttons_s1_irq_from_sa;
  wire             buttons_s1_master_qreq_vector;
  wire             buttons_s1_non_bursting_master_requests;
  wire    [  2: 0] buttons_s1_readdata_from_sa;
  reg              buttons_s1_reg_firsttransfer;
  wire             buttons_s1_reset_n;
  reg              buttons_s1_slavearbiterlockenable;
  wire             buttons_s1_slavearbiterlockenable2;
  wire             buttons_s1_unreg_firsttransfer;
  wire             buttons_s1_waits_for_read;
  wire             buttons_s1_waits_for_write;
  wire             buttons_s1_write_n;
  wire    [  2: 0] buttons_s1_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_buttons_s1;
  wire             cpu_data_master_qualified_request_buttons_s1;
  wire             cpu_data_master_read_data_valid_buttons_s1;
  wire             cpu_data_master_requests_buttons_s1;
  wire             cpu_data_master_saved_grant_buttons_s1;
  reg              d1_buttons_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_buttons_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_buttons_s1_from_cpu_data_master;
  wire             wait_for_buttons_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~buttons_s1_end_xfer;
    end


  assign buttons_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_buttons_s1));
  //assign buttons_s1_readdata_from_sa = buttons_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign buttons_s1_readdata_from_sa = buttons_s1_readdata;

  assign cpu_data_master_requests_buttons_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18010d0) & (cpu_data_master_read | cpu_data_master_write);
  //buttons_s1_arb_share_counter set values, which is an e_mux
  assign buttons_s1_arb_share_set_values = 1;

  //buttons_s1_non_bursting_master_requests mux, which is an e_mux
  assign buttons_s1_non_bursting_master_requests = cpu_data_master_requests_buttons_s1;

  //buttons_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign buttons_s1_any_bursting_master_saved_grant = 0;

  //buttons_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign buttons_s1_arb_share_counter_next_value = buttons_s1_firsttransfer ? (buttons_s1_arb_share_set_values - 1) : |buttons_s1_arb_share_counter ? (buttons_s1_arb_share_counter - 1) : 0;

  //buttons_s1_allgrants all slave grants, which is an e_mux
  assign buttons_s1_allgrants = |buttons_s1_grant_vector;

  //buttons_s1_end_xfer assignment, which is an e_assign
  assign buttons_s1_end_xfer = ~(buttons_s1_waits_for_read | buttons_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_buttons_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_buttons_s1 = buttons_s1_end_xfer & (~buttons_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //buttons_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign buttons_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_buttons_s1 & buttons_s1_allgrants) | (end_xfer_arb_share_counter_term_buttons_s1 & ~buttons_s1_non_bursting_master_requests);

  //buttons_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_arb_share_counter <= 0;
      else if (buttons_s1_arb_counter_enable)
          buttons_s1_arb_share_counter <= buttons_s1_arb_share_counter_next_value;
    end


  //buttons_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_slavearbiterlockenable <= 0;
      else if ((|buttons_s1_master_qreq_vector & end_xfer_arb_share_counter_term_buttons_s1) | (end_xfer_arb_share_counter_term_buttons_s1 & ~buttons_s1_non_bursting_master_requests))
          buttons_s1_slavearbiterlockenable <= |buttons_s1_arb_share_counter_next_value;
    end


  //cpu/data_master buttons/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = buttons_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //buttons_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign buttons_s1_slavearbiterlockenable2 = |buttons_s1_arb_share_counter_next_value;

  //cpu/data_master buttons/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = buttons_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //buttons_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign buttons_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_buttons_s1 = cpu_data_master_requests_buttons_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //buttons_s1_writedata mux, which is an e_mux
  assign buttons_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_buttons_s1 = cpu_data_master_qualified_request_buttons_s1;

  //cpu/data_master saved-grant buttons/s1, which is an e_assign
  assign cpu_data_master_saved_grant_buttons_s1 = cpu_data_master_requests_buttons_s1;

  //allow new arb cycle for buttons/s1, which is an e_assign
  assign buttons_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign buttons_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign buttons_s1_master_qreq_vector = 1;

  //buttons_s1_reset_n assignment, which is an e_assign
  assign buttons_s1_reset_n = reset_n;

  assign buttons_s1_chipselect = cpu_data_master_granted_buttons_s1;
  //buttons_s1_firsttransfer first transaction, which is an e_assign
  assign buttons_s1_firsttransfer = buttons_s1_begins_xfer ? buttons_s1_unreg_firsttransfer : buttons_s1_reg_firsttransfer;

  //buttons_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign buttons_s1_unreg_firsttransfer = ~(buttons_s1_slavearbiterlockenable & buttons_s1_any_continuerequest);

  //buttons_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_reg_firsttransfer <= 1'b1;
      else if (buttons_s1_begins_xfer)
          buttons_s1_reg_firsttransfer <= buttons_s1_unreg_firsttransfer;
    end


  //buttons_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign buttons_s1_beginbursttransfer_internal = buttons_s1_begins_xfer;

  //~buttons_s1_write_n assignment, which is an e_mux
  assign buttons_s1_write_n = ~(cpu_data_master_granted_buttons_s1 & cpu_data_master_write);

  assign shifted_address_to_buttons_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //buttons_s1_address mux, which is an e_mux
  assign buttons_s1_address = shifted_address_to_buttons_s1_from_cpu_data_master >> 2;

  //d1_buttons_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_buttons_s1_end_xfer <= 1;
      else 
        d1_buttons_s1_end_xfer <= buttons_s1_end_xfer;
    end


  //buttons_s1_waits_for_read in a cycle, which is an e_mux
  assign buttons_s1_waits_for_read = buttons_s1_in_a_read_cycle & buttons_s1_begins_xfer;

  //buttons_s1_in_a_read_cycle assignment, which is an e_assign
  assign buttons_s1_in_a_read_cycle = cpu_data_master_granted_buttons_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = buttons_s1_in_a_read_cycle;

  //buttons_s1_waits_for_write in a cycle, which is an e_mux
  assign buttons_s1_waits_for_write = buttons_s1_in_a_write_cycle & 0;

  //buttons_s1_in_a_write_cycle assignment, which is an e_assign
  assign buttons_s1_in_a_write_cycle = cpu_data_master_granted_buttons_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = buttons_s1_in_a_write_cycle;

  assign wait_for_buttons_s1_counter = 0;
  //assign buttons_s1_irq_from_sa = buttons_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign buttons_s1_irq_from_sa = buttons_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //buttons/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1800800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1800800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~(cpu_data_master_arbiterlock);
  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dma_control_port_slave_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                                  // inputs:
                                                                                   clk,
                                                                                   data_in,
                                                                                   reset_n,

                                                                                  // outputs:
                                                                                   data_out
                                                                                )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart2_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                    // inputs:
                                                                     clk,
                                                                     data_in,
                                                                     reset_n,

                                                                    // outputs:
                                                                     data_out
                                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     DE0_SOPC_clock_0_in_readdata_from_sa,
                                     DE0_SOPC_clock_0_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_3_in_readdata_from_sa,
                                     DE0_SOPC_clock_3_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_4_in_readdata_from_sa,
                                     DE0_SOPC_clock_4_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_5_in_readdata_from_sa,
                                     DE0_SOPC_clock_5_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_6_in_readdata_from_sa,
                                     DE0_SOPC_clock_6_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_7_in_readdata_from_sa,
                                     DE0_SOPC_clock_7_in_waitrequest_from_sa,
                                     DE0_SOPC_clock_8_in_readdata_from_sa,
                                     DE0_SOPC_clock_8_in_waitrequest_from_sa,
                                     buttons_s1_irq_from_sa,
                                     buttons_s1_readdata_from_sa,
                                     cfi_flash_s1_wait_counter_eq_0,
                                     cfi_flash_s1_wait_counter_eq_1,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_sdram_s1,
                                     cpu_data_master_granted_DE0_SOPC_clock_0_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_3_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_4_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_5_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_6_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_7_in,
                                     cpu_data_master_granted_DE0_SOPC_clock_8_in,
                                     cpu_data_master_granted_buttons_s1,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_leds_s1,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_granted_switches_s1,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_timer_s1,
                                     cpu_data_master_granted_uart_s1,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_0_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_3_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_4_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_5_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_6_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_7_in,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_8_in,
                                     cpu_data_master_qualified_request_buttons_s1,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_leds_s1,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_qualified_request_switches_s1,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_timer_s1,
                                     cpu_data_master_qualified_request_uart_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in,
                                     cpu_data_master_read_data_valid_buttons_s1,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_leds_s1,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_read_data_valid_switches_s1,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_timer_s1,
                                     cpu_data_master_read_data_valid_uart_s1,
                                     cpu_data_master_requests_DE0_SOPC_clock_0_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_3_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_4_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_5_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_6_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_7_in,
                                     cpu_data_master_requests_DE0_SOPC_clock_8_in,
                                     cpu_data_master_requests_buttons_s1,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_leds_s1,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_requests_switches_s1,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_timer_s1,
                                     cpu_data_master_requests_uart_s1,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_DE0_SOPC_clock_0_in_end_xfer,
                                     d1_DE0_SOPC_clock_3_in_end_xfer,
                                     d1_DE0_SOPC_clock_4_in_end_xfer,
                                     d1_DE0_SOPC_clock_5_in_end_xfer,
                                     d1_DE0_SOPC_clock_6_in_end_xfer,
                                     d1_DE0_SOPC_clock_7_in_end_xfer,
                                     d1_DE0_SOPC_clock_8_in_end_xfer,
                                     d1_buttons_s1_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_leds_s1_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_switches_s1_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_timer_s1_end_xfer,
                                     d1_tristate_bridge_avalon_slave_end_xfer,
                                     d1_uart_s1_end_xfer,
                                     dma_control_port_slave_irq_from_sa,
                                     incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     leds_s1_readdata_from_sa,
                                     pll_cpu,
                                     pll_cpu_reset_n,
                                     registered_cpu_data_master_read_data_valid_cfi_flash_s1,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     switches_s1_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     timer_s1_irq_from_sa,
                                     timer_s1_readdata_from_sa,
                                     uart2_s1_irq_from_sa,
                                     uart_s1_irq_from_sa,
                                     uart_s1_readdata_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_irq,
                                     cpu_data_master_no_byte_enables_and_last_term,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 24: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input   [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  input            DE0_SOPC_clock_0_in_waitrequest_from_sa;
  input   [  7: 0] DE0_SOPC_clock_3_in_readdata_from_sa;
  input            DE0_SOPC_clock_3_in_waitrequest_from_sa;
  input   [  7: 0] DE0_SOPC_clock_4_in_readdata_from_sa;
  input            DE0_SOPC_clock_4_in_waitrequest_from_sa;
  input   [  7: 0] DE0_SOPC_clock_5_in_readdata_from_sa;
  input            DE0_SOPC_clock_5_in_waitrequest_from_sa;
  input   [ 31: 0] DE0_SOPC_clock_6_in_readdata_from_sa;
  input            DE0_SOPC_clock_6_in_waitrequest_from_sa;
  input   [ 15: 0] DE0_SOPC_clock_7_in_readdata_from_sa;
  input            DE0_SOPC_clock_7_in_waitrequest_from_sa;
  input   [  7: 0] DE0_SOPC_clock_8_in_readdata_from_sa;
  input            DE0_SOPC_clock_8_in_waitrequest_from_sa;
  input            buttons_s1_irq_from_sa;
  input   [  2: 0] buttons_s1_readdata_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            cfi_flash_s1_wait_counter_eq_1;
  input            clk;
  input   [ 24: 0] cpu_data_master_address;
  input   [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sdram_s1;
  input            cpu_data_master_granted_DE0_SOPC_clock_0_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_3_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_4_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_5_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_6_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_7_in;
  input            cpu_data_master_granted_DE0_SOPC_clock_8_in;
  input            cpu_data_master_granted_buttons_s1;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_leds_s1;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_granted_switches_s1;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_timer_s1;
  input            cpu_data_master_granted_uart_s1;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_3_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_4_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_5_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_6_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_7_in;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_8_in;
  input            cpu_data_master_qualified_request_buttons_s1;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_leds_s1;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_qualified_request_switches_s1;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_timer_s1;
  input            cpu_data_master_qualified_request_uart_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in;
  input            cpu_data_master_read_data_valid_buttons_s1;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_leds_s1;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_read_data_valid_switches_s1;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_timer_s1;
  input            cpu_data_master_read_data_valid_uart_s1;
  input            cpu_data_master_requests_DE0_SOPC_clock_0_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_3_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_4_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_5_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_6_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_7_in;
  input            cpu_data_master_requests_DE0_SOPC_clock_8_in;
  input            cpu_data_master_requests_buttons_s1;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_leds_s1;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_requests_switches_s1;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_timer_s1;
  input            cpu_data_master_requests_uart_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_DE0_SOPC_clock_0_in_end_xfer;
  input            d1_DE0_SOPC_clock_3_in_end_xfer;
  input            d1_DE0_SOPC_clock_4_in_end_xfer;
  input            d1_DE0_SOPC_clock_5_in_end_xfer;
  input            d1_DE0_SOPC_clock_6_in_end_xfer;
  input            d1_DE0_SOPC_clock_7_in_end_xfer;
  input            d1_DE0_SOPC_clock_8_in_end_xfer;
  input            d1_buttons_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_leds_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_switches_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input            d1_uart_s1_end_xfer;
  input            dma_control_port_slave_irq_from_sa;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [  9: 0] leds_s1_readdata_from_sa;
  input            pll_cpu;
  input            pll_cpu_reset_n;
  input            registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [  8: 0] switches_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_s1_irq_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;
  input            uart2_s1_irq_from_sa;
  input            uart_s1_irq_from_sa;
  input   [ 15: 0] uart_s1_readdata_from_sa;

  wire    [ 24: 0] cpu_data_master_address_to_slave;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              cpu_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             pll_cpu_dma_control_port_slave_irq_from_sa;
  wire             pll_cpu_uart2_s1_irq_from_sa;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~cpu_data_master_requests_DE0_SOPC_clock_0_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_3_in | ~cpu_data_master_requests_DE0_SOPC_clock_3_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_3_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_3_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_3_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_3_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_4_in | ~cpu_data_master_requests_DE0_SOPC_clock_4_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_4_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_4_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_4_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_4_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_5_in | ~cpu_data_master_requests_DE0_SOPC_clock_5_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_5_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_5_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_5_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_5_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_6_in | ~cpu_data_master_requests_DE0_SOPC_clock_6_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_6_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_6_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_6_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_6_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_7_in | ~cpu_data_master_requests_DE0_SOPC_clock_7_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_7_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_7_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_7_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_7_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_8_in | ~cpu_data_master_requests_DE0_SOPC_clock_8_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_8_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_8_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_8_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_8_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_buttons_s1 | ~cpu_data_master_requests_buttons_s1) & ((~cpu_data_master_qualified_request_buttons_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_buttons_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_requests_leds_s1) & ((~cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sdram_s1 | (cpu_data_master_read_data_valid_sdram_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sdram_s1) & (cpu_data_master_granted_sdram_s1 | ~cpu_data_master_qualified_request_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_read | (cpu_data_master_read_data_valid_sdram_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_write | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & ((~cpu_data_master_qualified_request_switches_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_switches_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_requests_timer_s1) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (cpu_data_master_qualified_request_cfi_flash_s1 | (registered_cpu_data_master_read_data_valid_cfi_flash_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_cfi_flash_s1) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_cfi_flash_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & cfi_flash_s1_wait_counter_eq_1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & ((~cpu_data_master_qualified_request_uart_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & 1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_uart_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & 1 & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[24 : 0];

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_DE0_SOPC_clock_0_in}} | DE0_SOPC_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_3_in}} | DE0_SOPC_clock_3_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_4_in}} | DE0_SOPC_clock_4_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_5_in}} | DE0_SOPC_clock_5_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_6_in}} | DE0_SOPC_clock_6_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_7_in}} | DE0_SOPC_clock_7_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_8_in}} | DE0_SOPC_clock_8_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_DE0_SOPC_clock_0_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_3_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_4_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_5_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_6_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_7_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_DE0_SOPC_clock_8_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_buttons_s1}} | buttons_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_leds_s1}} | leds_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_switches_s1}} | switches_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_timer_s1}} | timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_uart_s1}} | uart_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    pll_cpu_uart2_s1_irq_from_sa,
    pll_cpu_dma_control_port_slave_irq_from_sa,
    uart_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    buttons_s1_irq_from_sa,
    timer_s1_irq_from_sa};

  //dma_control_port_slave_irq_from_sa from clk_0 to pll_cpu
  dma_control_port_slave_irq_from_sa_clock_crossing_cpu_data_master_module dma_control_port_slave_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (dma_control_port_slave_irq_from_sa),
      .data_out (pll_cpu_dma_control_port_slave_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_data_master_requests_sdram_s1)? (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) :
    (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_sdram_s1 & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_granted_sdram_s1 & cpu_data_master_write & 1 & 1 & ~sdram_s1_waitrequest_from_sa) |
    (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    cpu_data_master_read_data_valid_cfi_flash_s1 |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_data_master_requests_sdram_s1)? sdram_s1_readdata_from_sa :
    incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    (~(cpu_data_master_dbs_address[1]))? cpu_data_master_writedata[15 : 0] :
    (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sdram_s1)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_data_master_requests_sdram_s1 & ~cpu_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //uart2_s1_irq_from_sa from clk_0 to pll_cpu
  uart2_s1_irq_from_sa_clock_crossing_cpu_data_master_module uart2_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (uart2_s1_irq_from_sa),
      .data_out (pll_cpu_uart2_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            cfi_flash_s1_wait_counter_eq_0,
                                            cfi_flash_s1_wait_counter_eq_1,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_sdram_s1,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_sdram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_sdram_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_sdram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_sdram_s1_end_xfer,
                                            d1_tristate_bridge_avalon_slave_end_xfer,
                                            incoming_data_to_and_from_the_cfi_flash,
                                            reset_n,
                                            sdram_s1_readdata_from_sa,
                                            sdram_s1_waitrequest_from_sa,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 24: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            cfi_flash_s1_wait_counter_eq_1;
  input            clk;
  input   [ 24: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_sdram_s1;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_sdram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_sdram_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_sdram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_1 & r_2 & r_3;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_sdram_s1 | (cpu_instruction_master_read_data_valid_sdram_s1 & cpu_instruction_master_dbs_address[1]) | ~cpu_instruction_master_requests_sdram_s1) & (cpu_instruction_master_granted_sdram_s1 | ~cpu_instruction_master_qualified_request_sdram_s1) & ((~cpu_instruction_master_qualified_request_sdram_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_sdram_s1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | (cpu_instruction_master_read_data_valid_cfi_flash_s1 & cpu_instruction_master_dbs_address[1]) | ~cpu_instruction_master_requests_cfi_flash_s1) & (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_cfi_flash_s1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[24 : 0];

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~cpu_instruction_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_requests_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_instruction_master_requests_sdram_s1)? sdram_s1_readdata_from_sa :
    incoming_data_to_and_from_the_cfi_flash;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sdram_s1)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_instruction_master_read_data_valid_sdram_s1 |
    cpu_instruction_master_read_data_valid_cfi_flash_s1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dma_control_port_slave_arbitrator (
                                           // inputs:
                                            DE0_SOPC_clock_6_out_address_to_slave,
                                            DE0_SOPC_clock_6_out_nativeaddress,
                                            DE0_SOPC_clock_6_out_read,
                                            DE0_SOPC_clock_6_out_write,
                                            DE0_SOPC_clock_6_out_writedata,
                                            clk,
                                            dma_control_port_slave_irq,
                                            dma_control_port_slave_readdata,
                                            dma_control_port_slave_readyfordata,
                                            reset_n,

                                           // outputs:
                                            DE0_SOPC_clock_6_out_granted_dma_control_port_slave,
                                            DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave,
                                            DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave,
                                            DE0_SOPC_clock_6_out_requests_dma_control_port_slave,
                                            d1_dma_control_port_slave_end_xfer,
                                            dma_control_port_slave_address,
                                            dma_control_port_slave_chipselect,
                                            dma_control_port_slave_irq_from_sa,
                                            dma_control_port_slave_readdata_from_sa,
                                            dma_control_port_slave_readyfordata_from_sa,
                                            dma_control_port_slave_reset_n,
                                            dma_control_port_slave_write_n,
                                            dma_control_port_slave_writedata
                                         )
;

  output           DE0_SOPC_clock_6_out_granted_dma_control_port_slave;
  output           DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave;
  output           DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave;
  output           DE0_SOPC_clock_6_out_requests_dma_control_port_slave;
  output           d1_dma_control_port_slave_end_xfer;
  output  [  2: 0] dma_control_port_slave_address;
  output           dma_control_port_slave_chipselect;
  output           dma_control_port_slave_irq_from_sa;
  output  [ 23: 0] dma_control_port_slave_readdata_from_sa;
  output           dma_control_port_slave_readyfordata_from_sa;
  output           dma_control_port_slave_reset_n;
  output           dma_control_port_slave_write_n;
  output  [ 23: 0] dma_control_port_slave_writedata;
  input   [  4: 0] DE0_SOPC_clock_6_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_6_out_nativeaddress;
  input            DE0_SOPC_clock_6_out_read;
  input            DE0_SOPC_clock_6_out_write;
  input   [ 31: 0] DE0_SOPC_clock_6_out_writedata;
  input            clk;
  input            dma_control_port_slave_irq;
  input   [ 23: 0] dma_control_port_slave_readdata;
  input            dma_control_port_slave_readyfordata;
  input            reset_n;

  wire             DE0_SOPC_clock_6_out_arbiterlock;
  wire             DE0_SOPC_clock_6_out_arbiterlock2;
  wire             DE0_SOPC_clock_6_out_continuerequest;
  wire             DE0_SOPC_clock_6_out_granted_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_requests_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_saved_grant_dma_control_port_slave;
  reg              d1_dma_control_port_slave_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  2: 0] dma_control_port_slave_address;
  wire             dma_control_port_slave_allgrants;
  wire             dma_control_port_slave_allow_new_arb_cycle;
  wire             dma_control_port_slave_any_bursting_master_saved_grant;
  wire             dma_control_port_slave_any_continuerequest;
  wire             dma_control_port_slave_arb_counter_enable;
  reg              dma_control_port_slave_arb_share_counter;
  wire             dma_control_port_slave_arb_share_counter_next_value;
  wire             dma_control_port_slave_arb_share_set_values;
  wire             dma_control_port_slave_beginbursttransfer_internal;
  wire             dma_control_port_slave_begins_xfer;
  wire             dma_control_port_slave_chipselect;
  wire             dma_control_port_slave_end_xfer;
  wire             dma_control_port_slave_firsttransfer;
  wire             dma_control_port_slave_grant_vector;
  wire             dma_control_port_slave_in_a_read_cycle;
  wire             dma_control_port_slave_in_a_write_cycle;
  wire             dma_control_port_slave_irq_from_sa;
  wire             dma_control_port_slave_master_qreq_vector;
  wire             dma_control_port_slave_non_bursting_master_requests;
  wire    [ 23: 0] dma_control_port_slave_readdata_from_sa;
  wire             dma_control_port_slave_readyfordata_from_sa;
  reg              dma_control_port_slave_reg_firsttransfer;
  wire             dma_control_port_slave_reset_n;
  reg              dma_control_port_slave_slavearbiterlockenable;
  wire             dma_control_port_slave_slavearbiterlockenable2;
  wire             dma_control_port_slave_unreg_firsttransfer;
  wire             dma_control_port_slave_waits_for_read;
  wire             dma_control_port_slave_waits_for_write;
  wire             dma_control_port_slave_write_n;
  wire    [ 23: 0] dma_control_port_slave_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_dma_control_port_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_dma_control_port_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~dma_control_port_slave_end_xfer;
    end


  assign dma_control_port_slave_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave));
  //assign dma_control_port_slave_readdata_from_sa = dma_control_port_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign dma_control_port_slave_readdata_from_sa = dma_control_port_slave_readdata;

  assign DE0_SOPC_clock_6_out_requests_dma_control_port_slave = (1) & (DE0_SOPC_clock_6_out_read | DE0_SOPC_clock_6_out_write);
  //assign dma_control_port_slave_readyfordata_from_sa = dma_control_port_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign dma_control_port_slave_readyfordata_from_sa = dma_control_port_slave_readyfordata;

  //dma_control_port_slave_arb_share_counter set values, which is an e_mux
  assign dma_control_port_slave_arb_share_set_values = 1;

  //dma_control_port_slave_non_bursting_master_requests mux, which is an e_mux
  assign dma_control_port_slave_non_bursting_master_requests = DE0_SOPC_clock_6_out_requests_dma_control_port_slave;

  //dma_control_port_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign dma_control_port_slave_any_bursting_master_saved_grant = 0;

  //dma_control_port_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign dma_control_port_slave_arb_share_counter_next_value = dma_control_port_slave_firsttransfer ? (dma_control_port_slave_arb_share_set_values - 1) : |dma_control_port_slave_arb_share_counter ? (dma_control_port_slave_arb_share_counter - 1) : 0;

  //dma_control_port_slave_allgrants all slave grants, which is an e_mux
  assign dma_control_port_slave_allgrants = |dma_control_port_slave_grant_vector;

  //dma_control_port_slave_end_xfer assignment, which is an e_assign
  assign dma_control_port_slave_end_xfer = ~(dma_control_port_slave_waits_for_read | dma_control_port_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_dma_control_port_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_dma_control_port_slave = dma_control_port_slave_end_xfer & (~dma_control_port_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //dma_control_port_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign dma_control_port_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_dma_control_port_slave & dma_control_port_slave_allgrants) | (end_xfer_arb_share_counter_term_dma_control_port_slave & ~dma_control_port_slave_non_bursting_master_requests);

  //dma_control_port_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_control_port_slave_arb_share_counter <= 0;
      else if (dma_control_port_slave_arb_counter_enable)
          dma_control_port_slave_arb_share_counter <= dma_control_port_slave_arb_share_counter_next_value;
    end


  //dma_control_port_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_control_port_slave_slavearbiterlockenable <= 0;
      else if ((|dma_control_port_slave_master_qreq_vector & end_xfer_arb_share_counter_term_dma_control_port_slave) | (end_xfer_arb_share_counter_term_dma_control_port_slave & ~dma_control_port_slave_non_bursting_master_requests))
          dma_control_port_slave_slavearbiterlockenable <= |dma_control_port_slave_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_6/out dma/control_port_slave arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_6_out_arbiterlock = dma_control_port_slave_slavearbiterlockenable & DE0_SOPC_clock_6_out_continuerequest;

  //dma_control_port_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign dma_control_port_slave_slavearbiterlockenable2 = |dma_control_port_slave_arb_share_counter_next_value;

  //DE0_SOPC_clock_6/out dma/control_port_slave arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_6_out_arbiterlock2 = dma_control_port_slave_slavearbiterlockenable2 & DE0_SOPC_clock_6_out_continuerequest;

  //dma_control_port_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign dma_control_port_slave_any_continuerequest = 1;

  //DE0_SOPC_clock_6_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_6_out_continuerequest = 1;

  assign DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave = DE0_SOPC_clock_6_out_requests_dma_control_port_slave;
  //dma_control_port_slave_writedata mux, which is an e_mux
  assign dma_control_port_slave_writedata = DE0_SOPC_clock_6_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_6_out_granted_dma_control_port_slave = DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave;

  //DE0_SOPC_clock_6/out saved-grant dma/control_port_slave, which is an e_assign
  assign DE0_SOPC_clock_6_out_saved_grant_dma_control_port_slave = DE0_SOPC_clock_6_out_requests_dma_control_port_slave;

  //allow new arb cycle for dma/control_port_slave, which is an e_assign
  assign dma_control_port_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign dma_control_port_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign dma_control_port_slave_master_qreq_vector = 1;

  //dma_control_port_slave_reset_n assignment, which is an e_assign
  assign dma_control_port_slave_reset_n = reset_n;

  assign dma_control_port_slave_chipselect = DE0_SOPC_clock_6_out_granted_dma_control_port_slave;
  //dma_control_port_slave_firsttransfer first transaction, which is an e_assign
  assign dma_control_port_slave_firsttransfer = dma_control_port_slave_begins_xfer ? dma_control_port_slave_unreg_firsttransfer : dma_control_port_slave_reg_firsttransfer;

  //dma_control_port_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign dma_control_port_slave_unreg_firsttransfer = ~(dma_control_port_slave_slavearbiterlockenable & dma_control_port_slave_any_continuerequest);

  //dma_control_port_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_control_port_slave_reg_firsttransfer <= 1'b1;
      else if (dma_control_port_slave_begins_xfer)
          dma_control_port_slave_reg_firsttransfer <= dma_control_port_slave_unreg_firsttransfer;
    end


  //dma_control_port_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign dma_control_port_slave_beginbursttransfer_internal = dma_control_port_slave_begins_xfer;

  //~dma_control_port_slave_write_n assignment, which is an e_mux
  assign dma_control_port_slave_write_n = ~(DE0_SOPC_clock_6_out_granted_dma_control_port_slave & DE0_SOPC_clock_6_out_write);

  //dma_control_port_slave_address mux, which is an e_mux
  assign dma_control_port_slave_address = DE0_SOPC_clock_6_out_nativeaddress;

  //d1_dma_control_port_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_dma_control_port_slave_end_xfer <= 1;
      else 
        d1_dma_control_port_slave_end_xfer <= dma_control_port_slave_end_xfer;
    end


  //dma_control_port_slave_waits_for_read in a cycle, which is an e_mux
  assign dma_control_port_slave_waits_for_read = dma_control_port_slave_in_a_read_cycle & dma_control_port_slave_begins_xfer;

  //dma_control_port_slave_in_a_read_cycle assignment, which is an e_assign
  assign dma_control_port_slave_in_a_read_cycle = DE0_SOPC_clock_6_out_granted_dma_control_port_slave & DE0_SOPC_clock_6_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = dma_control_port_slave_in_a_read_cycle;

  //dma_control_port_slave_waits_for_write in a cycle, which is an e_mux
  assign dma_control_port_slave_waits_for_write = dma_control_port_slave_in_a_write_cycle & dma_control_port_slave_begins_xfer;

  //dma_control_port_slave_in_a_write_cycle assignment, which is an e_assign
  assign dma_control_port_slave_in_a_write_cycle = DE0_SOPC_clock_6_out_granted_dma_control_port_slave & DE0_SOPC_clock_6_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = dma_control_port_slave_in_a_write_cycle;

  assign wait_for_dma_control_port_slave_counter = 0;
  //assign dma_control_port_slave_irq_from_sa = dma_control_port_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign dma_control_port_slave_irq_from_sa = dma_control_port_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //dma/control_port_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dma_read_master_arbitrator (
                                    // inputs:
                                     DE0_SOPC_clock_1_in_endofpacket_from_sa,
                                     DE0_SOPC_clock_1_in_readdata_from_sa,
                                     DE0_SOPC_clock_1_in_waitrequest_from_sa,
                                     clk,
                                     d1_DE0_SOPC_clock_1_in_end_xfer,
                                     dma_read_master_address,
                                     dma_read_master_chipselect,
                                     dma_read_master_flush,
                                     dma_read_master_granted_DE0_SOPC_clock_1_in,
                                     dma_read_master_qualified_request_DE0_SOPC_clock_1_in,
                                     dma_read_master_read_data_valid_DE0_SOPC_clock_1_in,
                                     dma_read_master_read_n,
                                     dma_read_master_requests_DE0_SOPC_clock_1_in,
                                     reset_n,

                                    // outputs:
                                     dma_read_master_address_to_slave,
                                     dma_read_master_endofpacket,
                                     dma_read_master_latency_counter,
                                     dma_read_master_readdata,
                                     dma_read_master_readdatavalid,
                                     dma_read_master_waitrequest
                                  )
;

  output  [ 23: 0] dma_read_master_address_to_slave;
  output           dma_read_master_endofpacket;
  output           dma_read_master_latency_counter;
  output  [ 15: 0] dma_read_master_readdata;
  output           dma_read_master_readdatavalid;
  output           dma_read_master_waitrequest;
  input            DE0_SOPC_clock_1_in_endofpacket_from_sa;
  input   [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  input            DE0_SOPC_clock_1_in_waitrequest_from_sa;
  input            clk;
  input            d1_DE0_SOPC_clock_1_in_end_xfer;
  input   [ 23: 0] dma_read_master_address;
  input            dma_read_master_chipselect;
  input            dma_read_master_flush;
  input            dma_read_master_granted_DE0_SOPC_clock_1_in;
  input            dma_read_master_qualified_request_DE0_SOPC_clock_1_in;
  input            dma_read_master_read_data_valid_DE0_SOPC_clock_1_in;
  input            dma_read_master_read_n;
  input            dma_read_master_requests_DE0_SOPC_clock_1_in;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 23: 0] dma_read_master_address_last_time;
  wire    [ 23: 0] dma_read_master_address_to_slave;
  reg              dma_read_master_chipselect_last_time;
  wire             dma_read_master_endofpacket;
  wire             dma_read_master_flush_qualified;
  wire             dma_read_master_latency_counter;
  reg              dma_read_master_read_n_last_time;
  wire    [ 15: 0] dma_read_master_readdata;
  wire             dma_read_master_readdatavalid;
  wire             dma_read_master_run;
  reg              dma_read_master_run_delayed;
  wire             dma_read_master_waitrequest;
  wire             pre_flush_dma_read_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (dma_read_master_qualified_request_DE0_SOPC_clock_1_in | ~dma_read_master_requests_DE0_SOPC_clock_1_in) & ((~dma_read_master_qualified_request_DE0_SOPC_clock_1_in | ~dma_read_master_chipselect | (1 & ~DE0_SOPC_clock_1_in_waitrequest_from_sa & dma_read_master_chipselect)));

  //cascaded wait assignment, which is an e_assign
  assign dma_read_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign dma_read_master_address_to_slave = {1'b1,
    dma_read_master_address[22 : 0]};

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_dma_read_master_readdatavalid = 0;

  //run delay, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_read_master_run_delayed <= 0;
      else 
        dma_read_master_run_delayed <= dma_read_master_run;
    end


  //The Flushificator, which is an e_assign
  assign dma_read_master_flush_qualified = dma_read_master_flush && dma_read_master_run_delayed;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign dma_read_master_readdatavalid = 0 |
    (pre_flush_dma_read_master_readdatavalid & ~dma_read_master_flush_qualified) |
    dma_read_master_read_data_valid_DE0_SOPC_clock_1_in;

  //dma/read_master readdata mux, which is an e_mux
  assign dma_read_master_readdata = DE0_SOPC_clock_1_in_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign dma_read_master_waitrequest = ~dma_read_master_run;

  //latent max counter, which is an e_assign
  assign dma_read_master_latency_counter = 0;

  //mux dma_read_master_endofpacket, which is an e_mux
  assign dma_read_master_endofpacket = DE0_SOPC_clock_1_in_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //dma_read_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_read_master_address_last_time <= 0;
      else 
        dma_read_master_address_last_time <= dma_read_master_address;
    end


  //dma/read_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= dma_read_master_waitrequest & dma_read_master_chipselect;
    end


  //dma_read_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_read_master_address != dma_read_master_address_last_time))
        begin
          $write("%0d ns: dma_read_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //dma_read_master_chipselect check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_read_master_chipselect_last_time <= 0;
      else 
        dma_read_master_chipselect_last_time <= dma_read_master_chipselect;
    end


  //dma_read_master_chipselect matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_read_master_chipselect != dma_read_master_chipselect_last_time))
        begin
          $write("%0d ns: dma_read_master_chipselect did not heed wait!!!", $time);
          $stop;
        end
    end


  //~dma_read_master_read_n check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_read_master_read_n_last_time <= ~0;
      else 
        dma_read_master_read_n_last_time <= dma_read_master_read_n;
    end


  //~dma_read_master_read_n matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (~dma_read_master_read_n != ~dma_read_master_read_n_last_time))
        begin
          $write("%0d ns: ~dma_read_master_read_n did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dma_write_master_arbitrator (
                                     // inputs:
                                      DE0_SOPC_clock_2_in_endofpacket_from_sa,
                                      DE0_SOPC_clock_2_in_waitrequest_from_sa,
                                      clk,
                                      d1_DE0_SOPC_clock_2_in_end_xfer,
                                      dma_write_master_address,
                                      dma_write_master_byteenable,
                                      dma_write_master_chipselect,
                                      dma_write_master_granted_DE0_SOPC_clock_2_in,
                                      dma_write_master_qualified_request_DE0_SOPC_clock_2_in,
                                      dma_write_master_requests_DE0_SOPC_clock_2_in,
                                      dma_write_master_write_n,
                                      dma_write_master_writedata,
                                      reset_n,

                                     // outputs:
                                      dma_write_master_address_to_slave,
                                      dma_write_master_endofpacket,
                                      dma_write_master_waitrequest
                                   )
;

  output  [ 23: 0] dma_write_master_address_to_slave;
  output           dma_write_master_endofpacket;
  output           dma_write_master_waitrequest;
  input            DE0_SOPC_clock_2_in_endofpacket_from_sa;
  input            DE0_SOPC_clock_2_in_waitrequest_from_sa;
  input            clk;
  input            d1_DE0_SOPC_clock_2_in_end_xfer;
  input   [ 23: 0] dma_write_master_address;
  input   [  1: 0] dma_write_master_byteenable;
  input            dma_write_master_chipselect;
  input            dma_write_master_granted_DE0_SOPC_clock_2_in;
  input            dma_write_master_qualified_request_DE0_SOPC_clock_2_in;
  input            dma_write_master_requests_DE0_SOPC_clock_2_in;
  input            dma_write_master_write_n;
  input   [ 15: 0] dma_write_master_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 23: 0] dma_write_master_address_last_time;
  wire    [ 23: 0] dma_write_master_address_to_slave;
  reg     [  1: 0] dma_write_master_byteenable_last_time;
  reg              dma_write_master_chipselect_last_time;
  wire             dma_write_master_endofpacket;
  wire             dma_write_master_run;
  wire             dma_write_master_waitrequest;
  reg              dma_write_master_write_n_last_time;
  reg     [ 15: 0] dma_write_master_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~dma_write_master_qualified_request_DE0_SOPC_clock_2_in | ~dma_write_master_chipselect | (1 & ~DE0_SOPC_clock_2_in_waitrequest_from_sa & dma_write_master_chipselect)));

  //cascaded wait assignment, which is an e_assign
  assign dma_write_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign dma_write_master_address_to_slave = {1'b1,
    dma_write_master_address[22 : 0]};

  //actual waitrequest port, which is an e_assign
  assign dma_write_master_waitrequest = ~dma_write_master_run;

  //mux dma_write_master_endofpacket, which is an e_mux
  assign dma_write_master_endofpacket = DE0_SOPC_clock_2_in_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //dma_write_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_write_master_address_last_time <= 0;
      else 
        dma_write_master_address_last_time <= dma_write_master_address;
    end


  //dma/write_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= dma_write_master_waitrequest & dma_write_master_chipselect;
    end


  //dma_write_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_write_master_address != dma_write_master_address_last_time))
        begin
          $write("%0d ns: dma_write_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //dma_write_master_chipselect check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_write_master_chipselect_last_time <= 0;
      else 
        dma_write_master_chipselect_last_time <= dma_write_master_chipselect;
    end


  //dma_write_master_chipselect matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_write_master_chipselect != dma_write_master_chipselect_last_time))
        begin
          $write("%0d ns: dma_write_master_chipselect did not heed wait!!!", $time);
          $stop;
        end
    end


  //dma_write_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_write_master_byteenable_last_time <= 0;
      else 
        dma_write_master_byteenable_last_time <= dma_write_master_byteenable;
    end


  //dma_write_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_write_master_byteenable != dma_write_master_byteenable_last_time))
        begin
          $write("%0d ns: dma_write_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //~dma_write_master_write_n check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_write_master_write_n_last_time <= ~0;
      else 
        dma_write_master_write_n_last_time <= dma_write_master_write_n;
    end


  //~dma_write_master_write_n matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (~dma_write_master_write_n != ~dma_write_master_write_n_last_time))
        begin
          $write("%0d ns: ~dma_write_master_write_n did not heed wait!!!", $time);
          $stop;
        end
    end


  //dma_write_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_write_master_writedata_last_time <= 0;
      else 
        dma_write_master_writedata_last_time <= dma_write_master_writedata;
    end


  //dma_write_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (dma_write_master_writedata != dma_write_master_writedata_last_time) & (~dma_write_master_write_n & dma_write_master_chipselect))
        begin
          $write("%0d ns: dma_write_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_read,
                                                 cpu_data_master_waitrequest,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801120) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_display_control_slave_arbitrator (
                                              // inputs:
                                               DE0_SOPC_clock_4_out_address_to_slave,
                                               DE0_SOPC_clock_4_out_nativeaddress,
                                               DE0_SOPC_clock_4_out_read,
                                               DE0_SOPC_clock_4_out_write,
                                               DE0_SOPC_clock_4_out_writedata,
                                               clk,
                                               lcd_display_control_slave_readdata,
                                               reset_n,

                                              // outputs:
                                               DE0_SOPC_clock_4_out_granted_lcd_display_control_slave,
                                               DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave,
                                               DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave,
                                               DE0_SOPC_clock_4_out_requests_lcd_display_control_slave,
                                               d1_lcd_display_control_slave_end_xfer,
                                               lcd_display_control_slave_address,
                                               lcd_display_control_slave_begintransfer,
                                               lcd_display_control_slave_read,
                                               lcd_display_control_slave_readdata_from_sa,
                                               lcd_display_control_slave_wait_counter_eq_0,
                                               lcd_display_control_slave_write,
                                               lcd_display_control_slave_writedata
                                            )
;

  output           DE0_SOPC_clock_4_out_granted_lcd_display_control_slave;
  output           DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave;
  output           DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave;
  output           DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;
  output           d1_lcd_display_control_slave_end_xfer;
  output  [  1: 0] lcd_display_control_slave_address;
  output           lcd_display_control_slave_begintransfer;
  output           lcd_display_control_slave_read;
  output  [  7: 0] lcd_display_control_slave_readdata_from_sa;
  output           lcd_display_control_slave_wait_counter_eq_0;
  output           lcd_display_control_slave_write;
  output  [  7: 0] lcd_display_control_slave_writedata;
  input   [  1: 0] DE0_SOPC_clock_4_out_address_to_slave;
  input   [  1: 0] DE0_SOPC_clock_4_out_nativeaddress;
  input            DE0_SOPC_clock_4_out_read;
  input            DE0_SOPC_clock_4_out_write;
  input   [  7: 0] DE0_SOPC_clock_4_out_writedata;
  input            clk;
  input   [  7: 0] lcd_display_control_slave_readdata;
  input            reset_n;

  wire             DE0_SOPC_clock_4_out_arbiterlock;
  wire             DE0_SOPC_clock_4_out_arbiterlock2;
  wire             DE0_SOPC_clock_4_out_continuerequest;
  wire             DE0_SOPC_clock_4_out_granted_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_saved_grant_lcd_display_control_slave;
  reg              d1_lcd_display_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_display_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_display_control_slave_address;
  wire             lcd_display_control_slave_allgrants;
  wire             lcd_display_control_slave_allow_new_arb_cycle;
  wire             lcd_display_control_slave_any_bursting_master_saved_grant;
  wire             lcd_display_control_slave_any_continuerequest;
  wire             lcd_display_control_slave_arb_counter_enable;
  reg              lcd_display_control_slave_arb_share_counter;
  wire             lcd_display_control_slave_arb_share_counter_next_value;
  wire             lcd_display_control_slave_arb_share_set_values;
  wire             lcd_display_control_slave_beginbursttransfer_internal;
  wire             lcd_display_control_slave_begins_xfer;
  wire             lcd_display_control_slave_begintransfer;
  wire    [  5: 0] lcd_display_control_slave_counter_load_value;
  wire             lcd_display_control_slave_end_xfer;
  wire             lcd_display_control_slave_firsttransfer;
  wire             lcd_display_control_slave_grant_vector;
  wire             lcd_display_control_slave_in_a_read_cycle;
  wire             lcd_display_control_slave_in_a_write_cycle;
  wire             lcd_display_control_slave_master_qreq_vector;
  wire             lcd_display_control_slave_non_bursting_master_requests;
  wire             lcd_display_control_slave_pretend_byte_enable;
  wire             lcd_display_control_slave_read;
  wire    [  7: 0] lcd_display_control_slave_readdata_from_sa;
  reg              lcd_display_control_slave_reg_firsttransfer;
  reg              lcd_display_control_slave_slavearbiterlockenable;
  wire             lcd_display_control_slave_slavearbiterlockenable2;
  wire             lcd_display_control_slave_unreg_firsttransfer;
  reg     [  5: 0] lcd_display_control_slave_wait_counter;
  wire             lcd_display_control_slave_wait_counter_eq_0;
  wire             lcd_display_control_slave_waits_for_read;
  wire             lcd_display_control_slave_waits_for_write;
  wire             lcd_display_control_slave_write;
  wire    [  7: 0] lcd_display_control_slave_writedata;
  wire             wait_for_lcd_display_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_display_control_slave_end_xfer;
    end


  assign lcd_display_control_slave_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave));
  //assign lcd_display_control_slave_readdata_from_sa = lcd_display_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_display_control_slave_readdata_from_sa = lcd_display_control_slave_readdata;

  assign DE0_SOPC_clock_4_out_requests_lcd_display_control_slave = (1) & (DE0_SOPC_clock_4_out_read | DE0_SOPC_clock_4_out_write);
  //lcd_display_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_display_control_slave_arb_share_set_values = 1;

  //lcd_display_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_display_control_slave_non_bursting_master_requests = DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;

  //lcd_display_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_display_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_display_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_display_control_slave_arb_share_counter_next_value = lcd_display_control_slave_firsttransfer ? (lcd_display_control_slave_arb_share_set_values - 1) : |lcd_display_control_slave_arb_share_counter ? (lcd_display_control_slave_arb_share_counter - 1) : 0;

  //lcd_display_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_display_control_slave_allgrants = |lcd_display_control_slave_grant_vector;

  //lcd_display_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_display_control_slave_end_xfer = ~(lcd_display_control_slave_waits_for_read | lcd_display_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_display_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_display_control_slave = lcd_display_control_slave_end_xfer & (~lcd_display_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_display_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_display_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_display_control_slave & lcd_display_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_display_control_slave & ~lcd_display_control_slave_non_bursting_master_requests);

  //lcd_display_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_arb_share_counter <= 0;
      else if (lcd_display_control_slave_arb_counter_enable)
          lcd_display_control_slave_arb_share_counter <= lcd_display_control_slave_arb_share_counter_next_value;
    end


  //lcd_display_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_display_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_display_control_slave) | (end_xfer_arb_share_counter_term_lcd_display_control_slave & ~lcd_display_control_slave_non_bursting_master_requests))
          lcd_display_control_slave_slavearbiterlockenable <= |lcd_display_control_slave_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_4/out lcd_display/control_slave arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_4_out_arbiterlock = lcd_display_control_slave_slavearbiterlockenable & DE0_SOPC_clock_4_out_continuerequest;

  //lcd_display_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_display_control_slave_slavearbiterlockenable2 = |lcd_display_control_slave_arb_share_counter_next_value;

  //DE0_SOPC_clock_4/out lcd_display/control_slave arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_4_out_arbiterlock2 = lcd_display_control_slave_slavearbiterlockenable2 & DE0_SOPC_clock_4_out_continuerequest;

  //lcd_display_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_display_control_slave_any_continuerequest = 1;

  //DE0_SOPC_clock_4_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_4_out_continuerequest = 1;

  assign DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave = DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;
  //lcd_display_control_slave_writedata mux, which is an e_mux
  assign lcd_display_control_slave_writedata = DE0_SOPC_clock_4_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_4_out_granted_lcd_display_control_slave = DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave;

  //DE0_SOPC_clock_4/out saved-grant lcd_display/control_slave, which is an e_assign
  assign DE0_SOPC_clock_4_out_saved_grant_lcd_display_control_slave = DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;

  //allow new arb cycle for lcd_display/control_slave, which is an e_assign
  assign lcd_display_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_display_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_display_control_slave_master_qreq_vector = 1;

  assign lcd_display_control_slave_begintransfer = lcd_display_control_slave_begins_xfer;
  //lcd_display_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_display_control_slave_firsttransfer = lcd_display_control_slave_begins_xfer ? lcd_display_control_slave_unreg_firsttransfer : lcd_display_control_slave_reg_firsttransfer;

  //lcd_display_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_display_control_slave_unreg_firsttransfer = ~(lcd_display_control_slave_slavearbiterlockenable & lcd_display_control_slave_any_continuerequest);

  //lcd_display_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_display_control_slave_begins_xfer)
          lcd_display_control_slave_reg_firsttransfer <= lcd_display_control_slave_unreg_firsttransfer;
    end


  //lcd_display_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_display_control_slave_beginbursttransfer_internal = lcd_display_control_slave_begins_xfer;

  //lcd_display_control_slave_read assignment, which is an e_mux
  assign lcd_display_control_slave_read = ((DE0_SOPC_clock_4_out_granted_lcd_display_control_slave & DE0_SOPC_clock_4_out_read))& ~lcd_display_control_slave_begins_xfer & (lcd_display_control_slave_wait_counter < 13);

  //lcd_display_control_slave_write assignment, which is an e_mux
  assign lcd_display_control_slave_write = ((DE0_SOPC_clock_4_out_granted_lcd_display_control_slave & DE0_SOPC_clock_4_out_write)) & ~lcd_display_control_slave_begins_xfer & (lcd_display_control_slave_wait_counter >= 13) & (lcd_display_control_slave_wait_counter < 26) & lcd_display_control_slave_pretend_byte_enable;

  //lcd_display_control_slave_address mux, which is an e_mux
  assign lcd_display_control_slave_address = DE0_SOPC_clock_4_out_nativeaddress;

  //d1_lcd_display_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_display_control_slave_end_xfer <= 1;
      else 
        d1_lcd_display_control_slave_end_xfer <= lcd_display_control_slave_end_xfer;
    end


  //lcd_display_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_display_control_slave_waits_for_read = lcd_display_control_slave_in_a_read_cycle & wait_for_lcd_display_control_slave_counter;

  //lcd_display_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_display_control_slave_in_a_read_cycle = DE0_SOPC_clock_4_out_granted_lcd_display_control_slave & DE0_SOPC_clock_4_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_display_control_slave_in_a_read_cycle;

  //lcd_display_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_display_control_slave_waits_for_write = lcd_display_control_slave_in_a_write_cycle & wait_for_lcd_display_control_slave_counter;

  //lcd_display_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_display_control_slave_in_a_write_cycle = DE0_SOPC_clock_4_out_granted_lcd_display_control_slave & DE0_SOPC_clock_4_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_display_control_slave_in_a_write_cycle;

  assign lcd_display_control_slave_wait_counter_eq_0 = lcd_display_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_display_control_slave_wait_counter <= 0;
      else 
        lcd_display_control_slave_wait_counter <= lcd_display_control_slave_counter_load_value;
    end


  assign lcd_display_control_slave_counter_load_value = ((lcd_display_control_slave_in_a_write_cycle & lcd_display_control_slave_begins_xfer))? 37 :
    ((lcd_display_control_slave_in_a_read_cycle & lcd_display_control_slave_begins_xfer))? 24 :
    (~lcd_display_control_slave_wait_counter_eq_0)? lcd_display_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_display_control_slave_counter = lcd_display_control_slave_begins_xfer | ~lcd_display_control_slave_wait_counter_eq_0;
  //lcd_display_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_display_control_slave_pretend_byte_enable = (DE0_SOPC_clock_4_out_granted_lcd_display_control_slave)? {1 {1'b1}} :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_display/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_pwm_s1_arbitrator (
                               // inputs:
                                DE0_SOPC_clock_5_out_address_to_slave,
                                DE0_SOPC_clock_5_out_nativeaddress,
                                DE0_SOPC_clock_5_out_read,
                                DE0_SOPC_clock_5_out_write,
                                DE0_SOPC_clock_5_out_writedata,
                                clk,
                                led_pwm_s1_readdata,
                                reset_n,

                               // outputs:
                                DE0_SOPC_clock_5_out_granted_led_pwm_s1,
                                DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1,
                                DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1,
                                DE0_SOPC_clock_5_out_requests_led_pwm_s1,
                                d1_led_pwm_s1_end_xfer,
                                led_pwm_s1_address,
                                led_pwm_s1_chipselect,
                                led_pwm_s1_readdata_from_sa,
                                led_pwm_s1_reset_n,
                                led_pwm_s1_write_n,
                                led_pwm_s1_writedata
                             )
;

  output           DE0_SOPC_clock_5_out_granted_led_pwm_s1;
  output           DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1;
  output           DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1;
  output           DE0_SOPC_clock_5_out_requests_led_pwm_s1;
  output           d1_led_pwm_s1_end_xfer;
  output  [  1: 0] led_pwm_s1_address;
  output           led_pwm_s1_chipselect;
  output  [  7: 0] led_pwm_s1_readdata_from_sa;
  output           led_pwm_s1_reset_n;
  output           led_pwm_s1_write_n;
  output  [  7: 0] led_pwm_s1_writedata;
  input   [  1: 0] DE0_SOPC_clock_5_out_address_to_slave;
  input   [  1: 0] DE0_SOPC_clock_5_out_nativeaddress;
  input            DE0_SOPC_clock_5_out_read;
  input            DE0_SOPC_clock_5_out_write;
  input   [  7: 0] DE0_SOPC_clock_5_out_writedata;
  input            clk;
  input   [  7: 0] led_pwm_s1_readdata;
  input            reset_n;

  wire             DE0_SOPC_clock_5_out_arbiterlock;
  wire             DE0_SOPC_clock_5_out_arbiterlock2;
  wire             DE0_SOPC_clock_5_out_continuerequest;
  wire             DE0_SOPC_clock_5_out_granted_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_requests_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_saved_grant_led_pwm_s1;
  reg              d1_led_pwm_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_pwm_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_pwm_s1_address;
  wire             led_pwm_s1_allgrants;
  wire             led_pwm_s1_allow_new_arb_cycle;
  wire             led_pwm_s1_any_bursting_master_saved_grant;
  wire             led_pwm_s1_any_continuerequest;
  wire             led_pwm_s1_arb_counter_enable;
  reg              led_pwm_s1_arb_share_counter;
  wire             led_pwm_s1_arb_share_counter_next_value;
  wire             led_pwm_s1_arb_share_set_values;
  wire             led_pwm_s1_beginbursttransfer_internal;
  wire             led_pwm_s1_begins_xfer;
  wire             led_pwm_s1_chipselect;
  wire             led_pwm_s1_end_xfer;
  wire             led_pwm_s1_firsttransfer;
  wire             led_pwm_s1_grant_vector;
  wire             led_pwm_s1_in_a_read_cycle;
  wire             led_pwm_s1_in_a_write_cycle;
  wire             led_pwm_s1_master_qreq_vector;
  wire             led_pwm_s1_non_bursting_master_requests;
  wire             led_pwm_s1_pretend_byte_enable;
  wire    [  7: 0] led_pwm_s1_readdata_from_sa;
  reg              led_pwm_s1_reg_firsttransfer;
  wire             led_pwm_s1_reset_n;
  reg              led_pwm_s1_slavearbiterlockenable;
  wire             led_pwm_s1_slavearbiterlockenable2;
  wire             led_pwm_s1_unreg_firsttransfer;
  wire             led_pwm_s1_waits_for_read;
  wire             led_pwm_s1_waits_for_write;
  wire             led_pwm_s1_write_n;
  wire    [  7: 0] led_pwm_s1_writedata;
  wire             wait_for_led_pwm_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led_pwm_s1_end_xfer;
    end


  assign led_pwm_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1));
  //assign led_pwm_s1_readdata_from_sa = led_pwm_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led_pwm_s1_readdata_from_sa = led_pwm_s1_readdata;

  assign DE0_SOPC_clock_5_out_requests_led_pwm_s1 = (1) & (DE0_SOPC_clock_5_out_read | DE0_SOPC_clock_5_out_write);
  //led_pwm_s1_arb_share_counter set values, which is an e_mux
  assign led_pwm_s1_arb_share_set_values = 1;

  //led_pwm_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_pwm_s1_non_bursting_master_requests = DE0_SOPC_clock_5_out_requests_led_pwm_s1;

  //led_pwm_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_pwm_s1_any_bursting_master_saved_grant = 0;

  //led_pwm_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_pwm_s1_arb_share_counter_next_value = led_pwm_s1_firsttransfer ? (led_pwm_s1_arb_share_set_values - 1) : |led_pwm_s1_arb_share_counter ? (led_pwm_s1_arb_share_counter - 1) : 0;

  //led_pwm_s1_allgrants all slave grants, which is an e_mux
  assign led_pwm_s1_allgrants = |led_pwm_s1_grant_vector;

  //led_pwm_s1_end_xfer assignment, which is an e_assign
  assign led_pwm_s1_end_xfer = ~(led_pwm_s1_waits_for_read | led_pwm_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_pwm_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_pwm_s1 = led_pwm_s1_end_xfer & (~led_pwm_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_pwm_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_pwm_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_pwm_s1 & led_pwm_s1_allgrants) | (end_xfer_arb_share_counter_term_led_pwm_s1 & ~led_pwm_s1_non_bursting_master_requests);

  //led_pwm_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pwm_s1_arb_share_counter <= 0;
      else if (led_pwm_s1_arb_counter_enable)
          led_pwm_s1_arb_share_counter <= led_pwm_s1_arb_share_counter_next_value;
    end


  //led_pwm_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pwm_s1_slavearbiterlockenable <= 0;
      else if ((|led_pwm_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_pwm_s1) | (end_xfer_arb_share_counter_term_led_pwm_s1 & ~led_pwm_s1_non_bursting_master_requests))
          led_pwm_s1_slavearbiterlockenable <= |led_pwm_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_5/out led_pwm/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_5_out_arbiterlock = led_pwm_s1_slavearbiterlockenable & DE0_SOPC_clock_5_out_continuerequest;

  //led_pwm_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_pwm_s1_slavearbiterlockenable2 = |led_pwm_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_5/out led_pwm/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_5_out_arbiterlock2 = led_pwm_s1_slavearbiterlockenable2 & DE0_SOPC_clock_5_out_continuerequest;

  //led_pwm_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_pwm_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_5_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_5_out_continuerequest = 1;

  assign DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1 = DE0_SOPC_clock_5_out_requests_led_pwm_s1;
  //led_pwm_s1_writedata mux, which is an e_mux
  assign led_pwm_s1_writedata = DE0_SOPC_clock_5_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_5_out_granted_led_pwm_s1 = DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1;

  //DE0_SOPC_clock_5/out saved-grant led_pwm/s1, which is an e_assign
  assign DE0_SOPC_clock_5_out_saved_grant_led_pwm_s1 = DE0_SOPC_clock_5_out_requests_led_pwm_s1;

  //allow new arb cycle for led_pwm/s1, which is an e_assign
  assign led_pwm_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_pwm_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_pwm_s1_master_qreq_vector = 1;

  //led_pwm_s1_reset_n assignment, which is an e_assign
  assign led_pwm_s1_reset_n = reset_n;

  assign led_pwm_s1_chipselect = DE0_SOPC_clock_5_out_granted_led_pwm_s1;
  //led_pwm_s1_firsttransfer first transaction, which is an e_assign
  assign led_pwm_s1_firsttransfer = led_pwm_s1_begins_xfer ? led_pwm_s1_unreg_firsttransfer : led_pwm_s1_reg_firsttransfer;

  //led_pwm_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_pwm_s1_unreg_firsttransfer = ~(led_pwm_s1_slavearbiterlockenable & led_pwm_s1_any_continuerequest);

  //led_pwm_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pwm_s1_reg_firsttransfer <= 1'b1;
      else if (led_pwm_s1_begins_xfer)
          led_pwm_s1_reg_firsttransfer <= led_pwm_s1_unreg_firsttransfer;
    end


  //led_pwm_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_pwm_s1_beginbursttransfer_internal = led_pwm_s1_begins_xfer;

  //~led_pwm_s1_write_n assignment, which is an e_mux
  assign led_pwm_s1_write_n = ~(((DE0_SOPC_clock_5_out_granted_led_pwm_s1 & DE0_SOPC_clock_5_out_write)) & led_pwm_s1_pretend_byte_enable);

  //led_pwm_s1_address mux, which is an e_mux
  assign led_pwm_s1_address = DE0_SOPC_clock_5_out_nativeaddress;

  //d1_led_pwm_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_pwm_s1_end_xfer <= 1;
      else 
        d1_led_pwm_s1_end_xfer <= led_pwm_s1_end_xfer;
    end


  //led_pwm_s1_waits_for_read in a cycle, which is an e_mux
  assign led_pwm_s1_waits_for_read = led_pwm_s1_in_a_read_cycle & led_pwm_s1_begins_xfer;

  //led_pwm_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_pwm_s1_in_a_read_cycle = DE0_SOPC_clock_5_out_granted_led_pwm_s1 & DE0_SOPC_clock_5_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_pwm_s1_in_a_read_cycle;

  //led_pwm_s1_waits_for_write in a cycle, which is an e_mux
  assign led_pwm_s1_waits_for_write = led_pwm_s1_in_a_write_cycle & 0;

  //led_pwm_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_pwm_s1_in_a_write_cycle = DE0_SOPC_clock_5_out_granted_led_pwm_s1 & DE0_SOPC_clock_5_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_pwm_s1_in_a_write_cycle;

  assign wait_for_led_pwm_s1_counter = 0;
  //led_pwm_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign led_pwm_s1_pretend_byte_enable = (DE0_SOPC_clock_5_out_granted_led_pwm_s1)? {1 {1'b1}} :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_pwm/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module leds_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_data_master_address_to_slave,
                             cpu_data_master_read,
                             cpu_data_master_waitrequest,
                             cpu_data_master_write,
                             cpu_data_master_writedata,
                             leds_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_data_master_granted_leds_s1,
                             cpu_data_master_qualified_request_leds_s1,
                             cpu_data_master_read_data_valid_leds_s1,
                             cpu_data_master_requests_leds_s1,
                             d1_leds_s1_end_xfer,
                             leds_s1_address,
                             leds_s1_chipselect,
                             leds_s1_readdata_from_sa,
                             leds_s1_reset_n,
                             leds_s1_write_n,
                             leds_s1_writedata
                          )
;

  output           cpu_data_master_granted_leds_s1;
  output           cpu_data_master_qualified_request_leds_s1;
  output           cpu_data_master_read_data_valid_leds_s1;
  output           cpu_data_master_requests_leds_s1;
  output           d1_leds_s1_end_xfer;
  output  [  1: 0] leds_s1_address;
  output           leds_s1_chipselect;
  output  [  9: 0] leds_s1_readdata_from_sa;
  output           leds_s1_reset_n;
  output           leds_s1_write_n;
  output  [  9: 0] leds_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [  9: 0] leds_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_leds_s1;
  wire             cpu_data_master_qualified_request_leds_s1;
  wire             cpu_data_master_read_data_valid_leds_s1;
  wire             cpu_data_master_requests_leds_s1;
  wire             cpu_data_master_saved_grant_leds_s1;
  reg              d1_leds_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_leds_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_allgrants;
  wire             leds_s1_allow_new_arb_cycle;
  wire             leds_s1_any_bursting_master_saved_grant;
  wire             leds_s1_any_continuerequest;
  wire             leds_s1_arb_counter_enable;
  reg     [  1: 0] leds_s1_arb_share_counter;
  wire    [  1: 0] leds_s1_arb_share_counter_next_value;
  wire    [  1: 0] leds_s1_arb_share_set_values;
  wire             leds_s1_beginbursttransfer_internal;
  wire             leds_s1_begins_xfer;
  wire             leds_s1_chipselect;
  wire             leds_s1_end_xfer;
  wire             leds_s1_firsttransfer;
  wire             leds_s1_grant_vector;
  wire             leds_s1_in_a_read_cycle;
  wire             leds_s1_in_a_write_cycle;
  wire             leds_s1_master_qreq_vector;
  wire             leds_s1_non_bursting_master_requests;
  wire    [  9: 0] leds_s1_readdata_from_sa;
  reg              leds_s1_reg_firsttransfer;
  wire             leds_s1_reset_n;
  reg              leds_s1_slavearbiterlockenable;
  wire             leds_s1_slavearbiterlockenable2;
  wire             leds_s1_unreg_firsttransfer;
  wire             leds_s1_waits_for_read;
  wire             leds_s1_waits_for_write;
  wire             leds_s1_write_n;
  wire    [  9: 0] leds_s1_writedata;
  wire    [ 24: 0] shifted_address_to_leds_s1_from_cpu_data_master;
  wire             wait_for_leds_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~leds_s1_end_xfer;
    end


  assign leds_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_leds_s1));
  //assign leds_s1_readdata_from_sa = leds_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign leds_s1_readdata_from_sa = leds_s1_readdata;

  assign cpu_data_master_requests_leds_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18010c0) & (cpu_data_master_read | cpu_data_master_write);
  //leds_s1_arb_share_counter set values, which is an e_mux
  assign leds_s1_arb_share_set_values = 1;

  //leds_s1_non_bursting_master_requests mux, which is an e_mux
  assign leds_s1_non_bursting_master_requests = cpu_data_master_requests_leds_s1;

  //leds_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign leds_s1_any_bursting_master_saved_grant = 0;

  //leds_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign leds_s1_arb_share_counter_next_value = leds_s1_firsttransfer ? (leds_s1_arb_share_set_values - 1) : |leds_s1_arb_share_counter ? (leds_s1_arb_share_counter - 1) : 0;

  //leds_s1_allgrants all slave grants, which is an e_mux
  assign leds_s1_allgrants = |leds_s1_grant_vector;

  //leds_s1_end_xfer assignment, which is an e_assign
  assign leds_s1_end_xfer = ~(leds_s1_waits_for_read | leds_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_leds_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_leds_s1 = leds_s1_end_xfer & (~leds_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //leds_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign leds_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_leds_s1 & leds_s1_allgrants) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests);

  //leds_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_arb_share_counter <= 0;
      else if (leds_s1_arb_counter_enable)
          leds_s1_arb_share_counter <= leds_s1_arb_share_counter_next_value;
    end


  //leds_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_slavearbiterlockenable <= 0;
      else if ((|leds_s1_master_qreq_vector & end_xfer_arb_share_counter_term_leds_s1) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests))
          leds_s1_slavearbiterlockenable <= |leds_s1_arb_share_counter_next_value;
    end


  //cpu/data_master leds/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = leds_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //leds_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign leds_s1_slavearbiterlockenable2 = |leds_s1_arb_share_counter_next_value;

  //cpu/data_master leds/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = leds_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //leds_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign leds_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_leds_s1 = cpu_data_master_requests_leds_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //leds_s1_writedata mux, which is an e_mux
  assign leds_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_leds_s1 = cpu_data_master_qualified_request_leds_s1;

  //cpu/data_master saved-grant leds/s1, which is an e_assign
  assign cpu_data_master_saved_grant_leds_s1 = cpu_data_master_requests_leds_s1;

  //allow new arb cycle for leds/s1, which is an e_assign
  assign leds_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign leds_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign leds_s1_master_qreq_vector = 1;

  //leds_s1_reset_n assignment, which is an e_assign
  assign leds_s1_reset_n = reset_n;

  assign leds_s1_chipselect = cpu_data_master_granted_leds_s1;
  //leds_s1_firsttransfer first transaction, which is an e_assign
  assign leds_s1_firsttransfer = leds_s1_begins_xfer ? leds_s1_unreg_firsttransfer : leds_s1_reg_firsttransfer;

  //leds_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign leds_s1_unreg_firsttransfer = ~(leds_s1_slavearbiterlockenable & leds_s1_any_continuerequest);

  //leds_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_reg_firsttransfer <= 1'b1;
      else if (leds_s1_begins_xfer)
          leds_s1_reg_firsttransfer <= leds_s1_unreg_firsttransfer;
    end


  //leds_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign leds_s1_beginbursttransfer_internal = leds_s1_begins_xfer;

  //~leds_s1_write_n assignment, which is an e_mux
  assign leds_s1_write_n = ~(cpu_data_master_granted_leds_s1 & cpu_data_master_write);

  assign shifted_address_to_leds_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //leds_s1_address mux, which is an e_mux
  assign leds_s1_address = shifted_address_to_leds_s1_from_cpu_data_master >> 2;

  //d1_leds_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_leds_s1_end_xfer <= 1;
      else 
        d1_leds_s1_end_xfer <= leds_s1_end_xfer;
    end


  //leds_s1_waits_for_read in a cycle, which is an e_mux
  assign leds_s1_waits_for_read = leds_s1_in_a_read_cycle & leds_s1_begins_xfer;

  //leds_s1_in_a_read_cycle assignment, which is an e_assign
  assign leds_s1_in_a_read_cycle = cpu_data_master_granted_leds_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = leds_s1_in_a_read_cycle;

  //leds_s1_waits_for_write in a cycle, which is an e_mux
  assign leds_s1_waits_for_write = leds_s1_in_a_write_cycle & 0;

  //leds_s1_in_a_write_cycle assignment, which is an e_assign
  assign leds_s1_in_a_write_cycle = cpu_data_master_granted_leds_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = leds_s1_in_a_write_cycle;

  assign wait_for_leds_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //leds/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mode_sw_s1_arbitrator (
                               // inputs:
                                DE0_SOPC_clock_3_out_address_to_slave,
                                DE0_SOPC_clock_3_out_nativeaddress,
                                DE0_SOPC_clock_3_out_read,
                                DE0_SOPC_clock_3_out_write,
                                clk,
                                mode_sw_s1_readdata,
                                reset_n,

                               // outputs:
                                DE0_SOPC_clock_3_out_granted_mode_sw_s1,
                                DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1,
                                DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1,
                                DE0_SOPC_clock_3_out_requests_mode_sw_s1,
                                d1_mode_sw_s1_end_xfer,
                                mode_sw_s1_address,
                                mode_sw_s1_readdata_from_sa,
                                mode_sw_s1_reset_n
                             )
;

  output           DE0_SOPC_clock_3_out_granted_mode_sw_s1;
  output           DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1;
  output           DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1;
  output           DE0_SOPC_clock_3_out_requests_mode_sw_s1;
  output           d1_mode_sw_s1_end_xfer;
  output  [  1: 0] mode_sw_s1_address;
  output           mode_sw_s1_readdata_from_sa;
  output           mode_sw_s1_reset_n;
  input   [  1: 0] DE0_SOPC_clock_3_out_address_to_slave;
  input   [  1: 0] DE0_SOPC_clock_3_out_nativeaddress;
  input            DE0_SOPC_clock_3_out_read;
  input            DE0_SOPC_clock_3_out_write;
  input            clk;
  input            mode_sw_s1_readdata;
  input            reset_n;

  wire             DE0_SOPC_clock_3_out_arbiterlock;
  wire             DE0_SOPC_clock_3_out_arbiterlock2;
  wire             DE0_SOPC_clock_3_out_continuerequest;
  wire             DE0_SOPC_clock_3_out_granted_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_requests_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_saved_grant_mode_sw_s1;
  reg              d1_mode_sw_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_mode_sw_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] mode_sw_s1_address;
  wire             mode_sw_s1_allgrants;
  wire             mode_sw_s1_allow_new_arb_cycle;
  wire             mode_sw_s1_any_bursting_master_saved_grant;
  wire             mode_sw_s1_any_continuerequest;
  wire             mode_sw_s1_arb_counter_enable;
  reg              mode_sw_s1_arb_share_counter;
  wire             mode_sw_s1_arb_share_counter_next_value;
  wire             mode_sw_s1_arb_share_set_values;
  wire             mode_sw_s1_beginbursttransfer_internal;
  wire             mode_sw_s1_begins_xfer;
  wire             mode_sw_s1_end_xfer;
  wire             mode_sw_s1_firsttransfer;
  wire             mode_sw_s1_grant_vector;
  wire             mode_sw_s1_in_a_read_cycle;
  wire             mode_sw_s1_in_a_write_cycle;
  wire             mode_sw_s1_master_qreq_vector;
  wire             mode_sw_s1_non_bursting_master_requests;
  wire             mode_sw_s1_readdata_from_sa;
  reg              mode_sw_s1_reg_firsttransfer;
  wire             mode_sw_s1_reset_n;
  reg              mode_sw_s1_slavearbiterlockenable;
  wire             mode_sw_s1_slavearbiterlockenable2;
  wire             mode_sw_s1_unreg_firsttransfer;
  wire             mode_sw_s1_waits_for_read;
  wire             mode_sw_s1_waits_for_write;
  wire             wait_for_mode_sw_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~mode_sw_s1_end_xfer;
    end


  assign mode_sw_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1));
  //assign mode_sw_s1_readdata_from_sa = mode_sw_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mode_sw_s1_readdata_from_sa = mode_sw_s1_readdata;

  assign DE0_SOPC_clock_3_out_requests_mode_sw_s1 = ((1) & (DE0_SOPC_clock_3_out_read | DE0_SOPC_clock_3_out_write)) & DE0_SOPC_clock_3_out_read;
  //mode_sw_s1_arb_share_counter set values, which is an e_mux
  assign mode_sw_s1_arb_share_set_values = 1;

  //mode_sw_s1_non_bursting_master_requests mux, which is an e_mux
  assign mode_sw_s1_non_bursting_master_requests = DE0_SOPC_clock_3_out_requests_mode_sw_s1;

  //mode_sw_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign mode_sw_s1_any_bursting_master_saved_grant = 0;

  //mode_sw_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign mode_sw_s1_arb_share_counter_next_value = mode_sw_s1_firsttransfer ? (mode_sw_s1_arb_share_set_values - 1) : |mode_sw_s1_arb_share_counter ? (mode_sw_s1_arb_share_counter - 1) : 0;

  //mode_sw_s1_allgrants all slave grants, which is an e_mux
  assign mode_sw_s1_allgrants = |mode_sw_s1_grant_vector;

  //mode_sw_s1_end_xfer assignment, which is an e_assign
  assign mode_sw_s1_end_xfer = ~(mode_sw_s1_waits_for_read | mode_sw_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_mode_sw_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_mode_sw_s1 = mode_sw_s1_end_xfer & (~mode_sw_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //mode_sw_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign mode_sw_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_mode_sw_s1 & mode_sw_s1_allgrants) | (end_xfer_arb_share_counter_term_mode_sw_s1 & ~mode_sw_s1_non_bursting_master_requests);

  //mode_sw_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mode_sw_s1_arb_share_counter <= 0;
      else if (mode_sw_s1_arb_counter_enable)
          mode_sw_s1_arb_share_counter <= mode_sw_s1_arb_share_counter_next_value;
    end


  //mode_sw_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mode_sw_s1_slavearbiterlockenable <= 0;
      else if ((|mode_sw_s1_master_qreq_vector & end_xfer_arb_share_counter_term_mode_sw_s1) | (end_xfer_arb_share_counter_term_mode_sw_s1 & ~mode_sw_s1_non_bursting_master_requests))
          mode_sw_s1_slavearbiterlockenable <= |mode_sw_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_3/out mode_sw/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_3_out_arbiterlock = mode_sw_s1_slavearbiterlockenable & DE0_SOPC_clock_3_out_continuerequest;

  //mode_sw_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign mode_sw_s1_slavearbiterlockenable2 = |mode_sw_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_3/out mode_sw/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_3_out_arbiterlock2 = mode_sw_s1_slavearbiterlockenable2 & DE0_SOPC_clock_3_out_continuerequest;

  //mode_sw_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign mode_sw_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_3_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_3_out_continuerequest = 1;

  assign DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1 = DE0_SOPC_clock_3_out_requests_mode_sw_s1;
  //master is always granted when requested
  assign DE0_SOPC_clock_3_out_granted_mode_sw_s1 = DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1;

  //DE0_SOPC_clock_3/out saved-grant mode_sw/s1, which is an e_assign
  assign DE0_SOPC_clock_3_out_saved_grant_mode_sw_s1 = DE0_SOPC_clock_3_out_requests_mode_sw_s1;

  //allow new arb cycle for mode_sw/s1, which is an e_assign
  assign mode_sw_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign mode_sw_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign mode_sw_s1_master_qreq_vector = 1;

  //mode_sw_s1_reset_n assignment, which is an e_assign
  assign mode_sw_s1_reset_n = reset_n;

  //mode_sw_s1_firsttransfer first transaction, which is an e_assign
  assign mode_sw_s1_firsttransfer = mode_sw_s1_begins_xfer ? mode_sw_s1_unreg_firsttransfer : mode_sw_s1_reg_firsttransfer;

  //mode_sw_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign mode_sw_s1_unreg_firsttransfer = ~(mode_sw_s1_slavearbiterlockenable & mode_sw_s1_any_continuerequest);

  //mode_sw_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mode_sw_s1_reg_firsttransfer <= 1'b1;
      else if (mode_sw_s1_begins_xfer)
          mode_sw_s1_reg_firsttransfer <= mode_sw_s1_unreg_firsttransfer;
    end


  //mode_sw_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign mode_sw_s1_beginbursttransfer_internal = mode_sw_s1_begins_xfer;

  //mode_sw_s1_address mux, which is an e_mux
  assign mode_sw_s1_address = DE0_SOPC_clock_3_out_nativeaddress;

  //d1_mode_sw_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_mode_sw_s1_end_xfer <= 1;
      else 
        d1_mode_sw_s1_end_xfer <= mode_sw_s1_end_xfer;
    end


  //mode_sw_s1_waits_for_read in a cycle, which is an e_mux
  assign mode_sw_s1_waits_for_read = mode_sw_s1_in_a_read_cycle & mode_sw_s1_begins_xfer;

  //mode_sw_s1_in_a_read_cycle assignment, which is an e_assign
  assign mode_sw_s1_in_a_read_cycle = DE0_SOPC_clock_3_out_granted_mode_sw_s1 & DE0_SOPC_clock_3_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = mode_sw_s1_in_a_read_cycle;

  //mode_sw_s1_waits_for_write in a cycle, which is an e_mux
  assign mode_sw_s1_waits_for_write = mode_sw_s1_in_a_write_cycle & 0;

  //mode_sw_s1_in_a_write_cycle assignment, which is an e_assign
  assign mode_sw_s1_in_a_write_cycle = DE0_SOPC_clock_3_out_granted_mode_sw_s1 & DE0_SOPC_clock_3_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = mode_sw_s1_in_a_write_cycle;

  assign wait_for_mode_sw_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mode_sw/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_s1_arbitrator (
                           // inputs:
                            DE0_SOPC_clock_0_out_address_to_slave,
                            DE0_SOPC_clock_0_out_nativeaddress,
                            DE0_SOPC_clock_0_out_read,
                            DE0_SOPC_clock_0_out_write,
                            DE0_SOPC_clock_0_out_writedata,
                            clk,
                            pll_s1_readdata,
                            pll_s1_resetrequest,
                            reset_n,

                           // outputs:
                            DE0_SOPC_clock_0_out_granted_pll_s1,
                            DE0_SOPC_clock_0_out_qualified_request_pll_s1,
                            DE0_SOPC_clock_0_out_read_data_valid_pll_s1,
                            DE0_SOPC_clock_0_out_requests_pll_s1,
                            d1_pll_s1_end_xfer,
                            pll_s1_address,
                            pll_s1_chipselect,
                            pll_s1_read,
                            pll_s1_readdata_from_sa,
                            pll_s1_reset_n,
                            pll_s1_resetrequest_from_sa,
                            pll_s1_write,
                            pll_s1_writedata
                         )
;

  output           DE0_SOPC_clock_0_out_granted_pll_s1;
  output           DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  output           DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  output           DE0_SOPC_clock_0_out_requests_pll_s1;
  output           d1_pll_s1_end_xfer;
  output  [  2: 0] pll_s1_address;
  output           pll_s1_chipselect;
  output           pll_s1_read;
  output  [ 15: 0] pll_s1_readdata_from_sa;
  output           pll_s1_reset_n;
  output           pll_s1_resetrequest_from_sa;
  output           pll_s1_write;
  output  [ 15: 0] pll_s1_writedata;
  input   [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_0_out_nativeaddress;
  input            DE0_SOPC_clock_0_out_read;
  input            DE0_SOPC_clock_0_out_write;
  input   [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  input            clk;
  input   [ 15: 0] pll_s1_readdata;
  input            pll_s1_resetrequest;
  input            reset_n;

  wire             DE0_SOPC_clock_0_out_arbiterlock;
  wire             DE0_SOPC_clock_0_out_arbiterlock2;
  wire             DE0_SOPC_clock_0_out_continuerequest;
  wire             DE0_SOPC_clock_0_out_granted_pll_s1;
  wire             DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  wire             DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  wire             DE0_SOPC_clock_0_out_requests_pll_s1;
  wire             DE0_SOPC_clock_0_out_saved_grant_pll_s1;
  reg              d1_pll_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_allgrants;
  wire             pll_s1_allow_new_arb_cycle;
  wire             pll_s1_any_bursting_master_saved_grant;
  wire             pll_s1_any_continuerequest;
  wire             pll_s1_arb_counter_enable;
  reg              pll_s1_arb_share_counter;
  wire             pll_s1_arb_share_counter_next_value;
  wire             pll_s1_arb_share_set_values;
  wire             pll_s1_beginbursttransfer_internal;
  wire             pll_s1_begins_xfer;
  wire             pll_s1_chipselect;
  wire             pll_s1_end_xfer;
  wire             pll_s1_firsttransfer;
  wire             pll_s1_grant_vector;
  wire             pll_s1_in_a_read_cycle;
  wire             pll_s1_in_a_write_cycle;
  wire             pll_s1_master_qreq_vector;
  wire             pll_s1_non_bursting_master_requests;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  reg              pll_s1_reg_firsttransfer;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest_from_sa;
  reg              pll_s1_slavearbiterlockenable;
  wire             pll_s1_slavearbiterlockenable2;
  wire             pll_s1_unreg_firsttransfer;
  wire             pll_s1_waits_for_read;
  wire             pll_s1_waits_for_write;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             wait_for_pll_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_s1_end_xfer;
    end


  assign pll_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_0_out_qualified_request_pll_s1));
  //assign pll_s1_readdata_from_sa = pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_readdata_from_sa = pll_s1_readdata;

  assign DE0_SOPC_clock_0_out_requests_pll_s1 = (1) & (DE0_SOPC_clock_0_out_read | DE0_SOPC_clock_0_out_write);
  //pll_s1_arb_share_counter set values, which is an e_mux
  assign pll_s1_arb_share_set_values = 1;

  //pll_s1_non_bursting_master_requests mux, which is an e_mux
  assign pll_s1_non_bursting_master_requests = DE0_SOPC_clock_0_out_requests_pll_s1;

  //pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_s1_any_bursting_master_saved_grant = 0;

  //pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_s1_arb_share_counter_next_value = pll_s1_firsttransfer ? (pll_s1_arb_share_set_values - 1) : |pll_s1_arb_share_counter ? (pll_s1_arb_share_counter - 1) : 0;

  //pll_s1_allgrants all slave grants, which is an e_mux
  assign pll_s1_allgrants = |pll_s1_grant_vector;

  //pll_s1_end_xfer assignment, which is an e_assign
  assign pll_s1_end_xfer = ~(pll_s1_waits_for_read | pll_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_s1 = pll_s1_end_xfer & (~pll_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_s1 & pll_s1_allgrants) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests);

  //pll_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_arb_share_counter <= 0;
      else if (pll_s1_arb_counter_enable)
          pll_s1_arb_share_counter <= pll_s1_arb_share_counter_next_value;
    end


  //pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_slavearbiterlockenable <= 0;
      else if ((|pll_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pll_s1) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests))
          pll_s1_slavearbiterlockenable <= |pll_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_0/out pll/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_0_out_arbiterlock = pll_s1_slavearbiterlockenable & DE0_SOPC_clock_0_out_continuerequest;

  //pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_s1_slavearbiterlockenable2 = |pll_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_0/out pll/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_0_out_arbiterlock2 = pll_s1_slavearbiterlockenable2 & DE0_SOPC_clock_0_out_continuerequest;

  //pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_0_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_0_out_continuerequest = 1;

  assign DE0_SOPC_clock_0_out_qualified_request_pll_s1 = DE0_SOPC_clock_0_out_requests_pll_s1;
  //pll_s1_writedata mux, which is an e_mux
  assign pll_s1_writedata = DE0_SOPC_clock_0_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_0_out_granted_pll_s1 = DE0_SOPC_clock_0_out_qualified_request_pll_s1;

  //DE0_SOPC_clock_0/out saved-grant pll/s1, which is an e_assign
  assign DE0_SOPC_clock_0_out_saved_grant_pll_s1 = DE0_SOPC_clock_0_out_requests_pll_s1;

  //allow new arb cycle for pll/s1, which is an e_assign
  assign pll_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_s1_master_qreq_vector = 1;

  //pll_s1_reset_n assignment, which is an e_assign
  assign pll_s1_reset_n = reset_n;

  //assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest;

  assign pll_s1_chipselect = DE0_SOPC_clock_0_out_granted_pll_s1;
  //pll_s1_firsttransfer first transaction, which is an e_assign
  assign pll_s1_firsttransfer = pll_s1_begins_xfer ? pll_s1_unreg_firsttransfer : pll_s1_reg_firsttransfer;

  //pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_s1_unreg_firsttransfer = ~(pll_s1_slavearbiterlockenable & pll_s1_any_continuerequest);

  //pll_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_reg_firsttransfer <= 1'b1;
      else if (pll_s1_begins_xfer)
          pll_s1_reg_firsttransfer <= pll_s1_unreg_firsttransfer;
    end


  //pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_s1_beginbursttransfer_internal = pll_s1_begins_xfer;

  //pll_s1_read assignment, which is an e_mux
  assign pll_s1_read = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_read;

  //pll_s1_write assignment, which is an e_mux
  assign pll_s1_write = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_write;

  //pll_s1_address mux, which is an e_mux
  assign pll_s1_address = DE0_SOPC_clock_0_out_nativeaddress;

  //d1_pll_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_s1_end_xfer <= 1;
      else 
        d1_pll_s1_end_xfer <= pll_s1_end_xfer;
    end


  //pll_s1_waits_for_read in a cycle, which is an e_mux
  assign pll_s1_waits_for_read = pll_s1_in_a_read_cycle & pll_s1_begins_xfer;

  //pll_s1_in_a_read_cycle assignment, which is an e_assign
  assign pll_s1_in_a_read_cycle = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_s1_in_a_read_cycle;

  //pll_s1_waits_for_write in a cycle, which is an e_mux
  assign pll_s1_waits_for_write = pll_s1_in_a_write_cycle & 0;

  //pll_s1_in_a_write_cycle assignment, which is an e_assign
  assign pll_s1_in_a_write_cycle = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_s1_in_a_write_cycle;

  assign wait_for_pll_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_DE0_SOPC_clock_1_out_to_sdram_s1_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_DE0_SOPC_clock_2_out_to_sdram_s1_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              DE0_SOPC_clock_1_out_address_to_slave,
                              DE0_SOPC_clock_1_out_byteenable,
                              DE0_SOPC_clock_1_out_read,
                              DE0_SOPC_clock_1_out_write,
                              DE0_SOPC_clock_1_out_writedata,
                              DE0_SOPC_clock_2_out_address_to_slave,
                              DE0_SOPC_clock_2_out_byteenable,
                              DE0_SOPC_clock_2_out_read,
                              DE0_SOPC_clock_2_out_write,
                              DE0_SOPC_clock_2_out_writedata,
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_dbs_address,
                              cpu_data_master_dbs_write_16,
                              cpu_data_master_no_byte_enables_and_last_term,
                              cpu_data_master_read,
                              cpu_data_master_waitrequest,
                              cpu_data_master_write,
                              cpu_instruction_master_address_to_slave,
                              cpu_instruction_master_dbs_address,
                              cpu_instruction_master_read,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              DE0_SOPC_clock_1_out_granted_sdram_s1,
                              DE0_SOPC_clock_1_out_qualified_request_sdram_s1,
                              DE0_SOPC_clock_1_out_read_data_valid_sdram_s1,
                              DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register,
                              DE0_SOPC_clock_1_out_requests_sdram_s1,
                              DE0_SOPC_clock_2_out_granted_sdram_s1,
                              DE0_SOPC_clock_2_out_qualified_request_sdram_s1,
                              DE0_SOPC_clock_2_out_read_data_valid_sdram_s1,
                              DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register,
                              DE0_SOPC_clock_2_out_requests_sdram_s1,
                              cpu_data_master_byteenable_sdram_s1,
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              cpu_instruction_master_granted_sdram_s1,
                              cpu_instruction_master_qualified_request_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                              cpu_instruction_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output           DE0_SOPC_clock_1_out_granted_sdram_s1;
  output           DE0_SOPC_clock_1_out_qualified_request_sdram_s1;
  output           DE0_SOPC_clock_1_out_read_data_valid_sdram_s1;
  output           DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register;
  output           DE0_SOPC_clock_1_out_requests_sdram_s1;
  output           DE0_SOPC_clock_2_out_granted_sdram_s1;
  output           DE0_SOPC_clock_2_out_qualified_request_sdram_s1;
  output           DE0_SOPC_clock_2_out_read_data_valid_sdram_s1;
  output           DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register;
  output           DE0_SOPC_clock_2_out_requests_sdram_s1;
  output  [  1: 0] cpu_data_master_byteenable_sdram_s1;
  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           cpu_instruction_master_granted_sdram_s1;
  output           cpu_instruction_master_qualified_request_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_instruction_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  1: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 15: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 15: 0] sdram_s1_writedata;
  input   [ 22: 0] DE0_SOPC_clock_1_out_address_to_slave;
  input   [  1: 0] DE0_SOPC_clock_1_out_byteenable;
  input            DE0_SOPC_clock_1_out_read;
  input            DE0_SOPC_clock_1_out_write;
  input   [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  input   [ 22: 0] DE0_SOPC_clock_2_out_address_to_slave;
  input   [  1: 0] DE0_SOPC_clock_2_out_byteenable;
  input            DE0_SOPC_clock_2_out_read;
  input            DE0_SOPC_clock_2_out_write;
  input   [ 15: 0] DE0_SOPC_clock_2_out_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             DE0_SOPC_clock_1_out_arbiterlock;
  wire             DE0_SOPC_clock_1_out_arbiterlock2;
  wire             DE0_SOPC_clock_1_out_continuerequest;
  wire             DE0_SOPC_clock_1_out_granted_sdram_s1;
  wire             DE0_SOPC_clock_1_out_qualified_request_sdram_s1;
  wire             DE0_SOPC_clock_1_out_rdv_fifo_empty_sdram_s1;
  wire             DE0_SOPC_clock_1_out_rdv_fifo_output_from_sdram_s1;
  wire             DE0_SOPC_clock_1_out_read_data_valid_sdram_s1;
  wire             DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire             DE0_SOPC_clock_1_out_requests_sdram_s1;
  wire             DE0_SOPC_clock_1_out_saved_grant_sdram_s1;
  wire             DE0_SOPC_clock_2_out_arbiterlock;
  wire             DE0_SOPC_clock_2_out_arbiterlock2;
  wire             DE0_SOPC_clock_2_out_continuerequest;
  wire             DE0_SOPC_clock_2_out_granted_sdram_s1;
  wire             DE0_SOPC_clock_2_out_qualified_request_sdram_s1;
  wire             DE0_SOPC_clock_2_out_rdv_fifo_empty_sdram_s1;
  wire             DE0_SOPC_clock_2_out_rdv_fifo_output_from_sdram_s1;
  wire             DE0_SOPC_clock_2_out_read_data_valid_sdram_s1;
  wire             DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register;
  wire             DE0_SOPC_clock_2_out_requests_sdram_s1;
  wire             DE0_SOPC_clock_2_out_saved_grant_sdram_s1;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1;
  reg              last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1;
  reg              last_cycle_cpu_data_master_granted_slave_sdram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  3: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  1: 0] sdram_s1_arb_share_counter;
  wire    [  1: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  1: 0] sdram_s1_arb_share_set_values;
  wire    [  3: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  7: 0] sdram_s1_chosen_master_double_vector;
  wire    [  3: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  3: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  3: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  3: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [ 22: 0] shifted_address_to_sdram_s1_from_DE0_SOPC_clock_1_out;
  wire    [ 22: 0] shifted_address_to_sdram_s1_from_DE0_SOPC_clock_2_out;
  wire    [ 24: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_s1_from_cpu_instruction_master;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_1_out_qualified_request_sdram_s1 | DE0_SOPC_clock_2_out_qualified_request_sdram_s1 | cpu_data_master_qualified_request_sdram_s1 | cpu_instruction_master_qualified_request_sdram_s1));
  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign DE0_SOPC_clock_1_out_requests_sdram_s1 = (1) & (DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = DE0_SOPC_clock_1_out_requests_sdram_s1 |
    DE0_SOPC_clock_2_out_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    DE0_SOPC_clock_1_out_requests_sdram_s1 |
    DE0_SOPC_clock_2_out_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    DE0_SOPC_clock_1_out_requests_sdram_s1 |
    DE0_SOPC_clock_2_out_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    DE0_SOPC_clock_1_out_requests_sdram_s1 |
    DE0_SOPC_clock_2_out_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_1/out sdram/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_1_out_arbiterlock = sdram_s1_slavearbiterlockenable & DE0_SOPC_clock_1_out_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_1/out sdram/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_1_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & DE0_SOPC_clock_1_out_continuerequest;

  //DE0_SOPC_clock_2/out sdram/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_2_out_arbiterlock = sdram_s1_slavearbiterlockenable & DE0_SOPC_clock_2_out_continuerequest;

  //DE0_SOPC_clock_2/out sdram/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_2_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & DE0_SOPC_clock_2_out_continuerequest;

  //DE0_SOPC_clock_2/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1 <= DE0_SOPC_clock_2_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~DE0_SOPC_clock_2_out_requests_sdram_s1) ? 0 : last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1;
    end


  //DE0_SOPC_clock_2_out_continuerequest continued request, which is an e_mux
  assign DE0_SOPC_clock_2_out_continuerequest = (last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1 & DE0_SOPC_clock_2_out_requests_sdram_s1) |
    (last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1 & DE0_SOPC_clock_2_out_requests_sdram_s1) |
    (last_cycle_DE0_SOPC_clock_2_out_granted_slave_sdram_s1 & DE0_SOPC_clock_2_out_requests_sdram_s1);

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = DE0_SOPC_clock_2_out_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    DE0_SOPC_clock_1_out_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    DE0_SOPC_clock_1_out_continuerequest |
    DE0_SOPC_clock_2_out_continuerequest |
    cpu_instruction_master_continuerequest |
    DE0_SOPC_clock_1_out_continuerequest |
    DE0_SOPC_clock_2_out_continuerequest |
    cpu_data_master_continuerequest;

  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/data_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sdram_s1 <= cpu_data_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_sdram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_sdram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1);

  //cpu/instruction_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= cpu_instruction_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sdram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1);

  assign DE0_SOPC_clock_1_out_qualified_request_sdram_s1 = DE0_SOPC_clock_1_out_requests_sdram_s1 & ~((DE0_SOPC_clock_1_out_read & ((|DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register))) | DE0_SOPC_clock_2_out_arbiterlock | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_DE0_SOPC_clock_1_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_DE0_SOPC_clock_1_out_to_sdram_s1_module rdv_fifo_for_DE0_SOPC_clock_1_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE0_SOPC_clock_1_out_granted_sdram_s1),
      .data_out             (DE0_SOPC_clock_1_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (DE0_SOPC_clock_1_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register = ~DE0_SOPC_clock_1_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid DE0_SOPC_clock_1_out_read_data_valid_sdram_s1, which is an e_mux
  assign DE0_SOPC_clock_1_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & DE0_SOPC_clock_1_out_rdv_fifo_output_from_sdram_s1) & ~ DE0_SOPC_clock_1_out_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = (DE0_SOPC_clock_1_out_granted_sdram_s1)? DE0_SOPC_clock_1_out_writedata :
    (DE0_SOPC_clock_2_out_granted_sdram_s1)? DE0_SOPC_clock_2_out_writedata :
    cpu_data_master_dbs_write_16;

  assign DE0_SOPC_clock_2_out_requests_sdram_s1 = (1) & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write);
  //DE0_SOPC_clock_1/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1 <= DE0_SOPC_clock_1_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~DE0_SOPC_clock_1_out_requests_sdram_s1) ? 0 : last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1;
    end


  //DE0_SOPC_clock_1_out_continuerequest continued request, which is an e_mux
  assign DE0_SOPC_clock_1_out_continuerequest = (last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1 & DE0_SOPC_clock_1_out_requests_sdram_s1) |
    (last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1 & DE0_SOPC_clock_1_out_requests_sdram_s1) |
    (last_cycle_DE0_SOPC_clock_1_out_granted_slave_sdram_s1 & DE0_SOPC_clock_1_out_requests_sdram_s1);

  assign DE0_SOPC_clock_2_out_qualified_request_sdram_s1 = DE0_SOPC_clock_2_out_requests_sdram_s1 & ~((DE0_SOPC_clock_2_out_read & ((|DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register))) | DE0_SOPC_clock_1_out_arbiterlock | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //rdv_fifo_for_DE0_SOPC_clock_2_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_DE0_SOPC_clock_2_out_to_sdram_s1_module rdv_fifo_for_DE0_SOPC_clock_2_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE0_SOPC_clock_2_out_granted_sdram_s1),
      .data_out             (DE0_SOPC_clock_2_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (DE0_SOPC_clock_2_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register = ~DE0_SOPC_clock_2_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid DE0_SOPC_clock_2_out_read_data_valid_sdram_s1, which is an e_mux
  assign DE0_SOPC_clock_2_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & DE0_SOPC_clock_2_out_rdv_fifo_output_from_sdram_s1) & ~ DE0_SOPC_clock_2_out_rdv_fifo_empty_sdram_s1;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_data_master_read | cpu_data_master_write);
  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((~cpu_data_master_waitrequest | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_sdram_s1) & cpu_data_master_write) | DE0_SOPC_clock_1_out_arbiterlock | DE0_SOPC_clock_2_out_arbiterlock | cpu_instruction_master_arbiterlock);
  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_data_master_rdv_fifo_empty_sdram_s1;

  assign cpu_instruction_master_requests_sdram_s1 = (({cpu_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  assign cpu_instruction_master_qualified_request_sdram_s1 = cpu_instruction_master_requests_sdram_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | DE0_SOPC_clock_1_out_arbiterlock | DE0_SOPC_clock_2_out_arbiterlock | cpu_data_master_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module rdv_fifo_for_cpu_instruction_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_sdram_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_sdram_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_instruction_master_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~DE0_SOPC_clock_1_out_arbiterlock & ~DE0_SOPC_clock_2_out_arbiterlock & ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_sdram_s1;

  //cpu/instruction_master grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && cpu_instruction_master_requests_sdram_s1;

  //cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master grant sdram/s1, which is an e_assign
  assign cpu_data_master_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && cpu_data_master_requests_sdram_s1;

  //DE0_SOPC_clock_2/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[2] = DE0_SOPC_clock_2_out_qualified_request_sdram_s1;

  //DE0_SOPC_clock_2/out grant sdram/s1, which is an e_assign
  assign DE0_SOPC_clock_2_out_granted_sdram_s1 = sdram_s1_grant_vector[2];

  //DE0_SOPC_clock_2/out saved-grant sdram/s1, which is an e_assign
  assign DE0_SOPC_clock_2_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[2] && DE0_SOPC_clock_2_out_requests_sdram_s1;

  //DE0_SOPC_clock_1/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[3] = DE0_SOPC_clock_1_out_qualified_request_sdram_s1;

  //DE0_SOPC_clock_1/out grant sdram/s1, which is an e_assign
  assign DE0_SOPC_clock_1_out_granted_sdram_s1 = sdram_s1_grant_vector[3];

  //DE0_SOPC_clock_1/out saved-grant sdram/s1, which is an e_assign
  assign DE0_SOPC_clock_1_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[3] && DE0_SOPC_clock_1_out_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[3] | sdram_s1_chosen_master_double_vector[7]),
    (sdram_s1_chosen_master_double_vector[2] | sdram_s1_chosen_master_double_vector[6]),
    (sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[5]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[4])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = DE0_SOPC_clock_1_out_granted_sdram_s1 | DE0_SOPC_clock_2_out_granted_sdram_s1 | cpu_data_master_granted_sdram_s1 | cpu_instruction_master_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((DE0_SOPC_clock_1_out_granted_sdram_s1 & DE0_SOPC_clock_1_out_read) | (DE0_SOPC_clock_2_out_granted_sdram_s1 & DE0_SOPC_clock_2_out_read) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~((DE0_SOPC_clock_1_out_granted_sdram_s1 & DE0_SOPC_clock_1_out_write) | (DE0_SOPC_clock_2_out_granted_sdram_s1 & DE0_SOPC_clock_2_out_write) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_write));

  assign shifted_address_to_sdram_s1_from_DE0_SOPC_clock_1_out = DE0_SOPC_clock_1_out_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (DE0_SOPC_clock_1_out_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_DE0_SOPC_clock_1_out >> 1) :
    (DE0_SOPC_clock_2_out_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_DE0_SOPC_clock_2_out >> 1) :
    (cpu_data_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_data_master >> 1) :
    (shifted_address_to_sdram_s1_from_cpu_instruction_master >> 1);

  assign shifted_address_to_sdram_s1_from_DE0_SOPC_clock_2_out = DE0_SOPC_clock_2_out_address_to_slave;
  assign shifted_address_to_sdram_s1_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  assign shifted_address_to_sdram_s1_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (DE0_SOPC_clock_1_out_granted_sdram_s1 & DE0_SOPC_clock_1_out_read) | (DE0_SOPC_clock_2_out_granted_sdram_s1 & DE0_SOPC_clock_2_out_read) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = (DE0_SOPC_clock_1_out_granted_sdram_s1 & DE0_SOPC_clock_1_out_write) | (DE0_SOPC_clock_2_out_granted_sdram_s1 & DE0_SOPC_clock_2_out_write) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((DE0_SOPC_clock_1_out_granted_sdram_s1)? DE0_SOPC_clock_1_out_byteenable :
    (DE0_SOPC_clock_2_out_granted_sdram_s1)? DE0_SOPC_clock_2_out_byteenable :
    (cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable_sdram_s1 :
    -1);

  assign {cpu_data_master_byteenable_sdram_s1_segment_1,
cpu_data_master_byteenable_sdram_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sdram_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sdram_s1_segment_0 :
    cpu_data_master_byteenable_sdram_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (DE0_SOPC_clock_1_out_granted_sdram_s1 + DE0_SOPC_clock_2_out_granted_sdram_s1 + cpu_data_master_granted_sdram_s1 + cpu_instruction_master_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (DE0_SOPC_clock_1_out_saved_grant_sdram_s1 + DE0_SOPC_clock_2_out_saved_grant_sdram_s1 + cpu_data_master_saved_grant_sdram_s1 + cpu_instruction_master_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module switches_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_write,
                                 reset_n,
                                 switches_s1_readdata,

                                // outputs:
                                 cpu_data_master_granted_switches_s1,
                                 cpu_data_master_qualified_request_switches_s1,
                                 cpu_data_master_read_data_valid_switches_s1,
                                 cpu_data_master_requests_switches_s1,
                                 d1_switches_s1_end_xfer,
                                 switches_s1_address,
                                 switches_s1_readdata_from_sa,
                                 switches_s1_reset_n
                              )
;

  output           cpu_data_master_granted_switches_s1;
  output           cpu_data_master_qualified_request_switches_s1;
  output           cpu_data_master_read_data_valid_switches_s1;
  output           cpu_data_master_requests_switches_s1;
  output           d1_switches_s1_end_xfer;
  output  [  1: 0] switches_s1_address;
  output  [  8: 0] switches_s1_readdata_from_sa;
  output           switches_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [  8: 0] switches_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_switches_s1;
  wire             cpu_data_master_qualified_request_switches_s1;
  wire             cpu_data_master_read_data_valid_switches_s1;
  wire             cpu_data_master_requests_switches_s1;
  wire             cpu_data_master_saved_grant_switches_s1;
  reg              d1_reasons_to_wait;
  reg              d1_switches_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_switches_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_switches_s1_from_cpu_data_master;
  wire    [  1: 0] switches_s1_address;
  wire             switches_s1_allgrants;
  wire             switches_s1_allow_new_arb_cycle;
  wire             switches_s1_any_bursting_master_saved_grant;
  wire             switches_s1_any_continuerequest;
  wire             switches_s1_arb_counter_enable;
  reg     [  1: 0] switches_s1_arb_share_counter;
  wire    [  1: 0] switches_s1_arb_share_counter_next_value;
  wire    [  1: 0] switches_s1_arb_share_set_values;
  wire             switches_s1_beginbursttransfer_internal;
  wire             switches_s1_begins_xfer;
  wire             switches_s1_end_xfer;
  wire             switches_s1_firsttransfer;
  wire             switches_s1_grant_vector;
  wire             switches_s1_in_a_read_cycle;
  wire             switches_s1_in_a_write_cycle;
  wire             switches_s1_master_qreq_vector;
  wire             switches_s1_non_bursting_master_requests;
  wire    [  8: 0] switches_s1_readdata_from_sa;
  reg              switches_s1_reg_firsttransfer;
  wire             switches_s1_reset_n;
  reg              switches_s1_slavearbiterlockenable;
  wire             switches_s1_slavearbiterlockenable2;
  wire             switches_s1_unreg_firsttransfer;
  wire             switches_s1_waits_for_read;
  wire             switches_s1_waits_for_write;
  wire             wait_for_switches_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~switches_s1_end_xfer;
    end


  assign switches_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_switches_s1));
  //assign switches_s1_readdata_from_sa = switches_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign switches_s1_readdata_from_sa = switches_s1_readdata;

  assign cpu_data_master_requests_switches_s1 = (({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18010e0) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //switches_s1_arb_share_counter set values, which is an e_mux
  assign switches_s1_arb_share_set_values = 1;

  //switches_s1_non_bursting_master_requests mux, which is an e_mux
  assign switches_s1_non_bursting_master_requests = cpu_data_master_requests_switches_s1;

  //switches_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign switches_s1_any_bursting_master_saved_grant = 0;

  //switches_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign switches_s1_arb_share_counter_next_value = switches_s1_firsttransfer ? (switches_s1_arb_share_set_values - 1) : |switches_s1_arb_share_counter ? (switches_s1_arb_share_counter - 1) : 0;

  //switches_s1_allgrants all slave grants, which is an e_mux
  assign switches_s1_allgrants = |switches_s1_grant_vector;

  //switches_s1_end_xfer assignment, which is an e_assign
  assign switches_s1_end_xfer = ~(switches_s1_waits_for_read | switches_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_switches_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_switches_s1 = switches_s1_end_xfer & (~switches_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //switches_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign switches_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_switches_s1 & switches_s1_allgrants) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests);

  //switches_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_arb_share_counter <= 0;
      else if (switches_s1_arb_counter_enable)
          switches_s1_arb_share_counter <= switches_s1_arb_share_counter_next_value;
    end


  //switches_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_slavearbiterlockenable <= 0;
      else if ((|switches_s1_master_qreq_vector & end_xfer_arb_share_counter_term_switches_s1) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests))
          switches_s1_slavearbiterlockenable <= |switches_s1_arb_share_counter_next_value;
    end


  //cpu/data_master switches/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = switches_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //switches_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign switches_s1_slavearbiterlockenable2 = |switches_s1_arb_share_counter_next_value;

  //cpu/data_master switches/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = switches_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //switches_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign switches_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_switches_s1 = cpu_data_master_requests_switches_s1;
  //master is always granted when requested
  assign cpu_data_master_granted_switches_s1 = cpu_data_master_qualified_request_switches_s1;

  //cpu/data_master saved-grant switches/s1, which is an e_assign
  assign cpu_data_master_saved_grant_switches_s1 = cpu_data_master_requests_switches_s1;

  //allow new arb cycle for switches/s1, which is an e_assign
  assign switches_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign switches_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign switches_s1_master_qreq_vector = 1;

  //switches_s1_reset_n assignment, which is an e_assign
  assign switches_s1_reset_n = reset_n;

  //switches_s1_firsttransfer first transaction, which is an e_assign
  assign switches_s1_firsttransfer = switches_s1_begins_xfer ? switches_s1_unreg_firsttransfer : switches_s1_reg_firsttransfer;

  //switches_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign switches_s1_unreg_firsttransfer = ~(switches_s1_slavearbiterlockenable & switches_s1_any_continuerequest);

  //switches_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_reg_firsttransfer <= 1'b1;
      else if (switches_s1_begins_xfer)
          switches_s1_reg_firsttransfer <= switches_s1_unreg_firsttransfer;
    end


  //switches_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign switches_s1_beginbursttransfer_internal = switches_s1_begins_xfer;

  assign shifted_address_to_switches_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //switches_s1_address mux, which is an e_mux
  assign switches_s1_address = shifted_address_to_switches_s1_from_cpu_data_master >> 2;

  //d1_switches_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_switches_s1_end_xfer <= 1;
      else 
        d1_switches_s1_end_xfer <= switches_s1_end_xfer;
    end


  //switches_s1_waits_for_read in a cycle, which is an e_mux
  assign switches_s1_waits_for_read = switches_s1_in_a_read_cycle & switches_s1_begins_xfer;

  //switches_s1_in_a_read_cycle assignment, which is an e_assign
  assign switches_s1_in_a_read_cycle = cpu_data_master_granted_switches_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = switches_s1_in_a_read_cycle;

  //switches_s1_waits_for_write in a cycle, which is an e_mux
  assign switches_s1_waits_for_write = switches_s1_in_a_write_cycle & 0;

  //switches_s1_in_a_write_cycle assignment, which is an e_assign
  assign switches_s1_in_a_write_cycle = cpu_data_master_granted_switches_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = switches_s1_in_a_write_cycle;

  assign wait_for_switches_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //switches/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801128) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_read,
                              cpu_data_master_waitrequest,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              cpu_data_master_granted_timer_s1,
                              cpu_data_master_qualified_request_timer_s1,
                              cpu_data_master_read_data_valid_timer_s1,
                              cpu_data_master_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           cpu_data_master_granted_timer_s1;
  output           cpu_data_master_qualified_request_timer_s1;
  output           cpu_data_master_read_data_valid_timer_s1;
  output           cpu_data_master_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_timer_s1;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_s1_from_cpu_data_master;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg     [  1: 0] timer_s1_arb_share_counter;
  wire    [  1: 0] timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign cpu_data_master_requests_timer_s1 = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1801000) & (cpu_data_master_read | cpu_data_master_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = cpu_data_master_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //cpu/data_master timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_timer_s1 = cpu_data_master_requests_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_timer_s1 = cpu_data_master_qualified_request_timer_s1;

  //cpu/data_master saved-grant timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_timer_s1 = cpu_data_master_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = cpu_data_master_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(cpu_data_master_granted_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = shifted_address_to_timer_s1_from_cpu_data_master >> 2;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_avalon_slave_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  cpu_data_master_address_to_slave,
                                                  cpu_data_master_byteenable,
                                                  cpu_data_master_dbs_address,
                                                  cpu_data_master_dbs_write_16,
                                                  cpu_data_master_no_byte_enables_and_last_term,
                                                  cpu_data_master_read,
                                                  cpu_data_master_write,
                                                  cpu_instruction_master_address_to_slave,
                                                  cpu_instruction_master_dbs_address,
                                                  cpu_instruction_master_read,
                                                  reset_n,

                                                 // outputs:
                                                  address_to_the_cfi_flash,
                                                  cfi_flash_s1_wait_counter_eq_0,
                                                  cfi_flash_s1_wait_counter_eq_1,
                                                  cpu_data_master_byteenable_cfi_flash_s1,
                                                  cpu_data_master_granted_cfi_flash_s1,
                                                  cpu_data_master_qualified_request_cfi_flash_s1,
                                                  cpu_data_master_read_data_valid_cfi_flash_s1,
                                                  cpu_data_master_requests_cfi_flash_s1,
                                                  cpu_instruction_master_granted_cfi_flash_s1,
                                                  cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                  cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                  cpu_instruction_master_requests_cfi_flash_s1,
                                                  d1_tristate_bridge_avalon_slave_end_xfer,
                                                  data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                                  read_n_to_the_cfi_flash,
                                                  registered_cpu_data_master_read_data_valid_cfi_flash_s1,
                                                  select_n_to_the_cfi_flash,
                                                  write_n_to_the_cfi_flash
                                               )
;

  output  [ 21: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output           cfi_flash_s1_wait_counter_eq_1;
  output  [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tristate_bridge_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_read;
  input            reset_n;

  reg     [ 21: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  3: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  reg     [  3: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_wait_counter_eq_1;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tristate_bridge_avalon_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_10_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_11_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_12_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_13_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_14_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_15_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_7_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_8_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_cfi_flash;
  wire    [ 21: 0] p1_address_to_the_cfi_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tristate_bridge_avalon_slave_allgrants;
  wire             tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             tristate_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] tristate_bridge_avalon_slave_arb_addend;
  wire             tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_winner;
  wire             tristate_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             tristate_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] tristate_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_chosen_master_rot_left;
  wire             tristate_bridge_avalon_slave_end_xfer;
  wire             tristate_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] tristate_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_master_qreq_vector;
  wire             tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             tristate_bridge_avalon_slave_read_pending;
  reg              tristate_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tristate_bridge_avalon_slave_saved_chosen_master_vector;
  reg              tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             tristate_bridge_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tristate_bridge_avalon_slave_end_xfer;
    end


  assign tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tristate_bridge_avalon_slave_write_pending = 0;
  //tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign tristate_bridge_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_data_master_read_data_valid_cfi_flash_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[0];

  //tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tristate_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    1;

  //tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tristate_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_share_counter_next_value = tristate_bridge_avalon_slave_firsttransfer ? (tristate_bridge_avalon_slave_arb_share_set_values - 1) : |tristate_bridge_avalon_slave_arb_share_counter ? (tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tristate_bridge_avalon_slave_allgrants = (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector);

  //tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave = tristate_bridge_avalon_slave_end_xfer & (~tristate_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tristate_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & tristate_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests);

  //tristate_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_share_counter <= 0;
      else if (tristate_bridge_avalon_slave_arb_counter_enable)
          tristate_bridge_avalon_slave_arb_share_counter <= tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //tristate_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tristate_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests))
          tristate_bridge_avalon_slave_slavearbiterlockenable <= |tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tristate_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tristate_bridge_avalon_slave_slavearbiterlockenable2 = |tristate_bridge_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tristate_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_cfi_flash_s1_shift_register))) | ((tristate_bridge_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_cfi_flash_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_cfi_flash <= 0;
      else 
        incoming_data_to_and_from_the_cfi_flash <= data_to_and_from_the_cfi_flash;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash <= 0;
      else 
        d1_outgoing_data_to_and_from_the_cfi_flash <= outgoing_data_to_and_from_the_cfi_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash:{16{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (|cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tristate_bridge/avalon_slave, which is an e_assign
  assign tristate_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tristate_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_double_vector = {tristate_bridge_avalon_slave_master_qreq_vector, tristate_bridge_avalon_slave_master_qreq_vector} & ({~tristate_bridge_avalon_slave_master_qreq_vector, ~tristate_bridge_avalon_slave_master_qreq_vector} + tristate_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tristate_bridge_avalon_slave_arb_winner = (tristate_bridge_avalon_slave_allow_new_arb_cycle & | tristate_bridge_avalon_slave_grant_vector) ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;

  //saved tristate_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tristate_bridge_avalon_slave_allow_new_arb_cycle)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= |tristate_bridge_avalon_slave_grant_vector ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tristate_bridge_avalon_slave_grant_vector = {(tristate_bridge_avalon_slave_chosen_master_double_vector[1] | tristate_bridge_avalon_slave_chosen_master_double_vector[3]),
    (tristate_bridge_avalon_slave_chosen_master_double_vector[0] | tristate_bridge_avalon_slave_chosen_master_double_vector[2])};

  //tristate_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_rot_left = (tristate_bridge_avalon_slave_arb_winner << 1) ? (tristate_bridge_avalon_slave_arb_winner << 1) : 1;

  //tristate_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_addend <= 1;
      else if (|tristate_bridge_avalon_slave_grant_vector)
          tristate_bridge_avalon_slave_arb_addend <= tristate_bridge_avalon_slave_end_xfer? tristate_bridge_avalon_slave_chosen_master_rot_left : tristate_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tristate_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_firsttransfer = tristate_bridge_avalon_slave_begins_xfer ? tristate_bridge_avalon_slave_unreg_firsttransfer : tristate_bridge_avalon_slave_reg_firsttransfer;

  //tristate_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_unreg_firsttransfer = ~(tristate_bridge_avalon_slave_slavearbiterlockenable & tristate_bridge_avalon_slave_any_continuerequest);

  //tristate_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tristate_bridge_avalon_slave_begins_xfer)
          tristate_bridge_avalon_slave_reg_firsttransfer <= tristate_bridge_avalon_slave_unreg_firsttransfer;
    end


  //tristate_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tristate_bridge_avalon_slave_beginbursttransfer_internal = tristate_bridge_avalon_slave_begins_xfer;

  //tristate_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tristate_bridge_avalon_slave_arbitration_holdoff_internal = tristate_bridge_avalon_slave_begins_xfer & tristate_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 5));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 3) & (cfi_flash_s1_wait_counter < 8));

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else 
        address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_tristate_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tristate_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_tristate_bridge_avalon_slave_end_xfer <= tristate_bridge_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign cfi_flash_s1_wait_counter_eq_1 = cfi_flash_s1_wait_counter == 1;

  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tristate_bridge_avalon_slave_begins_xfer))? 6 :
    ((cfi_flash_s1_in_a_write_cycle & tristate_bridge_avalon_slave_begins_xfer))? 9 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tristate_bridge_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[0];

  //incoming_data_to_and_from_the_cfi_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[1];

  //incoming_data_to_and_from_the_cfi_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[2];

  //incoming_data_to_and_from_the_cfi_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[3];

  //incoming_data_to_and_from_the_cfi_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[4];

  //incoming_data_to_and_from_the_cfi_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[5];

  //incoming_data_to_and_from_the_cfi_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[6];

  //incoming_data_to_and_from_the_cfi_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[7];

  //incoming_data_to_and_from_the_cfi_flash_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_8_is_x = ^(incoming_data_to_and_from_the_cfi_flash[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_cfi_flash_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[8];

  //incoming_data_to_and_from_the_cfi_flash_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_9_is_x = ^(incoming_data_to_and_from_the_cfi_flash[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_cfi_flash_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[9];

  //incoming_data_to_and_from_the_cfi_flash_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_10_is_x = ^(incoming_data_to_and_from_the_cfi_flash[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_cfi_flash_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[10];

  //incoming_data_to_and_from_the_cfi_flash_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_11_is_x = ^(incoming_data_to_and_from_the_cfi_flash[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_cfi_flash_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[11];

  //incoming_data_to_and_from_the_cfi_flash_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_12_is_x = ^(incoming_data_to_and_from_the_cfi_flash[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_cfi_flash_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[12];

  //incoming_data_to_and_from_the_cfi_flash_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_13_is_x = ^(incoming_data_to_and_from_the_cfi_flash[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_cfi_flash_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[13];

  //incoming_data_to_and_from_the_cfi_flash_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_14_is_x = ^(incoming_data_to_and_from_the_cfi_flash[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_cfi_flash_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[14];

  //incoming_data_to_and_from_the_cfi_flash_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_15_is_x = ^(incoming_data_to_and_from_the_cfi_flash[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_cfi_flash_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[15];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_data_master_address_to_slave,
                             cpu_data_master_read,
                             cpu_data_master_write,
                             cpu_data_master_writedata,
                             reset_n,
                             uart_s1_dataavailable,
                             uart_s1_irq,
                             uart_s1_readdata,
                             uart_s1_readyfordata,

                            // outputs:
                             cpu_data_master_granted_uart_s1,
                             cpu_data_master_qualified_request_uart_s1,
                             cpu_data_master_read_data_valid_uart_s1,
                             cpu_data_master_requests_uart_s1,
                             d1_uart_s1_end_xfer,
                             uart_s1_address,
                             uart_s1_begintransfer,
                             uart_s1_chipselect,
                             uart_s1_dataavailable_from_sa,
                             uart_s1_irq_from_sa,
                             uart_s1_read_n,
                             uart_s1_readdata_from_sa,
                             uart_s1_readyfordata_from_sa,
                             uart_s1_reset_n,
                             uart_s1_write_n,
                             uart_s1_writedata
                          )
;

  output           cpu_data_master_granted_uart_s1;
  output           cpu_data_master_qualified_request_uart_s1;
  output           cpu_data_master_read_data_valid_uart_s1;
  output           cpu_data_master_requests_uart_s1;
  output           d1_uart_s1_end_xfer;
  output  [  2: 0] uart_s1_address;
  output           uart_s1_begintransfer;
  output           uart_s1_chipselect;
  output           uart_s1_dataavailable_from_sa;
  output           uart_s1_irq_from_sa;
  output           uart_s1_read_n;
  output  [ 15: 0] uart_s1_readdata_from_sa;
  output           uart_s1_readyfordata_from_sa;
  output           uart_s1_reset_n;
  output           uart_s1_write_n;
  output  [ 15: 0] uart_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            uart_s1_dataavailable;
  input            uart_s1_irq;
  input   [ 15: 0] uart_s1_readdata;
  input            uart_s1_readyfordata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_uart_s1;
  wire             cpu_data_master_qualified_request_uart_s1;
  wire             cpu_data_master_read_data_valid_uart_s1;
  wire             cpu_data_master_requests_uart_s1;
  wire             cpu_data_master_saved_grant_uart_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_uart_s1_from_cpu_data_master;
  wire    [  2: 0] uart_s1_address;
  wire             uart_s1_allgrants;
  wire             uart_s1_allow_new_arb_cycle;
  wire             uart_s1_any_bursting_master_saved_grant;
  wire             uart_s1_any_continuerequest;
  wire             uart_s1_arb_counter_enable;
  reg     [  1: 0] uart_s1_arb_share_counter;
  wire    [  1: 0] uart_s1_arb_share_counter_next_value;
  wire    [  1: 0] uart_s1_arb_share_set_values;
  wire             uart_s1_beginbursttransfer_internal;
  wire             uart_s1_begins_xfer;
  wire             uart_s1_begintransfer;
  wire             uart_s1_chipselect;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_end_xfer;
  wire             uart_s1_firsttransfer;
  wire             uart_s1_grant_vector;
  wire             uart_s1_in_a_read_cycle;
  wire             uart_s1_in_a_write_cycle;
  wire             uart_s1_irq_from_sa;
  wire             uart_s1_master_qreq_vector;
  wire             uart_s1_non_bursting_master_requests;
  wire             uart_s1_read_n;
  wire    [ 15: 0] uart_s1_readdata_from_sa;
  wire             uart_s1_readyfordata_from_sa;
  reg              uart_s1_reg_firsttransfer;
  wire             uart_s1_reset_n;
  reg              uart_s1_slavearbiterlockenable;
  wire             uart_s1_slavearbiterlockenable2;
  wire             uart_s1_unreg_firsttransfer;
  wire             uart_s1_waits_for_read;
  wire             uart_s1_waits_for_write;
  wire             uart_s1_write_n;
  wire    [ 15: 0] uart_s1_writedata;
  wire             wait_for_uart_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart_s1_end_xfer;
    end


  assign uart_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_uart_s1));
  //assign uart_s1_readdata_from_sa = uart_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_readdata_from_sa = uart_s1_readdata;

  assign cpu_data_master_requests_uart_s1 = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1801020) & (cpu_data_master_read | cpu_data_master_write);
  //assign uart_s1_dataavailable_from_sa = uart_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_dataavailable_from_sa = uart_s1_dataavailable;

  //assign uart_s1_readyfordata_from_sa = uart_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_readyfordata_from_sa = uart_s1_readyfordata;

  //uart_s1_arb_share_counter set values, which is an e_mux
  assign uart_s1_arb_share_set_values = 1;

  //uart_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart_s1_non_bursting_master_requests = cpu_data_master_requests_uart_s1;

  //uart_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart_s1_any_bursting_master_saved_grant = 0;

  //uart_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart_s1_arb_share_counter_next_value = uart_s1_firsttransfer ? (uart_s1_arb_share_set_values - 1) : |uart_s1_arb_share_counter ? (uart_s1_arb_share_counter - 1) : 0;

  //uart_s1_allgrants all slave grants, which is an e_mux
  assign uart_s1_allgrants = |uart_s1_grant_vector;

  //uart_s1_end_xfer assignment, which is an e_assign
  assign uart_s1_end_xfer = ~(uart_s1_waits_for_read | uart_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart_s1 = uart_s1_end_xfer & (~uart_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart_s1 & uart_s1_allgrants) | (end_xfer_arb_share_counter_term_uart_s1 & ~uart_s1_non_bursting_master_requests);

  //uart_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_arb_share_counter <= 0;
      else if (uart_s1_arb_counter_enable)
          uart_s1_arb_share_counter <= uart_s1_arb_share_counter_next_value;
    end


  //uart_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_slavearbiterlockenable <= 0;
      else if ((|uart_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart_s1) | (end_xfer_arb_share_counter_term_uart_s1 & ~uart_s1_non_bursting_master_requests))
          uart_s1_slavearbiterlockenable <= |uart_s1_arb_share_counter_next_value;
    end


  //cpu/data_master uart/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = uart_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //uart_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart_s1_slavearbiterlockenable2 = |uart_s1_arb_share_counter_next_value;

  //cpu/data_master uart/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = uart_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //uart_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_uart_s1 = cpu_data_master_requests_uart_s1;
  //uart_s1_writedata mux, which is an e_mux
  assign uart_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_uart_s1 = cpu_data_master_qualified_request_uart_s1;

  //cpu/data_master saved-grant uart/s1, which is an e_assign
  assign cpu_data_master_saved_grant_uart_s1 = cpu_data_master_requests_uart_s1;

  //allow new arb cycle for uart/s1, which is an e_assign
  assign uart_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart_s1_master_qreq_vector = 1;

  assign uart_s1_begintransfer = uart_s1_begins_xfer;
  //uart_s1_reset_n assignment, which is an e_assign
  assign uart_s1_reset_n = reset_n;

  assign uart_s1_chipselect = cpu_data_master_granted_uart_s1;
  //uart_s1_firsttransfer first transaction, which is an e_assign
  assign uart_s1_firsttransfer = uart_s1_begins_xfer ? uart_s1_unreg_firsttransfer : uart_s1_reg_firsttransfer;

  //uart_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart_s1_unreg_firsttransfer = ~(uart_s1_slavearbiterlockenable & uart_s1_any_continuerequest);

  //uart_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_reg_firsttransfer <= 1'b1;
      else if (uart_s1_begins_xfer)
          uart_s1_reg_firsttransfer <= uart_s1_unreg_firsttransfer;
    end


  //uart_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart_s1_beginbursttransfer_internal = uart_s1_begins_xfer;

  //~uart_s1_read_n assignment, which is an e_mux
  assign uart_s1_read_n = ~(cpu_data_master_granted_uart_s1 & cpu_data_master_read);

  //~uart_s1_write_n assignment, which is an e_mux
  assign uart_s1_write_n = ~(cpu_data_master_granted_uart_s1 & cpu_data_master_write);

  assign shifted_address_to_uart_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //uart_s1_address mux, which is an e_mux
  assign uart_s1_address = shifted_address_to_uart_s1_from_cpu_data_master >> 2;

  //d1_uart_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart_s1_end_xfer <= 1;
      else 
        d1_uart_s1_end_xfer <= uart_s1_end_xfer;
    end


  //uart_s1_waits_for_read in a cycle, which is an e_mux
  assign uart_s1_waits_for_read = uart_s1_in_a_read_cycle & uart_s1_begins_xfer;

  //uart_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart_s1_in_a_read_cycle = cpu_data_master_granted_uart_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart_s1_in_a_read_cycle;

  //uart_s1_waits_for_write in a cycle, which is an e_mux
  assign uart_s1_waits_for_write = uart_s1_in_a_write_cycle & uart_s1_begins_xfer;

  //uart_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart_s1_in_a_write_cycle = cpu_data_master_granted_uart_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart_s1_in_a_write_cycle;

  assign wait_for_uart_s1_counter = 0;
  //assign uart_s1_irq_from_sa = uart_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_irq_from_sa = uart_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart2_s1_arbitrator (
                             // inputs:
                              DE0_SOPC_clock_7_out_address_to_slave,
                              DE0_SOPC_clock_7_out_nativeaddress,
                              DE0_SOPC_clock_7_out_read,
                              DE0_SOPC_clock_7_out_write,
                              DE0_SOPC_clock_7_out_writedata,
                              clk,
                              reset_n,
                              uart2_s1_dataavailable,
                              uart2_s1_irq,
                              uart2_s1_readdata,
                              uart2_s1_readyfordata,

                             // outputs:
                              DE0_SOPC_clock_7_out_granted_uart2_s1,
                              DE0_SOPC_clock_7_out_qualified_request_uart2_s1,
                              DE0_SOPC_clock_7_out_read_data_valid_uart2_s1,
                              DE0_SOPC_clock_7_out_requests_uart2_s1,
                              d1_uart2_s1_end_xfer,
                              uart2_s1_address,
                              uart2_s1_begintransfer,
                              uart2_s1_chipselect,
                              uart2_s1_dataavailable_from_sa,
                              uart2_s1_irq_from_sa,
                              uart2_s1_read_n,
                              uart2_s1_readdata_from_sa,
                              uart2_s1_readyfordata_from_sa,
                              uart2_s1_reset_n,
                              uart2_s1_write_n,
                              uart2_s1_writedata
                           )
;

  output           DE0_SOPC_clock_7_out_granted_uart2_s1;
  output           DE0_SOPC_clock_7_out_qualified_request_uart2_s1;
  output           DE0_SOPC_clock_7_out_read_data_valid_uart2_s1;
  output           DE0_SOPC_clock_7_out_requests_uart2_s1;
  output           d1_uart2_s1_end_xfer;
  output  [  2: 0] uart2_s1_address;
  output           uart2_s1_begintransfer;
  output           uart2_s1_chipselect;
  output           uart2_s1_dataavailable_from_sa;
  output           uart2_s1_irq_from_sa;
  output           uart2_s1_read_n;
  output  [ 15: 0] uart2_s1_readdata_from_sa;
  output           uart2_s1_readyfordata_from_sa;
  output           uart2_s1_reset_n;
  output           uart2_s1_write_n;
  output  [ 15: 0] uart2_s1_writedata;
  input   [  3: 0] DE0_SOPC_clock_7_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_7_out_nativeaddress;
  input            DE0_SOPC_clock_7_out_read;
  input            DE0_SOPC_clock_7_out_write;
  input   [ 15: 0] DE0_SOPC_clock_7_out_writedata;
  input            clk;
  input            reset_n;
  input            uart2_s1_dataavailable;
  input            uart2_s1_irq;
  input   [ 15: 0] uart2_s1_readdata;
  input            uart2_s1_readyfordata;

  wire             DE0_SOPC_clock_7_out_arbiterlock;
  wire             DE0_SOPC_clock_7_out_arbiterlock2;
  wire             DE0_SOPC_clock_7_out_continuerequest;
  wire             DE0_SOPC_clock_7_out_granted_uart2_s1;
  wire             DE0_SOPC_clock_7_out_qualified_request_uart2_s1;
  wire             DE0_SOPC_clock_7_out_read_data_valid_uart2_s1;
  wire             DE0_SOPC_clock_7_out_requests_uart2_s1;
  wire             DE0_SOPC_clock_7_out_saved_grant_uart2_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart2_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart2_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] uart2_s1_address;
  wire             uart2_s1_allgrants;
  wire             uart2_s1_allow_new_arb_cycle;
  wire             uart2_s1_any_bursting_master_saved_grant;
  wire             uart2_s1_any_continuerequest;
  wire             uart2_s1_arb_counter_enable;
  reg              uart2_s1_arb_share_counter;
  wire             uart2_s1_arb_share_counter_next_value;
  wire             uart2_s1_arb_share_set_values;
  wire             uart2_s1_beginbursttransfer_internal;
  wire             uart2_s1_begins_xfer;
  wire             uart2_s1_begintransfer;
  wire             uart2_s1_chipselect;
  wire             uart2_s1_dataavailable_from_sa;
  wire             uart2_s1_end_xfer;
  wire             uart2_s1_firsttransfer;
  wire             uart2_s1_grant_vector;
  wire             uart2_s1_in_a_read_cycle;
  wire             uart2_s1_in_a_write_cycle;
  wire             uart2_s1_irq_from_sa;
  wire             uart2_s1_master_qreq_vector;
  wire             uart2_s1_non_bursting_master_requests;
  wire             uart2_s1_read_n;
  wire    [ 15: 0] uart2_s1_readdata_from_sa;
  wire             uart2_s1_readyfordata_from_sa;
  reg              uart2_s1_reg_firsttransfer;
  wire             uart2_s1_reset_n;
  reg              uart2_s1_slavearbiterlockenable;
  wire             uart2_s1_slavearbiterlockenable2;
  wire             uart2_s1_unreg_firsttransfer;
  wire             uart2_s1_waits_for_read;
  wire             uart2_s1_waits_for_write;
  wire             uart2_s1_write_n;
  wire    [ 15: 0] uart2_s1_writedata;
  wire             wait_for_uart2_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart2_s1_end_xfer;
    end


  assign uart2_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_7_out_qualified_request_uart2_s1));
  //assign uart2_s1_readdata_from_sa = uart2_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart2_s1_readdata_from_sa = uart2_s1_readdata;

  assign DE0_SOPC_clock_7_out_requests_uart2_s1 = (1) & (DE0_SOPC_clock_7_out_read | DE0_SOPC_clock_7_out_write);
  //assign uart2_s1_dataavailable_from_sa = uart2_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart2_s1_dataavailable_from_sa = uart2_s1_dataavailable;

  //assign uart2_s1_readyfordata_from_sa = uart2_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart2_s1_readyfordata_from_sa = uart2_s1_readyfordata;

  //uart2_s1_arb_share_counter set values, which is an e_mux
  assign uart2_s1_arb_share_set_values = 1;

  //uart2_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart2_s1_non_bursting_master_requests = DE0_SOPC_clock_7_out_requests_uart2_s1;

  //uart2_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart2_s1_any_bursting_master_saved_grant = 0;

  //uart2_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart2_s1_arb_share_counter_next_value = uart2_s1_firsttransfer ? (uart2_s1_arb_share_set_values - 1) : |uart2_s1_arb_share_counter ? (uart2_s1_arb_share_counter - 1) : 0;

  //uart2_s1_allgrants all slave grants, which is an e_mux
  assign uart2_s1_allgrants = |uart2_s1_grant_vector;

  //uart2_s1_end_xfer assignment, which is an e_assign
  assign uart2_s1_end_xfer = ~(uart2_s1_waits_for_read | uart2_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart2_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart2_s1 = uart2_s1_end_xfer & (~uart2_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart2_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart2_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart2_s1 & uart2_s1_allgrants) | (end_xfer_arb_share_counter_term_uart2_s1 & ~uart2_s1_non_bursting_master_requests);

  //uart2_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart2_s1_arb_share_counter <= 0;
      else if (uart2_s1_arb_counter_enable)
          uart2_s1_arb_share_counter <= uart2_s1_arb_share_counter_next_value;
    end


  //uart2_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart2_s1_slavearbiterlockenable <= 0;
      else if ((|uart2_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart2_s1) | (end_xfer_arb_share_counter_term_uart2_s1 & ~uart2_s1_non_bursting_master_requests))
          uart2_s1_slavearbiterlockenable <= |uart2_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_7/out uart2/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_7_out_arbiterlock = uart2_s1_slavearbiterlockenable & DE0_SOPC_clock_7_out_continuerequest;

  //uart2_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart2_s1_slavearbiterlockenable2 = |uart2_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_7/out uart2/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_7_out_arbiterlock2 = uart2_s1_slavearbiterlockenable2 & DE0_SOPC_clock_7_out_continuerequest;

  //uart2_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart2_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_7_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_7_out_continuerequest = 1;

  assign DE0_SOPC_clock_7_out_qualified_request_uart2_s1 = DE0_SOPC_clock_7_out_requests_uart2_s1;
  //uart2_s1_writedata mux, which is an e_mux
  assign uart2_s1_writedata = DE0_SOPC_clock_7_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_7_out_granted_uart2_s1 = DE0_SOPC_clock_7_out_qualified_request_uart2_s1;

  //DE0_SOPC_clock_7/out saved-grant uart2/s1, which is an e_assign
  assign DE0_SOPC_clock_7_out_saved_grant_uart2_s1 = DE0_SOPC_clock_7_out_requests_uart2_s1;

  //allow new arb cycle for uart2/s1, which is an e_assign
  assign uart2_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart2_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart2_s1_master_qreq_vector = 1;

  assign uart2_s1_begintransfer = uart2_s1_begins_xfer;
  //uart2_s1_reset_n assignment, which is an e_assign
  assign uart2_s1_reset_n = reset_n;

  assign uart2_s1_chipselect = DE0_SOPC_clock_7_out_granted_uart2_s1;
  //uart2_s1_firsttransfer first transaction, which is an e_assign
  assign uart2_s1_firsttransfer = uart2_s1_begins_xfer ? uart2_s1_unreg_firsttransfer : uart2_s1_reg_firsttransfer;

  //uart2_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart2_s1_unreg_firsttransfer = ~(uart2_s1_slavearbiterlockenable & uart2_s1_any_continuerequest);

  //uart2_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart2_s1_reg_firsttransfer <= 1'b1;
      else if (uart2_s1_begins_xfer)
          uart2_s1_reg_firsttransfer <= uart2_s1_unreg_firsttransfer;
    end


  //uart2_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart2_s1_beginbursttransfer_internal = uart2_s1_begins_xfer;

  //~uart2_s1_read_n assignment, which is an e_mux
  assign uart2_s1_read_n = ~(DE0_SOPC_clock_7_out_granted_uart2_s1 & DE0_SOPC_clock_7_out_read);

  //~uart2_s1_write_n assignment, which is an e_mux
  assign uart2_s1_write_n = ~(DE0_SOPC_clock_7_out_granted_uart2_s1 & DE0_SOPC_clock_7_out_write);

  //uart2_s1_address mux, which is an e_mux
  assign uart2_s1_address = DE0_SOPC_clock_7_out_nativeaddress;

  //d1_uart2_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart2_s1_end_xfer <= 1;
      else 
        d1_uart2_s1_end_xfer <= uart2_s1_end_xfer;
    end


  //uart2_s1_waits_for_read in a cycle, which is an e_mux
  assign uart2_s1_waits_for_read = uart2_s1_in_a_read_cycle & uart2_s1_begins_xfer;

  //uart2_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart2_s1_in_a_read_cycle = DE0_SOPC_clock_7_out_granted_uart2_s1 & DE0_SOPC_clock_7_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart2_s1_in_a_read_cycle;

  //uart2_s1_waits_for_write in a cycle, which is an e_mux
  assign uart2_s1_waits_for_write = uart2_s1_in_a_write_cycle & uart2_s1_begins_xfer;

  //uart2_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart2_s1_in_a_write_cycle = DE0_SOPC_clock_7_out_granted_uart2_s1 & DE0_SOPC_clock_7_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart2_s1_in_a_write_cycle;

  assign wait_for_uart2_s1_counter = 0;
  //assign uart2_s1_irq_from_sa = uart2_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart2_s1_irq_from_sa = uart2_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart2/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_reset_pll_cpu_domain_synch_module (
                                                    // inputs:
                                                     clk,
                                                     data_in,
                                                     reset_n,

                                                    // outputs:
                                                     data_out
                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_reset_clk_0_domain_synch_module (
                                                  // inputs:
                                                   clk,
                                                   data_in,
                                                   reset_n,

                                                  // outputs:
                                                   data_out
                                                )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC (
                  // 1) global signals:
                   clk_0,
                   pll_cpu,
                   pll_sdram,
                   reset_n,

                  // the_SEG7
                   avs_s1_export_seg7_from_the_SEG7,

                  // the_buttons
                   in_port_to_the_buttons,

                  // the_lcd_display
                   LCD_E_from_the_lcd_display,
                   LCD_RS_from_the_lcd_display,
                   LCD_RW_from_the_lcd_display,
                   LCD_data_to_and_from_the_lcd_display,

                  // the_led_pwm
                   out_port_from_the_led_pwm,

                  // the_leds
                   out_port_from_the_leds,

                  // the_mode_sw
                   in_port_to_the_mode_sw,

                  // the_sdram
                   zs_addr_from_the_sdram,
                   zs_ba_from_the_sdram,
                   zs_cas_n_from_the_sdram,
                   zs_cke_from_the_sdram,
                   zs_cs_n_from_the_sdram,
                   zs_dq_to_and_from_the_sdram,
                   zs_dqm_from_the_sdram,
                   zs_ras_n_from_the_sdram,
                   zs_we_n_from_the_sdram,

                  // the_switches
                   in_port_to_the_switches,

                  // the_tristate_bridge_avalon_slave
                   address_to_the_cfi_flash,
                   data_to_and_from_the_cfi_flash,
                   read_n_to_the_cfi_flash,
                   select_n_to_the_cfi_flash,
                   write_n_to_the_cfi_flash,

                  // the_uart
                   rxd_to_the_uart,
                   txd_from_the_uart,

                  // the_uart2
                   rxd_to_the_uart2,
                   txd_from_the_uart2
                )
;

  output           LCD_E_from_the_lcd_display;
  output           LCD_RS_from_the_lcd_display;
  output           LCD_RW_from_the_lcd_display;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd_display;
  output  [ 21: 0] address_to_the_cfi_flash;
  output  [ 31: 0] avs_s1_export_seg7_from_the_SEG7;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output  [  7: 0] out_port_from_the_led_pwm;
  output  [  9: 0] out_port_from_the_leds;
  output           pll_cpu;
  output           pll_sdram;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           txd_from_the_uart;
  output           txd_from_the_uart2;
  output           write_n_to_the_cfi_flash;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram;
  output  [  1: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            clk_0;
  input   [  2: 0] in_port_to_the_buttons;
  input            in_port_to_the_mode_sw;
  input   [  8: 0] in_port_to_the_switches;
  input            reset_n;
  input            rxd_to_the_uart;
  input            rxd_to_the_uart2;

  wire    [  3: 0] DE0_SOPC_clock_0_in_address;
  wire    [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  wire             DE0_SOPC_clock_0_in_endofpacket;
  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  wire             DE0_SOPC_clock_0_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  wire             DE0_SOPC_clock_0_in_reset_n;
  wire             DE0_SOPC_clock_0_in_waitrequest;
  wire             DE0_SOPC_clock_0_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_0_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_0_out_byteenable;
  wire             DE0_SOPC_clock_0_out_endofpacket;
  wire             DE0_SOPC_clock_0_out_granted_pll_s1;
  wire    [  2: 0] DE0_SOPC_clock_0_out_nativeaddress;
  wire             DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  wire             DE0_SOPC_clock_0_out_read;
  wire             DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  wire             DE0_SOPC_clock_0_out_requests_pll_s1;
  wire             DE0_SOPC_clock_0_out_reset_n;
  wire             DE0_SOPC_clock_0_out_waitrequest;
  wire             DE0_SOPC_clock_0_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  wire    [ 22: 0] DE0_SOPC_clock_1_in_address;
  wire    [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  wire             DE0_SOPC_clock_1_in_endofpacket;
  wire             DE0_SOPC_clock_1_in_endofpacket_from_sa;
  wire    [ 21: 0] DE0_SOPC_clock_1_in_nativeaddress;
  wire             DE0_SOPC_clock_1_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  wire             DE0_SOPC_clock_1_in_reset_n;
  wire             DE0_SOPC_clock_1_in_waitrequest;
  wire             DE0_SOPC_clock_1_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_1_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_writedata;
  wire    [ 22: 0] DE0_SOPC_clock_1_out_address;
  wire    [ 22: 0] DE0_SOPC_clock_1_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_1_out_byteenable;
  wire             DE0_SOPC_clock_1_out_endofpacket;
  wire             DE0_SOPC_clock_1_out_granted_sdram_s1;
  wire    [ 21: 0] DE0_SOPC_clock_1_out_nativeaddress;
  wire             DE0_SOPC_clock_1_out_qualified_request_sdram_s1;
  wire             DE0_SOPC_clock_1_out_read;
  wire             DE0_SOPC_clock_1_out_read_data_valid_sdram_s1;
  wire             DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  wire             DE0_SOPC_clock_1_out_requests_sdram_s1;
  wire             DE0_SOPC_clock_1_out_reset_n;
  wire             DE0_SOPC_clock_1_out_waitrequest;
  wire             DE0_SOPC_clock_1_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  wire    [ 22: 0] DE0_SOPC_clock_2_in_address;
  wire    [  1: 0] DE0_SOPC_clock_2_in_byteenable;
  wire             DE0_SOPC_clock_2_in_endofpacket;
  wire             DE0_SOPC_clock_2_in_endofpacket_from_sa;
  wire    [ 21: 0] DE0_SOPC_clock_2_in_nativeaddress;
  wire             DE0_SOPC_clock_2_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  wire             DE0_SOPC_clock_2_in_reset_n;
  wire             DE0_SOPC_clock_2_in_waitrequest;
  wire             DE0_SOPC_clock_2_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_2_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_writedata;
  wire    [ 22: 0] DE0_SOPC_clock_2_out_address;
  wire    [ 22: 0] DE0_SOPC_clock_2_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_2_out_byteenable;
  wire             DE0_SOPC_clock_2_out_endofpacket;
  wire             DE0_SOPC_clock_2_out_granted_sdram_s1;
  wire    [ 21: 0] DE0_SOPC_clock_2_out_nativeaddress;
  wire             DE0_SOPC_clock_2_out_qualified_request_sdram_s1;
  wire             DE0_SOPC_clock_2_out_read;
  wire             DE0_SOPC_clock_2_out_read_data_valid_sdram_s1;
  wire             DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 15: 0] DE0_SOPC_clock_2_out_readdata;
  wire             DE0_SOPC_clock_2_out_requests_sdram_s1;
  wire             DE0_SOPC_clock_2_out_reset_n;
  wire             DE0_SOPC_clock_2_out_waitrequest;
  wire             DE0_SOPC_clock_2_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_2_out_writedata;
  wire    [  1: 0] DE0_SOPC_clock_3_in_address;
  wire             DE0_SOPC_clock_3_in_endofpacket;
  wire             DE0_SOPC_clock_3_in_endofpacket_from_sa;
  wire    [  1: 0] DE0_SOPC_clock_3_in_nativeaddress;
  wire             DE0_SOPC_clock_3_in_read;
  wire    [  7: 0] DE0_SOPC_clock_3_in_readdata;
  wire    [  7: 0] DE0_SOPC_clock_3_in_readdata_from_sa;
  wire             DE0_SOPC_clock_3_in_reset_n;
  wire             DE0_SOPC_clock_3_in_waitrequest;
  wire             DE0_SOPC_clock_3_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_3_in_write;
  wire    [  7: 0] DE0_SOPC_clock_3_in_writedata;
  wire    [  1: 0] DE0_SOPC_clock_3_out_address;
  wire    [  1: 0] DE0_SOPC_clock_3_out_address_to_slave;
  wire             DE0_SOPC_clock_3_out_endofpacket;
  wire             DE0_SOPC_clock_3_out_granted_mode_sw_s1;
  wire    [  1: 0] DE0_SOPC_clock_3_out_nativeaddress;
  wire             DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_read;
  wire             DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1;
  wire    [  7: 0] DE0_SOPC_clock_3_out_readdata;
  wire             DE0_SOPC_clock_3_out_requests_mode_sw_s1;
  wire             DE0_SOPC_clock_3_out_reset_n;
  wire             DE0_SOPC_clock_3_out_waitrequest;
  wire             DE0_SOPC_clock_3_out_write;
  wire    [  7: 0] DE0_SOPC_clock_3_out_writedata;
  wire    [  1: 0] DE0_SOPC_clock_4_in_address;
  wire             DE0_SOPC_clock_4_in_endofpacket;
  wire             DE0_SOPC_clock_4_in_endofpacket_from_sa;
  wire    [  1: 0] DE0_SOPC_clock_4_in_nativeaddress;
  wire             DE0_SOPC_clock_4_in_read;
  wire    [  7: 0] DE0_SOPC_clock_4_in_readdata;
  wire    [  7: 0] DE0_SOPC_clock_4_in_readdata_from_sa;
  wire             DE0_SOPC_clock_4_in_reset_n;
  wire             DE0_SOPC_clock_4_in_waitrequest;
  wire             DE0_SOPC_clock_4_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_4_in_write;
  wire    [  7: 0] DE0_SOPC_clock_4_in_writedata;
  wire    [  1: 0] DE0_SOPC_clock_4_out_address;
  wire    [  1: 0] DE0_SOPC_clock_4_out_address_to_slave;
  wire             DE0_SOPC_clock_4_out_endofpacket;
  wire             DE0_SOPC_clock_4_out_granted_lcd_display_control_slave;
  wire    [  1: 0] DE0_SOPC_clock_4_out_nativeaddress;
  wire             DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_read;
  wire             DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave;
  wire    [  7: 0] DE0_SOPC_clock_4_out_readdata;
  wire             DE0_SOPC_clock_4_out_requests_lcd_display_control_slave;
  wire             DE0_SOPC_clock_4_out_reset_n;
  wire             DE0_SOPC_clock_4_out_waitrequest;
  wire             DE0_SOPC_clock_4_out_write;
  wire    [  7: 0] DE0_SOPC_clock_4_out_writedata;
  wire    [  1: 0] DE0_SOPC_clock_5_in_address;
  wire             DE0_SOPC_clock_5_in_endofpacket;
  wire             DE0_SOPC_clock_5_in_endofpacket_from_sa;
  wire    [  1: 0] DE0_SOPC_clock_5_in_nativeaddress;
  wire             DE0_SOPC_clock_5_in_read;
  wire    [  7: 0] DE0_SOPC_clock_5_in_readdata;
  wire    [  7: 0] DE0_SOPC_clock_5_in_readdata_from_sa;
  wire             DE0_SOPC_clock_5_in_reset_n;
  wire             DE0_SOPC_clock_5_in_waitrequest;
  wire             DE0_SOPC_clock_5_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_5_in_write;
  wire    [  7: 0] DE0_SOPC_clock_5_in_writedata;
  wire    [  1: 0] DE0_SOPC_clock_5_out_address;
  wire    [  1: 0] DE0_SOPC_clock_5_out_address_to_slave;
  wire             DE0_SOPC_clock_5_out_endofpacket;
  wire             DE0_SOPC_clock_5_out_granted_led_pwm_s1;
  wire    [  1: 0] DE0_SOPC_clock_5_out_nativeaddress;
  wire             DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_read;
  wire             DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1;
  wire    [  7: 0] DE0_SOPC_clock_5_out_readdata;
  wire             DE0_SOPC_clock_5_out_requests_led_pwm_s1;
  wire             DE0_SOPC_clock_5_out_reset_n;
  wire             DE0_SOPC_clock_5_out_waitrequest;
  wire             DE0_SOPC_clock_5_out_write;
  wire    [  7: 0] DE0_SOPC_clock_5_out_writedata;
  wire    [  4: 0] DE0_SOPC_clock_6_in_address;
  wire    [  3: 0] DE0_SOPC_clock_6_in_byteenable;
  wire             DE0_SOPC_clock_6_in_endofpacket;
  wire             DE0_SOPC_clock_6_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_6_in_nativeaddress;
  wire             DE0_SOPC_clock_6_in_read;
  wire    [ 31: 0] DE0_SOPC_clock_6_in_readdata;
  wire    [ 31: 0] DE0_SOPC_clock_6_in_readdata_from_sa;
  wire             DE0_SOPC_clock_6_in_reset_n;
  wire             DE0_SOPC_clock_6_in_waitrequest;
  wire             DE0_SOPC_clock_6_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_6_in_write;
  wire    [ 31: 0] DE0_SOPC_clock_6_in_writedata;
  wire    [  4: 0] DE0_SOPC_clock_6_out_address;
  wire    [  4: 0] DE0_SOPC_clock_6_out_address_to_slave;
  wire    [  3: 0] DE0_SOPC_clock_6_out_byteenable;
  wire             DE0_SOPC_clock_6_out_endofpacket;
  wire             DE0_SOPC_clock_6_out_granted_dma_control_port_slave;
  wire    [  2: 0] DE0_SOPC_clock_6_out_nativeaddress;
  wire             DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_read;
  wire             DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave;
  wire    [ 31: 0] DE0_SOPC_clock_6_out_readdata;
  wire             DE0_SOPC_clock_6_out_requests_dma_control_port_slave;
  wire             DE0_SOPC_clock_6_out_reset_n;
  wire             DE0_SOPC_clock_6_out_waitrequest;
  wire             DE0_SOPC_clock_6_out_write;
  wire    [ 31: 0] DE0_SOPC_clock_6_out_writedata;
  wire    [  3: 0] DE0_SOPC_clock_7_in_address;
  wire    [  1: 0] DE0_SOPC_clock_7_in_byteenable;
  wire             DE0_SOPC_clock_7_in_endofpacket;
  wire             DE0_SOPC_clock_7_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_7_in_nativeaddress;
  wire             DE0_SOPC_clock_7_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_7_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_7_in_readdata_from_sa;
  wire             DE0_SOPC_clock_7_in_reset_n;
  wire             DE0_SOPC_clock_7_in_waitrequest;
  wire             DE0_SOPC_clock_7_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_7_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_7_in_writedata;
  wire    [  3: 0] DE0_SOPC_clock_7_out_address;
  wire    [  3: 0] DE0_SOPC_clock_7_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_7_out_byteenable;
  wire             DE0_SOPC_clock_7_out_endofpacket;
  wire             DE0_SOPC_clock_7_out_granted_uart2_s1;
  wire    [  2: 0] DE0_SOPC_clock_7_out_nativeaddress;
  wire             DE0_SOPC_clock_7_out_qualified_request_uart2_s1;
  wire             DE0_SOPC_clock_7_out_read;
  wire             DE0_SOPC_clock_7_out_read_data_valid_uart2_s1;
  wire    [ 15: 0] DE0_SOPC_clock_7_out_readdata;
  wire             DE0_SOPC_clock_7_out_requests_uart2_s1;
  wire             DE0_SOPC_clock_7_out_reset_n;
  wire             DE0_SOPC_clock_7_out_waitrequest;
  wire             DE0_SOPC_clock_7_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_7_out_writedata;
  wire    [  2: 0] DE0_SOPC_clock_8_in_address;
  wire             DE0_SOPC_clock_8_in_endofpacket;
  wire             DE0_SOPC_clock_8_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_8_in_nativeaddress;
  wire             DE0_SOPC_clock_8_in_read;
  wire    [  7: 0] DE0_SOPC_clock_8_in_readdata;
  wire    [  7: 0] DE0_SOPC_clock_8_in_readdata_from_sa;
  wire             DE0_SOPC_clock_8_in_reset_n;
  wire             DE0_SOPC_clock_8_in_waitrequest;
  wire             DE0_SOPC_clock_8_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_8_in_write;
  wire    [  7: 0] DE0_SOPC_clock_8_in_writedata;
  wire    [  2: 0] DE0_SOPC_clock_8_out_address;
  wire    [  2: 0] DE0_SOPC_clock_8_out_address_to_slave;
  wire             DE0_SOPC_clock_8_out_endofpacket;
  wire             DE0_SOPC_clock_8_out_granted_SEG7_s1;
  wire    [  2: 0] DE0_SOPC_clock_8_out_nativeaddress;
  wire             DE0_SOPC_clock_8_out_qualified_request_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_read;
  wire             DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1;
  wire    [  7: 0] DE0_SOPC_clock_8_out_readdata;
  wire             DE0_SOPC_clock_8_out_requests_SEG7_s1;
  wire             DE0_SOPC_clock_8_out_reset_n;
  wire             DE0_SOPC_clock_8_out_waitrequest;
  wire             DE0_SOPC_clock_8_out_write;
  wire    [  7: 0] DE0_SOPC_clock_8_out_writedata;
  wire             LCD_E_from_the_lcd_display;
  wire             LCD_RS_from_the_lcd_display;
  wire             LCD_RW_from_the_lcd_display;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_display;
  wire    [  2: 0] SEG7_s1_address;
  wire             SEG7_s1_read;
  wire    [  7: 0] SEG7_s1_readdata;
  wire    [  7: 0] SEG7_s1_readdata_from_sa;
  wire             SEG7_s1_reset;
  wire             SEG7_s1_write;
  wire    [  7: 0] SEG7_s1_writedata;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire    [ 31: 0] avs_s1_export_seg7_from_the_SEG7;
  wire    [  1: 0] buttons_s1_address;
  wire             buttons_s1_chipselect;
  wire             buttons_s1_irq;
  wire             buttons_s1_irq_from_sa;
  wire    [  2: 0] buttons_s1_readdata;
  wire    [  2: 0] buttons_s1_readdata_from_sa;
  wire             buttons_s1_reset_n;
  wire             buttons_s1_write_n;
  wire    [  2: 0] buttons_s1_writedata;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_wait_counter_eq_1;
  wire             clk_0_reset_n;
  wire    [ 24: 0] cpu_data_master_address;
  wire    [ 24: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_granted_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_granted_buttons_s1;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_leds_s1;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_granted_switches_s1;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_timer_s1;
  wire             cpu_data_master_granted_uart_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_qualified_request_buttons_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_leds_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_qualified_request_switches_s1;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_qualified_request_uart_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_read_data_valid_buttons_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_leds_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_switches_s1;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire             cpu_data_master_read_data_valid_uart_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_3_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_4_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_5_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_6_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_7_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_8_in;
  wire             cpu_data_master_requests_buttons_s1;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_leds_s1;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_requests_switches_s1;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_requests_uart_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 24: 0] cpu_instruction_master_address;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_DE0_SOPC_clock_0_in_end_xfer;
  wire             d1_DE0_SOPC_clock_1_in_end_xfer;
  wire             d1_DE0_SOPC_clock_2_in_end_xfer;
  wire             d1_DE0_SOPC_clock_3_in_end_xfer;
  wire             d1_DE0_SOPC_clock_4_in_end_xfer;
  wire             d1_DE0_SOPC_clock_5_in_end_xfer;
  wire             d1_DE0_SOPC_clock_6_in_end_xfer;
  wire             d1_DE0_SOPC_clock_7_in_end_xfer;
  wire             d1_DE0_SOPC_clock_8_in_end_xfer;
  wire             d1_SEG7_s1_end_xfer;
  wire             d1_buttons_s1_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_dma_control_port_slave_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_display_control_slave_end_xfer;
  wire             d1_led_pwm_s1_end_xfer;
  wire             d1_leds_s1_end_xfer;
  wire             d1_mode_sw_s1_end_xfer;
  wire             d1_pll_s1_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_switches_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             d1_tristate_bridge_avalon_slave_end_xfer;
  wire             d1_uart2_s1_end_xfer;
  wire             d1_uart_s1_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire    [  2: 0] dma_control_port_slave_address;
  wire             dma_control_port_slave_chipselect;
  wire             dma_control_port_slave_irq;
  wire             dma_control_port_slave_irq_from_sa;
  wire    [ 23: 0] dma_control_port_slave_readdata;
  wire    [ 23: 0] dma_control_port_slave_readdata_from_sa;
  wire             dma_control_port_slave_readyfordata;
  wire             dma_control_port_slave_readyfordata_from_sa;
  wire             dma_control_port_slave_reset_n;
  wire             dma_control_port_slave_write_n;
  wire    [ 23: 0] dma_control_port_slave_writedata;
  wire    [ 23: 0] dma_read_master_address;
  wire    [ 23: 0] dma_read_master_address_to_slave;
  wire             dma_read_master_chipselect;
  wire             dma_read_master_endofpacket;
  wire             dma_read_master_flush;
  wire             dma_read_master_granted_DE0_SOPC_clock_1_in;
  wire             dma_read_master_latency_counter;
  wire             dma_read_master_qualified_request_DE0_SOPC_clock_1_in;
  wire             dma_read_master_read_data_valid_DE0_SOPC_clock_1_in;
  wire             dma_read_master_read_n;
  wire    [ 15: 0] dma_read_master_readdata;
  wire             dma_read_master_readdatavalid;
  wire             dma_read_master_requests_DE0_SOPC_clock_1_in;
  wire             dma_read_master_waitrequest;
  wire    [ 23: 0] dma_write_master_address;
  wire    [ 23: 0] dma_write_master_address_to_slave;
  wire    [  1: 0] dma_write_master_byteenable;
  wire             dma_write_master_chipselect;
  wire             dma_write_master_endofpacket;
  wire             dma_write_master_granted_DE0_SOPC_clock_2_in;
  wire             dma_write_master_qualified_request_DE0_SOPC_clock_2_in;
  wire             dma_write_master_requests_DE0_SOPC_clock_2_in;
  wire             dma_write_master_waitrequest;
  wire             dma_write_master_write_n;
  wire    [ 15: 0] dma_write_master_writedata;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_display_control_slave_address;
  wire             lcd_display_control_slave_begintransfer;
  wire             lcd_display_control_slave_read;
  wire    [  7: 0] lcd_display_control_slave_readdata;
  wire    [  7: 0] lcd_display_control_slave_readdata_from_sa;
  wire             lcd_display_control_slave_wait_counter_eq_0;
  wire             lcd_display_control_slave_write;
  wire    [  7: 0] lcd_display_control_slave_writedata;
  wire    [  1: 0] led_pwm_s1_address;
  wire             led_pwm_s1_chipselect;
  wire    [  7: 0] led_pwm_s1_readdata;
  wire    [  7: 0] led_pwm_s1_readdata_from_sa;
  wire             led_pwm_s1_reset_n;
  wire             led_pwm_s1_write_n;
  wire    [  7: 0] led_pwm_s1_writedata;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_chipselect;
  wire    [  9: 0] leds_s1_readdata;
  wire    [  9: 0] leds_s1_readdata_from_sa;
  wire             leds_s1_reset_n;
  wire             leds_s1_write_n;
  wire    [  9: 0] leds_s1_writedata;
  wire    [  1: 0] mode_sw_s1_address;
  wire             mode_sw_s1_readdata;
  wire             mode_sw_s1_readdata_from_sa;
  wire             mode_sw_s1_reset_n;
  wire             out_clk_pll_c0;
  wire             out_clk_pll_c1;
  wire    [  7: 0] out_port_from_the_led_pwm;
  wire    [  9: 0] out_port_from_the_leds;
  wire             pll_cpu;
  wire             pll_cpu_reset_n;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_chipselect;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest;
  wire             pll_s1_resetrequest_from_sa;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             pll_sdram;
  wire             read_n_to_the_cfi_flash;
  wire             registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [  1: 0] switches_s1_address;
  wire    [  8: 0] switches_s1_readdata;
  wire    [  8: 0] switches_s1_readdata_from_sa;
  wire             switches_s1_reset_n;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             txd_from_the_uart;
  wire             txd_from_the_uart2;
  wire    [  2: 0] uart2_s1_address;
  wire             uart2_s1_begintransfer;
  wire             uart2_s1_chipselect;
  wire             uart2_s1_dataavailable;
  wire             uart2_s1_dataavailable_from_sa;
  wire             uart2_s1_irq;
  wire             uart2_s1_irq_from_sa;
  wire             uart2_s1_read_n;
  wire    [ 15: 0] uart2_s1_readdata;
  wire    [ 15: 0] uart2_s1_readdata_from_sa;
  wire             uart2_s1_readyfordata;
  wire             uart2_s1_readyfordata_from_sa;
  wire             uart2_s1_reset_n;
  wire             uart2_s1_write_n;
  wire    [ 15: 0] uart2_s1_writedata;
  wire    [  2: 0] uart_s1_address;
  wire             uart_s1_begintransfer;
  wire             uart_s1_chipselect;
  wire             uart_s1_dataavailable;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_irq;
  wire             uart_s1_irq_from_sa;
  wire             uart_s1_read_n;
  wire    [ 15: 0] uart_s1_readdata;
  wire    [ 15: 0] uart_s1_readdata_from_sa;
  wire             uart_s1_readyfordata;
  wire             uart_s1_readyfordata_from_sa;
  wire             uart_s1_reset_n;
  wire             uart_s1_write_n;
  wire    [ 15: 0] uart_s1_writedata;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  DE0_SOPC_clock_0_in_arbitrator the_DE0_SOPC_clock_0_in
    (
      .DE0_SOPC_clock_0_in_address                           (DE0_SOPC_clock_0_in_address),
      .DE0_SOPC_clock_0_in_byteenable                        (DE0_SOPC_clock_0_in_byteenable),
      .DE0_SOPC_clock_0_in_endofpacket                       (DE0_SOPC_clock_0_in_endofpacket),
      .DE0_SOPC_clock_0_in_endofpacket_from_sa               (DE0_SOPC_clock_0_in_endofpacket_from_sa),
      .DE0_SOPC_clock_0_in_nativeaddress                     (DE0_SOPC_clock_0_in_nativeaddress),
      .DE0_SOPC_clock_0_in_read                              (DE0_SOPC_clock_0_in_read),
      .DE0_SOPC_clock_0_in_readdata                          (DE0_SOPC_clock_0_in_readdata),
      .DE0_SOPC_clock_0_in_readdata_from_sa                  (DE0_SOPC_clock_0_in_readdata_from_sa),
      .DE0_SOPC_clock_0_in_reset_n                           (DE0_SOPC_clock_0_in_reset_n),
      .DE0_SOPC_clock_0_in_waitrequest                       (DE0_SOPC_clock_0_in_waitrequest),
      .DE0_SOPC_clock_0_in_waitrequest_from_sa               (DE0_SOPC_clock_0_in_waitrequest_from_sa),
      .DE0_SOPC_clock_0_in_write                             (DE0_SOPC_clock_0_in_write),
      .DE0_SOPC_clock_0_in_writedata                         (DE0_SOPC_clock_0_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_0_in           (cpu_data_master_granted_DE0_SOPC_clock_0_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_0_in (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in),
      .cpu_data_master_requests_DE0_SOPC_clock_0_in          (cpu_data_master_requests_DE0_SOPC_clock_0_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_0_in_end_xfer                       (d1_DE0_SOPC_clock_0_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_0_out_arbitrator the_DE0_SOPC_clock_0_out
    (
      .DE0_SOPC_clock_0_out_address                  (DE0_SOPC_clock_0_out_address),
      .DE0_SOPC_clock_0_out_address_to_slave         (DE0_SOPC_clock_0_out_address_to_slave),
      .DE0_SOPC_clock_0_out_byteenable               (DE0_SOPC_clock_0_out_byteenable),
      .DE0_SOPC_clock_0_out_granted_pll_s1           (DE0_SOPC_clock_0_out_granted_pll_s1),
      .DE0_SOPC_clock_0_out_qualified_request_pll_s1 (DE0_SOPC_clock_0_out_qualified_request_pll_s1),
      .DE0_SOPC_clock_0_out_read                     (DE0_SOPC_clock_0_out_read),
      .DE0_SOPC_clock_0_out_read_data_valid_pll_s1   (DE0_SOPC_clock_0_out_read_data_valid_pll_s1),
      .DE0_SOPC_clock_0_out_readdata                 (DE0_SOPC_clock_0_out_readdata),
      .DE0_SOPC_clock_0_out_requests_pll_s1          (DE0_SOPC_clock_0_out_requests_pll_s1),
      .DE0_SOPC_clock_0_out_reset_n                  (DE0_SOPC_clock_0_out_reset_n),
      .DE0_SOPC_clock_0_out_waitrequest              (DE0_SOPC_clock_0_out_waitrequest),
      .DE0_SOPC_clock_0_out_write                    (DE0_SOPC_clock_0_out_write),
      .DE0_SOPC_clock_0_out_writedata                (DE0_SOPC_clock_0_out_writedata),
      .clk                                           (clk_0),
      .d1_pll_s1_end_xfer                            (d1_pll_s1_end_xfer),
      .pll_s1_readdata_from_sa                       (pll_s1_readdata_from_sa),
      .reset_n                                       (clk_0_reset_n)
    );

  DE0_SOPC_clock_0 the_DE0_SOPC_clock_0
    (
      .master_address       (DE0_SOPC_clock_0_out_address),
      .master_byteenable    (DE0_SOPC_clock_0_out_byteenable),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_0_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_0_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_0_out_read),
      .master_readdata      (DE0_SOPC_clock_0_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_0_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_0_out_waitrequest),
      .master_write         (DE0_SOPC_clock_0_out_write),
      .master_writedata     (DE0_SOPC_clock_0_out_writedata),
      .slave_address        (DE0_SOPC_clock_0_in_address),
      .slave_byteenable     (DE0_SOPC_clock_0_in_byteenable),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_0_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_0_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_0_in_read),
      .slave_readdata       (DE0_SOPC_clock_0_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_0_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_0_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_0_in_write),
      .slave_writedata      (DE0_SOPC_clock_0_in_writedata)
    );

  DE0_SOPC_clock_1_in_arbitrator the_DE0_SOPC_clock_1_in
    (
      .DE0_SOPC_clock_1_in_address                           (DE0_SOPC_clock_1_in_address),
      .DE0_SOPC_clock_1_in_byteenable                        (DE0_SOPC_clock_1_in_byteenable),
      .DE0_SOPC_clock_1_in_endofpacket                       (DE0_SOPC_clock_1_in_endofpacket),
      .DE0_SOPC_clock_1_in_endofpacket_from_sa               (DE0_SOPC_clock_1_in_endofpacket_from_sa),
      .DE0_SOPC_clock_1_in_nativeaddress                     (DE0_SOPC_clock_1_in_nativeaddress),
      .DE0_SOPC_clock_1_in_read                              (DE0_SOPC_clock_1_in_read),
      .DE0_SOPC_clock_1_in_readdata                          (DE0_SOPC_clock_1_in_readdata),
      .DE0_SOPC_clock_1_in_readdata_from_sa                  (DE0_SOPC_clock_1_in_readdata_from_sa),
      .DE0_SOPC_clock_1_in_reset_n                           (DE0_SOPC_clock_1_in_reset_n),
      .DE0_SOPC_clock_1_in_waitrequest                       (DE0_SOPC_clock_1_in_waitrequest),
      .DE0_SOPC_clock_1_in_waitrequest_from_sa               (DE0_SOPC_clock_1_in_waitrequest_from_sa),
      .DE0_SOPC_clock_1_in_write                             (DE0_SOPC_clock_1_in_write),
      .clk                                                   (clk_0),
      .d1_DE0_SOPC_clock_1_in_end_xfer                       (d1_DE0_SOPC_clock_1_in_end_xfer),
      .dma_read_master_address_to_slave                      (dma_read_master_address_to_slave),
      .dma_read_master_chipselect                            (dma_read_master_chipselect),
      .dma_read_master_granted_DE0_SOPC_clock_1_in           (dma_read_master_granted_DE0_SOPC_clock_1_in),
      .dma_read_master_latency_counter                       (dma_read_master_latency_counter),
      .dma_read_master_qualified_request_DE0_SOPC_clock_1_in (dma_read_master_qualified_request_DE0_SOPC_clock_1_in),
      .dma_read_master_read_data_valid_DE0_SOPC_clock_1_in   (dma_read_master_read_data_valid_DE0_SOPC_clock_1_in),
      .dma_read_master_read_n                                (dma_read_master_read_n),
      .dma_read_master_requests_DE0_SOPC_clock_1_in          (dma_read_master_requests_DE0_SOPC_clock_1_in),
      .reset_n                                               (clk_0_reset_n)
    );

  DE0_SOPC_clock_1_out_arbitrator the_DE0_SOPC_clock_1_out
    (
      .DE0_SOPC_clock_1_out_address                                 (DE0_SOPC_clock_1_out_address),
      .DE0_SOPC_clock_1_out_address_to_slave                        (DE0_SOPC_clock_1_out_address_to_slave),
      .DE0_SOPC_clock_1_out_byteenable                              (DE0_SOPC_clock_1_out_byteenable),
      .DE0_SOPC_clock_1_out_granted_sdram_s1                        (DE0_SOPC_clock_1_out_granted_sdram_s1),
      .DE0_SOPC_clock_1_out_qualified_request_sdram_s1              (DE0_SOPC_clock_1_out_qualified_request_sdram_s1),
      .DE0_SOPC_clock_1_out_read                                    (DE0_SOPC_clock_1_out_read),
      .DE0_SOPC_clock_1_out_read_data_valid_sdram_s1                (DE0_SOPC_clock_1_out_read_data_valid_sdram_s1),
      .DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register (DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .DE0_SOPC_clock_1_out_readdata                                (DE0_SOPC_clock_1_out_readdata),
      .DE0_SOPC_clock_1_out_requests_sdram_s1                       (DE0_SOPC_clock_1_out_requests_sdram_s1),
      .DE0_SOPC_clock_1_out_reset_n                                 (DE0_SOPC_clock_1_out_reset_n),
      .DE0_SOPC_clock_1_out_waitrequest                             (DE0_SOPC_clock_1_out_waitrequest),
      .DE0_SOPC_clock_1_out_write                                   (DE0_SOPC_clock_1_out_write),
      .DE0_SOPC_clock_1_out_writedata                               (DE0_SOPC_clock_1_out_writedata),
      .clk                                                          (pll_cpu),
      .d1_sdram_s1_end_xfer                                         (d1_sdram_s1_end_xfer),
      .reset_n                                                      (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                    (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                 (sdram_s1_waitrequest_from_sa)
    );

  DE0_SOPC_clock_1 the_DE0_SOPC_clock_1
    (
      .master_address       (DE0_SOPC_clock_1_out_address),
      .master_byteenable    (DE0_SOPC_clock_1_out_byteenable),
      .master_clk           (pll_cpu),
      .master_endofpacket   (DE0_SOPC_clock_1_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_1_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_1_out_read),
      .master_readdata      (DE0_SOPC_clock_1_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_1_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_1_out_waitrequest),
      .master_write         (DE0_SOPC_clock_1_out_write),
      .master_writedata     (DE0_SOPC_clock_1_out_writedata),
      .slave_address        (DE0_SOPC_clock_1_in_address),
      .slave_byteenable     (DE0_SOPC_clock_1_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (DE0_SOPC_clock_1_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_1_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_1_in_read),
      .slave_readdata       (DE0_SOPC_clock_1_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_1_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_1_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_1_in_write),
      .slave_writedata      (DE0_SOPC_clock_1_in_writedata)
    );

  DE0_SOPC_clock_2_in_arbitrator the_DE0_SOPC_clock_2_in
    (
      .DE0_SOPC_clock_2_in_address                            (DE0_SOPC_clock_2_in_address),
      .DE0_SOPC_clock_2_in_byteenable                         (DE0_SOPC_clock_2_in_byteenable),
      .DE0_SOPC_clock_2_in_endofpacket                        (DE0_SOPC_clock_2_in_endofpacket),
      .DE0_SOPC_clock_2_in_endofpacket_from_sa                (DE0_SOPC_clock_2_in_endofpacket_from_sa),
      .DE0_SOPC_clock_2_in_nativeaddress                      (DE0_SOPC_clock_2_in_nativeaddress),
      .DE0_SOPC_clock_2_in_read                               (DE0_SOPC_clock_2_in_read),
      .DE0_SOPC_clock_2_in_readdata                           (DE0_SOPC_clock_2_in_readdata),
      .DE0_SOPC_clock_2_in_readdata_from_sa                   (DE0_SOPC_clock_2_in_readdata_from_sa),
      .DE0_SOPC_clock_2_in_reset_n                            (DE0_SOPC_clock_2_in_reset_n),
      .DE0_SOPC_clock_2_in_waitrequest                        (DE0_SOPC_clock_2_in_waitrequest),
      .DE0_SOPC_clock_2_in_waitrequest_from_sa                (DE0_SOPC_clock_2_in_waitrequest_from_sa),
      .DE0_SOPC_clock_2_in_write                              (DE0_SOPC_clock_2_in_write),
      .DE0_SOPC_clock_2_in_writedata                          (DE0_SOPC_clock_2_in_writedata),
      .clk                                                    (clk_0),
      .d1_DE0_SOPC_clock_2_in_end_xfer                        (d1_DE0_SOPC_clock_2_in_end_xfer),
      .dma_write_master_address_to_slave                      (dma_write_master_address_to_slave),
      .dma_write_master_byteenable                            (dma_write_master_byteenable),
      .dma_write_master_chipselect                            (dma_write_master_chipselect),
      .dma_write_master_granted_DE0_SOPC_clock_2_in           (dma_write_master_granted_DE0_SOPC_clock_2_in),
      .dma_write_master_qualified_request_DE0_SOPC_clock_2_in (dma_write_master_qualified_request_DE0_SOPC_clock_2_in),
      .dma_write_master_requests_DE0_SOPC_clock_2_in          (dma_write_master_requests_DE0_SOPC_clock_2_in),
      .dma_write_master_write_n                               (dma_write_master_write_n),
      .dma_write_master_writedata                             (dma_write_master_writedata),
      .reset_n                                                (clk_0_reset_n)
    );

  DE0_SOPC_clock_2_out_arbitrator the_DE0_SOPC_clock_2_out
    (
      .DE0_SOPC_clock_2_out_address                                 (DE0_SOPC_clock_2_out_address),
      .DE0_SOPC_clock_2_out_address_to_slave                        (DE0_SOPC_clock_2_out_address_to_slave),
      .DE0_SOPC_clock_2_out_byteenable                              (DE0_SOPC_clock_2_out_byteenable),
      .DE0_SOPC_clock_2_out_granted_sdram_s1                        (DE0_SOPC_clock_2_out_granted_sdram_s1),
      .DE0_SOPC_clock_2_out_qualified_request_sdram_s1              (DE0_SOPC_clock_2_out_qualified_request_sdram_s1),
      .DE0_SOPC_clock_2_out_read                                    (DE0_SOPC_clock_2_out_read),
      .DE0_SOPC_clock_2_out_read_data_valid_sdram_s1                (DE0_SOPC_clock_2_out_read_data_valid_sdram_s1),
      .DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register (DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register),
      .DE0_SOPC_clock_2_out_readdata                                (DE0_SOPC_clock_2_out_readdata),
      .DE0_SOPC_clock_2_out_requests_sdram_s1                       (DE0_SOPC_clock_2_out_requests_sdram_s1),
      .DE0_SOPC_clock_2_out_reset_n                                 (DE0_SOPC_clock_2_out_reset_n),
      .DE0_SOPC_clock_2_out_waitrequest                             (DE0_SOPC_clock_2_out_waitrequest),
      .DE0_SOPC_clock_2_out_write                                   (DE0_SOPC_clock_2_out_write),
      .DE0_SOPC_clock_2_out_writedata                               (DE0_SOPC_clock_2_out_writedata),
      .clk                                                          (pll_cpu),
      .d1_sdram_s1_end_xfer                                         (d1_sdram_s1_end_xfer),
      .reset_n                                                      (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                    (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                 (sdram_s1_waitrequest_from_sa)
    );

  DE0_SOPC_clock_2 the_DE0_SOPC_clock_2
    (
      .master_address       (DE0_SOPC_clock_2_out_address),
      .master_byteenable    (DE0_SOPC_clock_2_out_byteenable),
      .master_clk           (pll_cpu),
      .master_endofpacket   (DE0_SOPC_clock_2_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_2_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_2_out_read),
      .master_readdata      (DE0_SOPC_clock_2_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_2_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_2_out_waitrequest),
      .master_write         (DE0_SOPC_clock_2_out_write),
      .master_writedata     (DE0_SOPC_clock_2_out_writedata),
      .slave_address        (DE0_SOPC_clock_2_in_address),
      .slave_byteenable     (DE0_SOPC_clock_2_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (DE0_SOPC_clock_2_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_2_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_2_in_read),
      .slave_readdata       (DE0_SOPC_clock_2_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_2_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_2_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_2_in_write),
      .slave_writedata      (DE0_SOPC_clock_2_in_writedata)
    );

  DE0_SOPC_clock_3_in_arbitrator the_DE0_SOPC_clock_3_in
    (
      .DE0_SOPC_clock_3_in_address                           (DE0_SOPC_clock_3_in_address),
      .DE0_SOPC_clock_3_in_endofpacket                       (DE0_SOPC_clock_3_in_endofpacket),
      .DE0_SOPC_clock_3_in_endofpacket_from_sa               (DE0_SOPC_clock_3_in_endofpacket_from_sa),
      .DE0_SOPC_clock_3_in_nativeaddress                     (DE0_SOPC_clock_3_in_nativeaddress),
      .DE0_SOPC_clock_3_in_read                              (DE0_SOPC_clock_3_in_read),
      .DE0_SOPC_clock_3_in_readdata                          (DE0_SOPC_clock_3_in_readdata),
      .DE0_SOPC_clock_3_in_readdata_from_sa                  (DE0_SOPC_clock_3_in_readdata_from_sa),
      .DE0_SOPC_clock_3_in_reset_n                           (DE0_SOPC_clock_3_in_reset_n),
      .DE0_SOPC_clock_3_in_waitrequest                       (DE0_SOPC_clock_3_in_waitrequest),
      .DE0_SOPC_clock_3_in_waitrequest_from_sa               (DE0_SOPC_clock_3_in_waitrequest_from_sa),
      .DE0_SOPC_clock_3_in_write                             (DE0_SOPC_clock_3_in_write),
      .DE0_SOPC_clock_3_in_writedata                         (DE0_SOPC_clock_3_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_3_in           (cpu_data_master_granted_DE0_SOPC_clock_3_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_3_in (cpu_data_master_qualified_request_DE0_SOPC_clock_3_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in),
      .cpu_data_master_requests_DE0_SOPC_clock_3_in          (cpu_data_master_requests_DE0_SOPC_clock_3_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_3_in_end_xfer                       (d1_DE0_SOPC_clock_3_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_3_out_arbitrator the_DE0_SOPC_clock_3_out
    (
      .DE0_SOPC_clock_3_out_address                      (DE0_SOPC_clock_3_out_address),
      .DE0_SOPC_clock_3_out_address_to_slave             (DE0_SOPC_clock_3_out_address_to_slave),
      .DE0_SOPC_clock_3_out_granted_mode_sw_s1           (DE0_SOPC_clock_3_out_granted_mode_sw_s1),
      .DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1 (DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1),
      .DE0_SOPC_clock_3_out_read                         (DE0_SOPC_clock_3_out_read),
      .DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1   (DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1),
      .DE0_SOPC_clock_3_out_readdata                     (DE0_SOPC_clock_3_out_readdata),
      .DE0_SOPC_clock_3_out_requests_mode_sw_s1          (DE0_SOPC_clock_3_out_requests_mode_sw_s1),
      .DE0_SOPC_clock_3_out_reset_n                      (DE0_SOPC_clock_3_out_reset_n),
      .DE0_SOPC_clock_3_out_waitrequest                  (DE0_SOPC_clock_3_out_waitrequest),
      .DE0_SOPC_clock_3_out_write                        (DE0_SOPC_clock_3_out_write),
      .DE0_SOPC_clock_3_out_writedata                    (DE0_SOPC_clock_3_out_writedata),
      .clk                                               (clk_0),
      .d1_mode_sw_s1_end_xfer                            (d1_mode_sw_s1_end_xfer),
      .mode_sw_s1_readdata_from_sa                       (mode_sw_s1_readdata_from_sa),
      .reset_n                                           (clk_0_reset_n)
    );

  DE0_SOPC_clock_3 the_DE0_SOPC_clock_3
    (
      .master_address       (DE0_SOPC_clock_3_out_address),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_3_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_3_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_3_out_read),
      .master_readdata      (DE0_SOPC_clock_3_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_3_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_3_out_waitrequest),
      .master_write         (DE0_SOPC_clock_3_out_write),
      .master_writedata     (DE0_SOPC_clock_3_out_writedata),
      .slave_address        (DE0_SOPC_clock_3_in_address),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_3_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_3_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_3_in_read),
      .slave_readdata       (DE0_SOPC_clock_3_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_3_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_3_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_3_in_write),
      .slave_writedata      (DE0_SOPC_clock_3_in_writedata)
    );

  DE0_SOPC_clock_4_in_arbitrator the_DE0_SOPC_clock_4_in
    (
      .DE0_SOPC_clock_4_in_address                           (DE0_SOPC_clock_4_in_address),
      .DE0_SOPC_clock_4_in_endofpacket                       (DE0_SOPC_clock_4_in_endofpacket),
      .DE0_SOPC_clock_4_in_endofpacket_from_sa               (DE0_SOPC_clock_4_in_endofpacket_from_sa),
      .DE0_SOPC_clock_4_in_nativeaddress                     (DE0_SOPC_clock_4_in_nativeaddress),
      .DE0_SOPC_clock_4_in_read                              (DE0_SOPC_clock_4_in_read),
      .DE0_SOPC_clock_4_in_readdata                          (DE0_SOPC_clock_4_in_readdata),
      .DE0_SOPC_clock_4_in_readdata_from_sa                  (DE0_SOPC_clock_4_in_readdata_from_sa),
      .DE0_SOPC_clock_4_in_reset_n                           (DE0_SOPC_clock_4_in_reset_n),
      .DE0_SOPC_clock_4_in_waitrequest                       (DE0_SOPC_clock_4_in_waitrequest),
      .DE0_SOPC_clock_4_in_waitrequest_from_sa               (DE0_SOPC_clock_4_in_waitrequest_from_sa),
      .DE0_SOPC_clock_4_in_write                             (DE0_SOPC_clock_4_in_write),
      .DE0_SOPC_clock_4_in_writedata                         (DE0_SOPC_clock_4_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_4_in           (cpu_data_master_granted_DE0_SOPC_clock_4_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_4_in (cpu_data_master_qualified_request_DE0_SOPC_clock_4_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in),
      .cpu_data_master_requests_DE0_SOPC_clock_4_in          (cpu_data_master_requests_DE0_SOPC_clock_4_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_4_in_end_xfer                       (d1_DE0_SOPC_clock_4_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_4_out_arbitrator the_DE0_SOPC_clock_4_out
    (
      .DE0_SOPC_clock_4_out_address                                     (DE0_SOPC_clock_4_out_address),
      .DE0_SOPC_clock_4_out_address_to_slave                            (DE0_SOPC_clock_4_out_address_to_slave),
      .DE0_SOPC_clock_4_out_granted_lcd_display_control_slave           (DE0_SOPC_clock_4_out_granted_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave (DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_read                                        (DE0_SOPC_clock_4_out_read),
      .DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave   (DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_readdata                                    (DE0_SOPC_clock_4_out_readdata),
      .DE0_SOPC_clock_4_out_requests_lcd_display_control_slave          (DE0_SOPC_clock_4_out_requests_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_reset_n                                     (DE0_SOPC_clock_4_out_reset_n),
      .DE0_SOPC_clock_4_out_waitrequest                                 (DE0_SOPC_clock_4_out_waitrequest),
      .DE0_SOPC_clock_4_out_write                                       (DE0_SOPC_clock_4_out_write),
      .DE0_SOPC_clock_4_out_writedata                                   (DE0_SOPC_clock_4_out_writedata),
      .clk                                                              (clk_0),
      .d1_lcd_display_control_slave_end_xfer                            (d1_lcd_display_control_slave_end_xfer),
      .lcd_display_control_slave_readdata_from_sa                       (lcd_display_control_slave_readdata_from_sa),
      .lcd_display_control_slave_wait_counter_eq_0                      (lcd_display_control_slave_wait_counter_eq_0),
      .reset_n                                                          (clk_0_reset_n)
    );

  DE0_SOPC_clock_4 the_DE0_SOPC_clock_4
    (
      .master_address       (DE0_SOPC_clock_4_out_address),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_4_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_4_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_4_out_read),
      .master_readdata      (DE0_SOPC_clock_4_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_4_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_4_out_waitrequest),
      .master_write         (DE0_SOPC_clock_4_out_write),
      .master_writedata     (DE0_SOPC_clock_4_out_writedata),
      .slave_address        (DE0_SOPC_clock_4_in_address),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_4_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_4_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_4_in_read),
      .slave_readdata       (DE0_SOPC_clock_4_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_4_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_4_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_4_in_write),
      .slave_writedata      (DE0_SOPC_clock_4_in_writedata)
    );

  DE0_SOPC_clock_5_in_arbitrator the_DE0_SOPC_clock_5_in
    (
      .DE0_SOPC_clock_5_in_address                           (DE0_SOPC_clock_5_in_address),
      .DE0_SOPC_clock_5_in_endofpacket                       (DE0_SOPC_clock_5_in_endofpacket),
      .DE0_SOPC_clock_5_in_endofpacket_from_sa               (DE0_SOPC_clock_5_in_endofpacket_from_sa),
      .DE0_SOPC_clock_5_in_nativeaddress                     (DE0_SOPC_clock_5_in_nativeaddress),
      .DE0_SOPC_clock_5_in_read                              (DE0_SOPC_clock_5_in_read),
      .DE0_SOPC_clock_5_in_readdata                          (DE0_SOPC_clock_5_in_readdata),
      .DE0_SOPC_clock_5_in_readdata_from_sa                  (DE0_SOPC_clock_5_in_readdata_from_sa),
      .DE0_SOPC_clock_5_in_reset_n                           (DE0_SOPC_clock_5_in_reset_n),
      .DE0_SOPC_clock_5_in_waitrequest                       (DE0_SOPC_clock_5_in_waitrequest),
      .DE0_SOPC_clock_5_in_waitrequest_from_sa               (DE0_SOPC_clock_5_in_waitrequest_from_sa),
      .DE0_SOPC_clock_5_in_write                             (DE0_SOPC_clock_5_in_write),
      .DE0_SOPC_clock_5_in_writedata                         (DE0_SOPC_clock_5_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_5_in           (cpu_data_master_granted_DE0_SOPC_clock_5_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_5_in (cpu_data_master_qualified_request_DE0_SOPC_clock_5_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in),
      .cpu_data_master_requests_DE0_SOPC_clock_5_in          (cpu_data_master_requests_DE0_SOPC_clock_5_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_5_in_end_xfer                       (d1_DE0_SOPC_clock_5_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_5_out_arbitrator the_DE0_SOPC_clock_5_out
    (
      .DE0_SOPC_clock_5_out_address                      (DE0_SOPC_clock_5_out_address),
      .DE0_SOPC_clock_5_out_address_to_slave             (DE0_SOPC_clock_5_out_address_to_slave),
      .DE0_SOPC_clock_5_out_granted_led_pwm_s1           (DE0_SOPC_clock_5_out_granted_led_pwm_s1),
      .DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1 (DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1),
      .DE0_SOPC_clock_5_out_read                         (DE0_SOPC_clock_5_out_read),
      .DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1   (DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1),
      .DE0_SOPC_clock_5_out_readdata                     (DE0_SOPC_clock_5_out_readdata),
      .DE0_SOPC_clock_5_out_requests_led_pwm_s1          (DE0_SOPC_clock_5_out_requests_led_pwm_s1),
      .DE0_SOPC_clock_5_out_reset_n                      (DE0_SOPC_clock_5_out_reset_n),
      .DE0_SOPC_clock_5_out_waitrequest                  (DE0_SOPC_clock_5_out_waitrequest),
      .DE0_SOPC_clock_5_out_write                        (DE0_SOPC_clock_5_out_write),
      .DE0_SOPC_clock_5_out_writedata                    (DE0_SOPC_clock_5_out_writedata),
      .clk                                               (clk_0),
      .d1_led_pwm_s1_end_xfer                            (d1_led_pwm_s1_end_xfer),
      .led_pwm_s1_readdata_from_sa                       (led_pwm_s1_readdata_from_sa),
      .reset_n                                           (clk_0_reset_n)
    );

  DE0_SOPC_clock_5 the_DE0_SOPC_clock_5
    (
      .master_address       (DE0_SOPC_clock_5_out_address),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_5_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_5_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_5_out_read),
      .master_readdata      (DE0_SOPC_clock_5_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_5_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_5_out_waitrequest),
      .master_write         (DE0_SOPC_clock_5_out_write),
      .master_writedata     (DE0_SOPC_clock_5_out_writedata),
      .slave_address        (DE0_SOPC_clock_5_in_address),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_5_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_5_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_5_in_read),
      .slave_readdata       (DE0_SOPC_clock_5_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_5_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_5_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_5_in_write),
      .slave_writedata      (DE0_SOPC_clock_5_in_writedata)
    );

  DE0_SOPC_clock_6_in_arbitrator the_DE0_SOPC_clock_6_in
    (
      .DE0_SOPC_clock_6_in_address                           (DE0_SOPC_clock_6_in_address),
      .DE0_SOPC_clock_6_in_byteenable                        (DE0_SOPC_clock_6_in_byteenable),
      .DE0_SOPC_clock_6_in_endofpacket                       (DE0_SOPC_clock_6_in_endofpacket),
      .DE0_SOPC_clock_6_in_endofpacket_from_sa               (DE0_SOPC_clock_6_in_endofpacket_from_sa),
      .DE0_SOPC_clock_6_in_nativeaddress                     (DE0_SOPC_clock_6_in_nativeaddress),
      .DE0_SOPC_clock_6_in_read                              (DE0_SOPC_clock_6_in_read),
      .DE0_SOPC_clock_6_in_readdata                          (DE0_SOPC_clock_6_in_readdata),
      .DE0_SOPC_clock_6_in_readdata_from_sa                  (DE0_SOPC_clock_6_in_readdata_from_sa),
      .DE0_SOPC_clock_6_in_reset_n                           (DE0_SOPC_clock_6_in_reset_n),
      .DE0_SOPC_clock_6_in_waitrequest                       (DE0_SOPC_clock_6_in_waitrequest),
      .DE0_SOPC_clock_6_in_waitrequest_from_sa               (DE0_SOPC_clock_6_in_waitrequest_from_sa),
      .DE0_SOPC_clock_6_in_write                             (DE0_SOPC_clock_6_in_write),
      .DE0_SOPC_clock_6_in_writedata                         (DE0_SOPC_clock_6_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_6_in           (cpu_data_master_granted_DE0_SOPC_clock_6_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_6_in (cpu_data_master_qualified_request_DE0_SOPC_clock_6_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in),
      .cpu_data_master_requests_DE0_SOPC_clock_6_in          (cpu_data_master_requests_DE0_SOPC_clock_6_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_6_in_end_xfer                       (d1_DE0_SOPC_clock_6_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_6_out_arbitrator the_DE0_SOPC_clock_6_out
    (
      .DE0_SOPC_clock_6_out_address                                  (DE0_SOPC_clock_6_out_address),
      .DE0_SOPC_clock_6_out_address_to_slave                         (DE0_SOPC_clock_6_out_address_to_slave),
      .DE0_SOPC_clock_6_out_byteenable                               (DE0_SOPC_clock_6_out_byteenable),
      .DE0_SOPC_clock_6_out_granted_dma_control_port_slave           (DE0_SOPC_clock_6_out_granted_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave (DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_read                                     (DE0_SOPC_clock_6_out_read),
      .DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave   (DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_readdata                                 (DE0_SOPC_clock_6_out_readdata),
      .DE0_SOPC_clock_6_out_requests_dma_control_port_slave          (DE0_SOPC_clock_6_out_requests_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_reset_n                                  (DE0_SOPC_clock_6_out_reset_n),
      .DE0_SOPC_clock_6_out_waitrequest                              (DE0_SOPC_clock_6_out_waitrequest),
      .DE0_SOPC_clock_6_out_write                                    (DE0_SOPC_clock_6_out_write),
      .DE0_SOPC_clock_6_out_writedata                                (DE0_SOPC_clock_6_out_writedata),
      .clk                                                           (clk_0),
      .d1_dma_control_port_slave_end_xfer                            (d1_dma_control_port_slave_end_xfer),
      .dma_control_port_slave_readdata_from_sa                       (dma_control_port_slave_readdata_from_sa),
      .reset_n                                                       (clk_0_reset_n)
    );

  DE0_SOPC_clock_6 the_DE0_SOPC_clock_6
    (
      .master_address       (DE0_SOPC_clock_6_out_address),
      .master_byteenable    (DE0_SOPC_clock_6_out_byteenable),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_6_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_6_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_6_out_read),
      .master_readdata      (DE0_SOPC_clock_6_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_6_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_6_out_waitrequest),
      .master_write         (DE0_SOPC_clock_6_out_write),
      .master_writedata     (DE0_SOPC_clock_6_out_writedata),
      .slave_address        (DE0_SOPC_clock_6_in_address),
      .slave_byteenable     (DE0_SOPC_clock_6_in_byteenable),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_6_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_6_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_6_in_read),
      .slave_readdata       (DE0_SOPC_clock_6_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_6_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_6_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_6_in_write),
      .slave_writedata      (DE0_SOPC_clock_6_in_writedata)
    );

  DE0_SOPC_clock_7_in_arbitrator the_DE0_SOPC_clock_7_in
    (
      .DE0_SOPC_clock_7_in_address                           (DE0_SOPC_clock_7_in_address),
      .DE0_SOPC_clock_7_in_byteenable                        (DE0_SOPC_clock_7_in_byteenable),
      .DE0_SOPC_clock_7_in_endofpacket                       (DE0_SOPC_clock_7_in_endofpacket),
      .DE0_SOPC_clock_7_in_endofpacket_from_sa               (DE0_SOPC_clock_7_in_endofpacket_from_sa),
      .DE0_SOPC_clock_7_in_nativeaddress                     (DE0_SOPC_clock_7_in_nativeaddress),
      .DE0_SOPC_clock_7_in_read                              (DE0_SOPC_clock_7_in_read),
      .DE0_SOPC_clock_7_in_readdata                          (DE0_SOPC_clock_7_in_readdata),
      .DE0_SOPC_clock_7_in_readdata_from_sa                  (DE0_SOPC_clock_7_in_readdata_from_sa),
      .DE0_SOPC_clock_7_in_reset_n                           (DE0_SOPC_clock_7_in_reset_n),
      .DE0_SOPC_clock_7_in_waitrequest                       (DE0_SOPC_clock_7_in_waitrequest),
      .DE0_SOPC_clock_7_in_waitrequest_from_sa               (DE0_SOPC_clock_7_in_waitrequest_from_sa),
      .DE0_SOPC_clock_7_in_write                             (DE0_SOPC_clock_7_in_write),
      .DE0_SOPC_clock_7_in_writedata                         (DE0_SOPC_clock_7_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_7_in           (cpu_data_master_granted_DE0_SOPC_clock_7_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_7_in (cpu_data_master_qualified_request_DE0_SOPC_clock_7_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in),
      .cpu_data_master_requests_DE0_SOPC_clock_7_in          (cpu_data_master_requests_DE0_SOPC_clock_7_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_7_in_end_xfer                       (d1_DE0_SOPC_clock_7_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_7_out_arbitrator the_DE0_SOPC_clock_7_out
    (
      .DE0_SOPC_clock_7_out_address                    (DE0_SOPC_clock_7_out_address),
      .DE0_SOPC_clock_7_out_address_to_slave           (DE0_SOPC_clock_7_out_address_to_slave),
      .DE0_SOPC_clock_7_out_byteenable                 (DE0_SOPC_clock_7_out_byteenable),
      .DE0_SOPC_clock_7_out_granted_uart2_s1           (DE0_SOPC_clock_7_out_granted_uart2_s1),
      .DE0_SOPC_clock_7_out_qualified_request_uart2_s1 (DE0_SOPC_clock_7_out_qualified_request_uart2_s1),
      .DE0_SOPC_clock_7_out_read                       (DE0_SOPC_clock_7_out_read),
      .DE0_SOPC_clock_7_out_read_data_valid_uart2_s1   (DE0_SOPC_clock_7_out_read_data_valid_uart2_s1),
      .DE0_SOPC_clock_7_out_readdata                   (DE0_SOPC_clock_7_out_readdata),
      .DE0_SOPC_clock_7_out_requests_uart2_s1          (DE0_SOPC_clock_7_out_requests_uart2_s1),
      .DE0_SOPC_clock_7_out_reset_n                    (DE0_SOPC_clock_7_out_reset_n),
      .DE0_SOPC_clock_7_out_waitrequest                (DE0_SOPC_clock_7_out_waitrequest),
      .DE0_SOPC_clock_7_out_write                      (DE0_SOPC_clock_7_out_write),
      .DE0_SOPC_clock_7_out_writedata                  (DE0_SOPC_clock_7_out_writedata),
      .clk                                             (clk_0),
      .d1_uart2_s1_end_xfer                            (d1_uart2_s1_end_xfer),
      .reset_n                                         (clk_0_reset_n),
      .uart2_s1_readdata_from_sa                       (uart2_s1_readdata_from_sa)
    );

  DE0_SOPC_clock_7 the_DE0_SOPC_clock_7
    (
      .master_address       (DE0_SOPC_clock_7_out_address),
      .master_byteenable    (DE0_SOPC_clock_7_out_byteenable),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_7_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_7_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_7_out_read),
      .master_readdata      (DE0_SOPC_clock_7_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_7_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_7_out_waitrequest),
      .master_write         (DE0_SOPC_clock_7_out_write),
      .master_writedata     (DE0_SOPC_clock_7_out_writedata),
      .slave_address        (DE0_SOPC_clock_7_in_address),
      .slave_byteenable     (DE0_SOPC_clock_7_in_byteenable),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_7_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_7_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_7_in_read),
      .slave_readdata       (DE0_SOPC_clock_7_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_7_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_7_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_7_in_write),
      .slave_writedata      (DE0_SOPC_clock_7_in_writedata)
    );

  DE0_SOPC_clock_8_in_arbitrator the_DE0_SOPC_clock_8_in
    (
      .DE0_SOPC_clock_8_in_address                           (DE0_SOPC_clock_8_in_address),
      .DE0_SOPC_clock_8_in_endofpacket                       (DE0_SOPC_clock_8_in_endofpacket),
      .DE0_SOPC_clock_8_in_endofpacket_from_sa               (DE0_SOPC_clock_8_in_endofpacket_from_sa),
      .DE0_SOPC_clock_8_in_nativeaddress                     (DE0_SOPC_clock_8_in_nativeaddress),
      .DE0_SOPC_clock_8_in_read                              (DE0_SOPC_clock_8_in_read),
      .DE0_SOPC_clock_8_in_readdata                          (DE0_SOPC_clock_8_in_readdata),
      .DE0_SOPC_clock_8_in_readdata_from_sa                  (DE0_SOPC_clock_8_in_readdata_from_sa),
      .DE0_SOPC_clock_8_in_reset_n                           (DE0_SOPC_clock_8_in_reset_n),
      .DE0_SOPC_clock_8_in_waitrequest                       (DE0_SOPC_clock_8_in_waitrequest),
      .DE0_SOPC_clock_8_in_waitrequest_from_sa               (DE0_SOPC_clock_8_in_waitrequest_from_sa),
      .DE0_SOPC_clock_8_in_write                             (DE0_SOPC_clock_8_in_write),
      .DE0_SOPC_clock_8_in_writedata                         (DE0_SOPC_clock_8_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_8_in           (cpu_data_master_granted_DE0_SOPC_clock_8_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_8_in (cpu_data_master_qualified_request_DE0_SOPC_clock_8_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in),
      .cpu_data_master_requests_DE0_SOPC_clock_8_in          (cpu_data_master_requests_DE0_SOPC_clock_8_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_8_in_end_xfer                       (d1_DE0_SOPC_clock_8_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_8_out_arbitrator the_DE0_SOPC_clock_8_out
    (
      .DE0_SOPC_clock_8_out_address                   (DE0_SOPC_clock_8_out_address),
      .DE0_SOPC_clock_8_out_address_to_slave          (DE0_SOPC_clock_8_out_address_to_slave),
      .DE0_SOPC_clock_8_out_granted_SEG7_s1           (DE0_SOPC_clock_8_out_granted_SEG7_s1),
      .DE0_SOPC_clock_8_out_qualified_request_SEG7_s1 (DE0_SOPC_clock_8_out_qualified_request_SEG7_s1),
      .DE0_SOPC_clock_8_out_read                      (DE0_SOPC_clock_8_out_read),
      .DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1   (DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1),
      .DE0_SOPC_clock_8_out_readdata                  (DE0_SOPC_clock_8_out_readdata),
      .DE0_SOPC_clock_8_out_requests_SEG7_s1          (DE0_SOPC_clock_8_out_requests_SEG7_s1),
      .DE0_SOPC_clock_8_out_reset_n                   (DE0_SOPC_clock_8_out_reset_n),
      .DE0_SOPC_clock_8_out_waitrequest               (DE0_SOPC_clock_8_out_waitrequest),
      .DE0_SOPC_clock_8_out_write                     (DE0_SOPC_clock_8_out_write),
      .DE0_SOPC_clock_8_out_writedata                 (DE0_SOPC_clock_8_out_writedata),
      .SEG7_s1_readdata_from_sa                       (SEG7_s1_readdata_from_sa),
      .clk                                            (clk_0),
      .d1_SEG7_s1_end_xfer                            (d1_SEG7_s1_end_xfer),
      .reset_n                                        (clk_0_reset_n)
    );

  DE0_SOPC_clock_8 the_DE0_SOPC_clock_8
    (
      .master_address       (DE0_SOPC_clock_8_out_address),
      .master_clk           (clk_0),
      .master_endofpacket   (DE0_SOPC_clock_8_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_8_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_8_out_read),
      .master_readdata      (DE0_SOPC_clock_8_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_8_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_8_out_waitrequest),
      .master_write         (DE0_SOPC_clock_8_out_write),
      .master_writedata     (DE0_SOPC_clock_8_out_writedata),
      .slave_address        (DE0_SOPC_clock_8_in_address),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_8_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_8_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_8_in_read),
      .slave_readdata       (DE0_SOPC_clock_8_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_8_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_8_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_8_in_write),
      .slave_writedata      (DE0_SOPC_clock_8_in_writedata)
    );

  SEG7_s1_arbitrator the_SEG7_s1
    (
      .DE0_SOPC_clock_8_out_address_to_slave          (DE0_SOPC_clock_8_out_address_to_slave),
      .DE0_SOPC_clock_8_out_granted_SEG7_s1           (DE0_SOPC_clock_8_out_granted_SEG7_s1),
      .DE0_SOPC_clock_8_out_nativeaddress             (DE0_SOPC_clock_8_out_nativeaddress),
      .DE0_SOPC_clock_8_out_qualified_request_SEG7_s1 (DE0_SOPC_clock_8_out_qualified_request_SEG7_s1),
      .DE0_SOPC_clock_8_out_read                      (DE0_SOPC_clock_8_out_read),
      .DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1   (DE0_SOPC_clock_8_out_read_data_valid_SEG7_s1),
      .DE0_SOPC_clock_8_out_requests_SEG7_s1          (DE0_SOPC_clock_8_out_requests_SEG7_s1),
      .DE0_SOPC_clock_8_out_write                     (DE0_SOPC_clock_8_out_write),
      .DE0_SOPC_clock_8_out_writedata                 (DE0_SOPC_clock_8_out_writedata),
      .SEG7_s1_address                                (SEG7_s1_address),
      .SEG7_s1_read                                   (SEG7_s1_read),
      .SEG7_s1_readdata                               (SEG7_s1_readdata),
      .SEG7_s1_readdata_from_sa                       (SEG7_s1_readdata_from_sa),
      .SEG7_s1_reset                                  (SEG7_s1_reset),
      .SEG7_s1_write                                  (SEG7_s1_write),
      .SEG7_s1_writedata                              (SEG7_s1_writedata),
      .clk                                            (clk_0),
      .d1_SEG7_s1_end_xfer                            (d1_SEG7_s1_end_xfer),
      .reset_n                                        (clk_0_reset_n)
    );

  SEG7 the_SEG7
    (
      .avs_s1_address     (SEG7_s1_address),
      .avs_s1_clk         (clk_0),
      .avs_s1_export_seg7 (avs_s1_export_seg7_from_the_SEG7),
      .avs_s1_read        (SEG7_s1_read),
      .avs_s1_readdata    (SEG7_s1_readdata),
      .avs_s1_reset       (SEG7_s1_reset),
      .avs_s1_write       (SEG7_s1_write),
      .avs_s1_writedata   (SEG7_s1_writedata)
    );

  buttons_s1_arbitrator the_buttons_s1
    (
      .buttons_s1_address                           (buttons_s1_address),
      .buttons_s1_chipselect                        (buttons_s1_chipselect),
      .buttons_s1_irq                               (buttons_s1_irq),
      .buttons_s1_irq_from_sa                       (buttons_s1_irq_from_sa),
      .buttons_s1_readdata                          (buttons_s1_readdata),
      .buttons_s1_readdata_from_sa                  (buttons_s1_readdata_from_sa),
      .buttons_s1_reset_n                           (buttons_s1_reset_n),
      .buttons_s1_write_n                           (buttons_s1_write_n),
      .buttons_s1_writedata                         (buttons_s1_writedata),
      .clk                                          (pll_cpu),
      .cpu_data_master_address_to_slave             (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_buttons_s1           (cpu_data_master_granted_buttons_s1),
      .cpu_data_master_qualified_request_buttons_s1 (cpu_data_master_qualified_request_buttons_s1),
      .cpu_data_master_read                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_buttons_s1   (cpu_data_master_read_data_valid_buttons_s1),
      .cpu_data_master_requests_buttons_s1          (cpu_data_master_requests_buttons_s1),
      .cpu_data_master_waitrequest                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                        (cpu_data_master_write),
      .cpu_data_master_writedata                    (cpu_data_master_writedata),
      .d1_buttons_s1_end_xfer                       (d1_buttons_s1_end_xfer),
      .reset_n                                      (pll_cpu_reset_n)
    );

  buttons the_buttons
    (
      .address    (buttons_s1_address),
      .chipselect (buttons_s1_chipselect),
      .clk        (pll_cpu),
      .in_port    (in_port_to_the_buttons),
      .irq        (buttons_s1_irq),
      .readdata   (buttons_s1_readdata),
      .reset_n    (buttons_s1_reset_n),
      .write_n    (buttons_s1_write_n),
      .writedata  (buttons_s1_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (pll_cpu_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .DE0_SOPC_clock_0_in_readdata_from_sa                           (DE0_SOPC_clock_0_in_readdata_from_sa),
      .DE0_SOPC_clock_0_in_waitrequest_from_sa                        (DE0_SOPC_clock_0_in_waitrequest_from_sa),
      .DE0_SOPC_clock_3_in_readdata_from_sa                           (DE0_SOPC_clock_3_in_readdata_from_sa),
      .DE0_SOPC_clock_3_in_waitrequest_from_sa                        (DE0_SOPC_clock_3_in_waitrequest_from_sa),
      .DE0_SOPC_clock_4_in_readdata_from_sa                           (DE0_SOPC_clock_4_in_readdata_from_sa),
      .DE0_SOPC_clock_4_in_waitrequest_from_sa                        (DE0_SOPC_clock_4_in_waitrequest_from_sa),
      .DE0_SOPC_clock_5_in_readdata_from_sa                           (DE0_SOPC_clock_5_in_readdata_from_sa),
      .DE0_SOPC_clock_5_in_waitrequest_from_sa                        (DE0_SOPC_clock_5_in_waitrequest_from_sa),
      .DE0_SOPC_clock_6_in_readdata_from_sa                           (DE0_SOPC_clock_6_in_readdata_from_sa),
      .DE0_SOPC_clock_6_in_waitrequest_from_sa                        (DE0_SOPC_clock_6_in_waitrequest_from_sa),
      .DE0_SOPC_clock_7_in_readdata_from_sa                           (DE0_SOPC_clock_7_in_readdata_from_sa),
      .DE0_SOPC_clock_7_in_waitrequest_from_sa                        (DE0_SOPC_clock_7_in_waitrequest_from_sa),
      .DE0_SOPC_clock_8_in_readdata_from_sa                           (DE0_SOPC_clock_8_in_readdata_from_sa),
      .DE0_SOPC_clock_8_in_waitrequest_from_sa                        (DE0_SOPC_clock_8_in_waitrequest_from_sa),
      .buttons_s1_irq_from_sa                                         (buttons_s1_irq_from_sa),
      .buttons_s1_readdata_from_sa                                    (buttons_s1_readdata_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                 (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                            (pll_cpu),
      .cpu_data_master_address                                        (cpu_data_master_address),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_cfi_flash_s1                        (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_sdram_s1                            (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_DE0_SOPC_clock_0_in                    (cpu_data_master_granted_DE0_SOPC_clock_0_in),
      .cpu_data_master_granted_DE0_SOPC_clock_3_in                    (cpu_data_master_granted_DE0_SOPC_clock_3_in),
      .cpu_data_master_granted_DE0_SOPC_clock_4_in                    (cpu_data_master_granted_DE0_SOPC_clock_4_in),
      .cpu_data_master_granted_DE0_SOPC_clock_5_in                    (cpu_data_master_granted_DE0_SOPC_clock_5_in),
      .cpu_data_master_granted_DE0_SOPC_clock_6_in                    (cpu_data_master_granted_DE0_SOPC_clock_6_in),
      .cpu_data_master_granted_DE0_SOPC_clock_7_in                    (cpu_data_master_granted_DE0_SOPC_clock_7_in),
      .cpu_data_master_granted_DE0_SOPC_clock_8_in                    (cpu_data_master_granted_DE0_SOPC_clock_8_in),
      .cpu_data_master_granted_buttons_s1                             (cpu_data_master_granted_buttons_s1),
      .cpu_data_master_granted_cfi_flash_s1                           (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave            (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_leds_s1                                (cpu_data_master_granted_leds_s1),
      .cpu_data_master_granted_sdram_s1                               (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_granted_switches_s1                            (cpu_data_master_granted_switches_s1),
      .cpu_data_master_granted_sysid_control_slave                    (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_timer_s1                               (cpu_data_master_granted_timer_s1),
      .cpu_data_master_granted_uart_s1                                (cpu_data_master_granted_uart_s1),
      .cpu_data_master_irq                                            (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_0_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_3_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_3_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_4_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_4_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_5_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_5_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_6_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_6_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_7_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_7_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_8_in          (cpu_data_master_qualified_request_DE0_SOPC_clock_8_in),
      .cpu_data_master_qualified_request_buttons_s1                   (cpu_data_master_qualified_request_buttons_s1),
      .cpu_data_master_qualified_request_cfi_flash_s1                 (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave  (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_leds_s1                      (cpu_data_master_qualified_request_leds_s1),
      .cpu_data_master_qualified_request_sdram_s1                     (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_qualified_request_switches_s1                  (cpu_data_master_qualified_request_switches_s1),
      .cpu_data_master_qualified_request_sysid_control_slave          (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_timer_s1                     (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_qualified_request_uart_s1                      (cpu_data_master_qualified_request_uart_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_3_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_4_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_5_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_6_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_7_in),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in            (cpu_data_master_read_data_valid_DE0_SOPC_clock_8_in),
      .cpu_data_master_read_data_valid_buttons_s1                     (cpu_data_master_read_data_valid_buttons_s1),
      .cpu_data_master_read_data_valid_cfi_flash_s1                   (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave    (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_leds_s1                        (cpu_data_master_read_data_valid_leds_s1),
      .cpu_data_master_read_data_valid_sdram_s1                       (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register        (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_switches_s1                    (cpu_data_master_read_data_valid_switches_s1),
      .cpu_data_master_read_data_valid_sysid_control_slave            (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_timer_s1                       (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_read_data_valid_uart_s1                        (cpu_data_master_read_data_valid_uart_s1),
      .cpu_data_master_readdata                                       (cpu_data_master_readdata),
      .cpu_data_master_requests_DE0_SOPC_clock_0_in                   (cpu_data_master_requests_DE0_SOPC_clock_0_in),
      .cpu_data_master_requests_DE0_SOPC_clock_3_in                   (cpu_data_master_requests_DE0_SOPC_clock_3_in),
      .cpu_data_master_requests_DE0_SOPC_clock_4_in                   (cpu_data_master_requests_DE0_SOPC_clock_4_in),
      .cpu_data_master_requests_DE0_SOPC_clock_5_in                   (cpu_data_master_requests_DE0_SOPC_clock_5_in),
      .cpu_data_master_requests_DE0_SOPC_clock_6_in                   (cpu_data_master_requests_DE0_SOPC_clock_6_in),
      .cpu_data_master_requests_DE0_SOPC_clock_7_in                   (cpu_data_master_requests_DE0_SOPC_clock_7_in),
      .cpu_data_master_requests_DE0_SOPC_clock_8_in                   (cpu_data_master_requests_DE0_SOPC_clock_8_in),
      .cpu_data_master_requests_buttons_s1                            (cpu_data_master_requests_buttons_s1),
      .cpu_data_master_requests_cfi_flash_s1                          (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave           (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_leds_s1                               (cpu_data_master_requests_leds_s1),
      .cpu_data_master_requests_sdram_s1                              (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_requests_switches_s1                           (cpu_data_master_requests_switches_s1),
      .cpu_data_master_requests_sysid_control_slave                   (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_timer_s1                              (cpu_data_master_requests_timer_s1),
      .cpu_data_master_requests_uart_s1                               (cpu_data_master_requests_uart_s1),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_DE0_SOPC_clock_0_in_end_xfer                                (d1_DE0_SOPC_clock_0_in_end_xfer),
      .d1_DE0_SOPC_clock_3_in_end_xfer                                (d1_DE0_SOPC_clock_3_in_end_xfer),
      .d1_DE0_SOPC_clock_4_in_end_xfer                                (d1_DE0_SOPC_clock_4_in_end_xfer),
      .d1_DE0_SOPC_clock_5_in_end_xfer                                (d1_DE0_SOPC_clock_5_in_end_xfer),
      .d1_DE0_SOPC_clock_6_in_end_xfer                                (d1_DE0_SOPC_clock_6_in_end_xfer),
      .d1_DE0_SOPC_clock_7_in_end_xfer                                (d1_DE0_SOPC_clock_7_in_end_xfer),
      .d1_DE0_SOPC_clock_8_in_end_xfer                                (d1_DE0_SOPC_clock_8_in_end_xfer),
      .d1_buttons_s1_end_xfer                                         (d1_buttons_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                        (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_leds_s1_end_xfer                                            (d1_leds_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .d1_switches_s1_end_xfer                                        (d1_switches_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                           (d1_timer_s1_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .d1_uart_s1_end_xfer                                            (d1_uart_s1_end_xfer),
      .dma_control_port_slave_irq_from_sa                             (dma_control_port_slave_irq_from_sa),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                        (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                   (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .leds_s1_readdata_from_sa                                       (leds_s1_readdata_from_sa),
      .pll_cpu                                                        (pll_cpu),
      .pll_cpu_reset_n                                                (pll_cpu_reset_n),
      .registered_cpu_data_master_read_data_valid_cfi_flash_s1        (registered_cpu_data_master_read_data_valid_cfi_flash_s1),
      .reset_n                                                        (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa),
      .switches_s1_readdata_from_sa                                   (switches_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                           (sysid_control_slave_readdata_from_sa),
      .timer_s1_irq_from_sa                                           (timer_s1_irq_from_sa),
      .timer_s1_readdata_from_sa                                      (timer_s1_readdata_from_sa),
      .uart2_s1_irq_from_sa                                           (uart2_s1_irq_from_sa),
      .uart_s1_irq_from_sa                                            (uart_s1_irq_from_sa),
      .uart_s1_readdata_from_sa                                       (uart_s1_readdata_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                 (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                            (pll_cpu),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .reset_n                                                        (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa)
    );

  cpu the_cpu
    (
      .clk                                   (pll_cpu),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  dma_control_port_slave_arbitrator the_dma_control_port_slave
    (
      .DE0_SOPC_clock_6_out_address_to_slave                         (DE0_SOPC_clock_6_out_address_to_slave),
      .DE0_SOPC_clock_6_out_granted_dma_control_port_slave           (DE0_SOPC_clock_6_out_granted_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_nativeaddress                            (DE0_SOPC_clock_6_out_nativeaddress),
      .DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave (DE0_SOPC_clock_6_out_qualified_request_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_read                                     (DE0_SOPC_clock_6_out_read),
      .DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave   (DE0_SOPC_clock_6_out_read_data_valid_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_requests_dma_control_port_slave          (DE0_SOPC_clock_6_out_requests_dma_control_port_slave),
      .DE0_SOPC_clock_6_out_write                                    (DE0_SOPC_clock_6_out_write),
      .DE0_SOPC_clock_6_out_writedata                                (DE0_SOPC_clock_6_out_writedata),
      .clk                                                           (clk_0),
      .d1_dma_control_port_slave_end_xfer                            (d1_dma_control_port_slave_end_xfer),
      .dma_control_port_slave_address                                (dma_control_port_slave_address),
      .dma_control_port_slave_chipselect                             (dma_control_port_slave_chipselect),
      .dma_control_port_slave_irq                                    (dma_control_port_slave_irq),
      .dma_control_port_slave_irq_from_sa                            (dma_control_port_slave_irq_from_sa),
      .dma_control_port_slave_readdata                               (dma_control_port_slave_readdata),
      .dma_control_port_slave_readdata_from_sa                       (dma_control_port_slave_readdata_from_sa),
      .dma_control_port_slave_readyfordata                           (dma_control_port_slave_readyfordata),
      .dma_control_port_slave_readyfordata_from_sa                   (dma_control_port_slave_readyfordata_from_sa),
      .dma_control_port_slave_reset_n                                (dma_control_port_slave_reset_n),
      .dma_control_port_slave_write_n                                (dma_control_port_slave_write_n),
      .dma_control_port_slave_writedata                              (dma_control_port_slave_writedata),
      .reset_n                                                       (clk_0_reset_n)
    );

  dma_read_master_arbitrator the_dma_read_master
    (
      .DE0_SOPC_clock_1_in_endofpacket_from_sa               (DE0_SOPC_clock_1_in_endofpacket_from_sa),
      .DE0_SOPC_clock_1_in_readdata_from_sa                  (DE0_SOPC_clock_1_in_readdata_from_sa),
      .DE0_SOPC_clock_1_in_waitrequest_from_sa               (DE0_SOPC_clock_1_in_waitrequest_from_sa),
      .clk                                                   (clk_0),
      .d1_DE0_SOPC_clock_1_in_end_xfer                       (d1_DE0_SOPC_clock_1_in_end_xfer),
      .dma_read_master_address                               (dma_read_master_address),
      .dma_read_master_address_to_slave                      (dma_read_master_address_to_slave),
      .dma_read_master_chipselect                            (dma_read_master_chipselect),
      .dma_read_master_endofpacket                           (dma_read_master_endofpacket),
      .dma_read_master_flush                                 (dma_read_master_flush),
      .dma_read_master_granted_DE0_SOPC_clock_1_in           (dma_read_master_granted_DE0_SOPC_clock_1_in),
      .dma_read_master_latency_counter                       (dma_read_master_latency_counter),
      .dma_read_master_qualified_request_DE0_SOPC_clock_1_in (dma_read_master_qualified_request_DE0_SOPC_clock_1_in),
      .dma_read_master_read_data_valid_DE0_SOPC_clock_1_in   (dma_read_master_read_data_valid_DE0_SOPC_clock_1_in),
      .dma_read_master_read_n                                (dma_read_master_read_n),
      .dma_read_master_readdata                              (dma_read_master_readdata),
      .dma_read_master_readdatavalid                         (dma_read_master_readdatavalid),
      .dma_read_master_requests_DE0_SOPC_clock_1_in          (dma_read_master_requests_DE0_SOPC_clock_1_in),
      .dma_read_master_waitrequest                           (dma_read_master_waitrequest),
      .reset_n                                               (clk_0_reset_n)
    );

  dma_write_master_arbitrator the_dma_write_master
    (
      .DE0_SOPC_clock_2_in_endofpacket_from_sa                (DE0_SOPC_clock_2_in_endofpacket_from_sa),
      .DE0_SOPC_clock_2_in_waitrequest_from_sa                (DE0_SOPC_clock_2_in_waitrequest_from_sa),
      .clk                                                    (clk_0),
      .d1_DE0_SOPC_clock_2_in_end_xfer                        (d1_DE0_SOPC_clock_2_in_end_xfer),
      .dma_write_master_address                               (dma_write_master_address),
      .dma_write_master_address_to_slave                      (dma_write_master_address_to_slave),
      .dma_write_master_byteenable                            (dma_write_master_byteenable),
      .dma_write_master_chipselect                            (dma_write_master_chipselect),
      .dma_write_master_endofpacket                           (dma_write_master_endofpacket),
      .dma_write_master_granted_DE0_SOPC_clock_2_in           (dma_write_master_granted_DE0_SOPC_clock_2_in),
      .dma_write_master_qualified_request_DE0_SOPC_clock_2_in (dma_write_master_qualified_request_DE0_SOPC_clock_2_in),
      .dma_write_master_requests_DE0_SOPC_clock_2_in          (dma_write_master_requests_DE0_SOPC_clock_2_in),
      .dma_write_master_waitrequest                           (dma_write_master_waitrequest),
      .dma_write_master_write_n                               (dma_write_master_write_n),
      .dma_write_master_writedata                             (dma_write_master_writedata),
      .reset_n                                                (clk_0_reset_n)
    );

  dma the_dma
    (
      .clk                  (clk_0),
      .dma_ctl_address      (dma_control_port_slave_address),
      .dma_ctl_chipselect   (dma_control_port_slave_chipselect),
      .dma_ctl_irq          (dma_control_port_slave_irq),
      .dma_ctl_readdata     (dma_control_port_slave_readdata),
      .dma_ctl_readyfordata (dma_control_port_slave_readyfordata),
      .dma_ctl_write_n      (dma_control_port_slave_write_n),
      .dma_ctl_writedata    (dma_control_port_slave_writedata),
      .read_address         (dma_read_master_address),
      .read_chipselect      (dma_read_master_chipselect),
      .read_endofpacket     (dma_read_master_endofpacket),
      .read_flush           (dma_read_master_flush),
      .read_read_n          (dma_read_master_read_n),
      .read_readdata        (dma_read_master_readdata),
      .read_readdatavalid   (dma_read_master_readdatavalid),
      .read_waitrequest     (dma_read_master_waitrequest),
      .system_reset_n       (dma_control_port_slave_reset_n),
      .write_address        (dma_write_master_address),
      .write_byteenable     (dma_write_master_byteenable),
      .write_chipselect     (dma_write_master_chipselect),
      .write_endofpacket    (dma_write_master_endofpacket),
      .write_waitrequest    (dma_write_master_waitrequest),
      .write_write_n        (dma_write_master_write_n),
      .write_writedata      (dma_write_master_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (pll_cpu),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (pll_cpu_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (pll_cpu),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_display_control_slave_arbitrator the_lcd_display_control_slave
    (
      .DE0_SOPC_clock_4_out_address_to_slave                            (DE0_SOPC_clock_4_out_address_to_slave),
      .DE0_SOPC_clock_4_out_granted_lcd_display_control_slave           (DE0_SOPC_clock_4_out_granted_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_nativeaddress                               (DE0_SOPC_clock_4_out_nativeaddress),
      .DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave (DE0_SOPC_clock_4_out_qualified_request_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_read                                        (DE0_SOPC_clock_4_out_read),
      .DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave   (DE0_SOPC_clock_4_out_read_data_valid_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_requests_lcd_display_control_slave          (DE0_SOPC_clock_4_out_requests_lcd_display_control_slave),
      .DE0_SOPC_clock_4_out_write                                       (DE0_SOPC_clock_4_out_write),
      .DE0_SOPC_clock_4_out_writedata                                   (DE0_SOPC_clock_4_out_writedata),
      .clk                                                              (clk_0),
      .d1_lcd_display_control_slave_end_xfer                            (d1_lcd_display_control_slave_end_xfer),
      .lcd_display_control_slave_address                                (lcd_display_control_slave_address),
      .lcd_display_control_slave_begintransfer                          (lcd_display_control_slave_begintransfer),
      .lcd_display_control_slave_read                                   (lcd_display_control_slave_read),
      .lcd_display_control_slave_readdata                               (lcd_display_control_slave_readdata),
      .lcd_display_control_slave_readdata_from_sa                       (lcd_display_control_slave_readdata_from_sa),
      .lcd_display_control_slave_wait_counter_eq_0                      (lcd_display_control_slave_wait_counter_eq_0),
      .lcd_display_control_slave_write                                  (lcd_display_control_slave_write),
      .lcd_display_control_slave_writedata                              (lcd_display_control_slave_writedata),
      .reset_n                                                          (clk_0_reset_n)
    );

  lcd_display the_lcd_display
    (
      .LCD_E         (LCD_E_from_the_lcd_display),
      .LCD_RS        (LCD_RS_from_the_lcd_display),
      .LCD_RW        (LCD_RW_from_the_lcd_display),
      .LCD_data      (LCD_data_to_and_from_the_lcd_display),
      .address       (lcd_display_control_slave_address),
      .begintransfer (lcd_display_control_slave_begintransfer),
      .read          (lcd_display_control_slave_read),
      .readdata      (lcd_display_control_slave_readdata),
      .write         (lcd_display_control_slave_write),
      .writedata     (lcd_display_control_slave_writedata)
    );

  led_pwm_s1_arbitrator the_led_pwm_s1
    (
      .DE0_SOPC_clock_5_out_address_to_slave             (DE0_SOPC_clock_5_out_address_to_slave),
      .DE0_SOPC_clock_5_out_granted_led_pwm_s1           (DE0_SOPC_clock_5_out_granted_led_pwm_s1),
      .DE0_SOPC_clock_5_out_nativeaddress                (DE0_SOPC_clock_5_out_nativeaddress),
      .DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1 (DE0_SOPC_clock_5_out_qualified_request_led_pwm_s1),
      .DE0_SOPC_clock_5_out_read                         (DE0_SOPC_clock_5_out_read),
      .DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1   (DE0_SOPC_clock_5_out_read_data_valid_led_pwm_s1),
      .DE0_SOPC_clock_5_out_requests_led_pwm_s1          (DE0_SOPC_clock_5_out_requests_led_pwm_s1),
      .DE0_SOPC_clock_5_out_write                        (DE0_SOPC_clock_5_out_write),
      .DE0_SOPC_clock_5_out_writedata                    (DE0_SOPC_clock_5_out_writedata),
      .clk                                               (clk_0),
      .d1_led_pwm_s1_end_xfer                            (d1_led_pwm_s1_end_xfer),
      .led_pwm_s1_address                                (led_pwm_s1_address),
      .led_pwm_s1_chipselect                             (led_pwm_s1_chipselect),
      .led_pwm_s1_readdata                               (led_pwm_s1_readdata),
      .led_pwm_s1_readdata_from_sa                       (led_pwm_s1_readdata_from_sa),
      .led_pwm_s1_reset_n                                (led_pwm_s1_reset_n),
      .led_pwm_s1_write_n                                (led_pwm_s1_write_n),
      .led_pwm_s1_writedata                              (led_pwm_s1_writedata),
      .reset_n                                           (clk_0_reset_n)
    );

  led_pwm the_led_pwm
    (
      .address    (led_pwm_s1_address),
      .chipselect (led_pwm_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_led_pwm),
      .readdata   (led_pwm_s1_readdata),
      .reset_n    (led_pwm_s1_reset_n),
      .write_n    (led_pwm_s1_write_n),
      .writedata  (led_pwm_s1_writedata)
    );

  leds_s1_arbitrator the_leds_s1
    (
      .clk                                       (pll_cpu),
      .cpu_data_master_address_to_slave          (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_leds_s1           (cpu_data_master_granted_leds_s1),
      .cpu_data_master_qualified_request_leds_s1 (cpu_data_master_qualified_request_leds_s1),
      .cpu_data_master_read                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_leds_s1   (cpu_data_master_read_data_valid_leds_s1),
      .cpu_data_master_requests_leds_s1          (cpu_data_master_requests_leds_s1),
      .cpu_data_master_waitrequest               (cpu_data_master_waitrequest),
      .cpu_data_master_write                     (cpu_data_master_write),
      .cpu_data_master_writedata                 (cpu_data_master_writedata),
      .d1_leds_s1_end_xfer                       (d1_leds_s1_end_xfer),
      .leds_s1_address                           (leds_s1_address),
      .leds_s1_chipselect                        (leds_s1_chipselect),
      .leds_s1_readdata                          (leds_s1_readdata),
      .leds_s1_readdata_from_sa                  (leds_s1_readdata_from_sa),
      .leds_s1_reset_n                           (leds_s1_reset_n),
      .leds_s1_write_n                           (leds_s1_write_n),
      .leds_s1_writedata                         (leds_s1_writedata),
      .reset_n                                   (pll_cpu_reset_n)
    );

  leds the_leds
    (
      .address    (leds_s1_address),
      .chipselect (leds_s1_chipselect),
      .clk        (pll_cpu),
      .out_port   (out_port_from_the_leds),
      .readdata   (leds_s1_readdata),
      .reset_n    (leds_s1_reset_n),
      .write_n    (leds_s1_write_n),
      .writedata  (leds_s1_writedata)
    );

  mode_sw_s1_arbitrator the_mode_sw_s1
    (
      .DE0_SOPC_clock_3_out_address_to_slave             (DE0_SOPC_clock_3_out_address_to_slave),
      .DE0_SOPC_clock_3_out_granted_mode_sw_s1           (DE0_SOPC_clock_3_out_granted_mode_sw_s1),
      .DE0_SOPC_clock_3_out_nativeaddress                (DE0_SOPC_clock_3_out_nativeaddress),
      .DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1 (DE0_SOPC_clock_3_out_qualified_request_mode_sw_s1),
      .DE0_SOPC_clock_3_out_read                         (DE0_SOPC_clock_3_out_read),
      .DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1   (DE0_SOPC_clock_3_out_read_data_valid_mode_sw_s1),
      .DE0_SOPC_clock_3_out_requests_mode_sw_s1          (DE0_SOPC_clock_3_out_requests_mode_sw_s1),
      .DE0_SOPC_clock_3_out_write                        (DE0_SOPC_clock_3_out_write),
      .clk                                               (clk_0),
      .d1_mode_sw_s1_end_xfer                            (d1_mode_sw_s1_end_xfer),
      .mode_sw_s1_address                                (mode_sw_s1_address),
      .mode_sw_s1_readdata                               (mode_sw_s1_readdata),
      .mode_sw_s1_readdata_from_sa                       (mode_sw_s1_readdata_from_sa),
      .mode_sw_s1_reset_n                                (mode_sw_s1_reset_n),
      .reset_n                                           (clk_0_reset_n)
    );

  mode_sw the_mode_sw
    (
      .address  (mode_sw_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_mode_sw),
      .readdata (mode_sw_s1_readdata),
      .reset_n  (mode_sw_s1_reset_n)
    );

  pll_s1_arbitrator the_pll_s1
    (
      .DE0_SOPC_clock_0_out_address_to_slave         (DE0_SOPC_clock_0_out_address_to_slave),
      .DE0_SOPC_clock_0_out_granted_pll_s1           (DE0_SOPC_clock_0_out_granted_pll_s1),
      .DE0_SOPC_clock_0_out_nativeaddress            (DE0_SOPC_clock_0_out_nativeaddress),
      .DE0_SOPC_clock_0_out_qualified_request_pll_s1 (DE0_SOPC_clock_0_out_qualified_request_pll_s1),
      .DE0_SOPC_clock_0_out_read                     (DE0_SOPC_clock_0_out_read),
      .DE0_SOPC_clock_0_out_read_data_valid_pll_s1   (DE0_SOPC_clock_0_out_read_data_valid_pll_s1),
      .DE0_SOPC_clock_0_out_requests_pll_s1          (DE0_SOPC_clock_0_out_requests_pll_s1),
      .DE0_SOPC_clock_0_out_write                    (DE0_SOPC_clock_0_out_write),
      .DE0_SOPC_clock_0_out_writedata                (DE0_SOPC_clock_0_out_writedata),
      .clk                                           (clk_0),
      .d1_pll_s1_end_xfer                            (d1_pll_s1_end_xfer),
      .pll_s1_address                                (pll_s1_address),
      .pll_s1_chipselect                             (pll_s1_chipselect),
      .pll_s1_read                                   (pll_s1_read),
      .pll_s1_readdata                               (pll_s1_readdata),
      .pll_s1_readdata_from_sa                       (pll_s1_readdata_from_sa),
      .pll_s1_reset_n                                (pll_s1_reset_n),
      .pll_s1_resetrequest                           (pll_s1_resetrequest),
      .pll_s1_resetrequest_from_sa                   (pll_s1_resetrequest_from_sa),
      .pll_s1_write                                  (pll_s1_write),
      .pll_s1_writedata                              (pll_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  //pll_cpu out_clk assignment, which is an e_assign
  assign pll_cpu = out_clk_pll_c0;

  //pll_sdram out_clk assignment, which is an e_assign
  assign pll_sdram = out_clk_pll_c1;

  pll the_pll
    (
      .address      (pll_s1_address),
      .c0           (out_clk_pll_c0),
      .c1           (out_clk_pll_c1),
      .chipselect   (pll_s1_chipselect),
      .clk          (clk_0),
      .read         (pll_s1_read),
      .readdata     (pll_s1_readdata),
      .reset_n      (pll_s1_reset_n),
      .resetrequest (pll_s1_resetrequest),
      .write        (pll_s1_write),
      .writedata    (pll_s1_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .DE0_SOPC_clock_1_out_address_to_slave                          (DE0_SOPC_clock_1_out_address_to_slave),
      .DE0_SOPC_clock_1_out_byteenable                                (DE0_SOPC_clock_1_out_byteenable),
      .DE0_SOPC_clock_1_out_granted_sdram_s1                          (DE0_SOPC_clock_1_out_granted_sdram_s1),
      .DE0_SOPC_clock_1_out_qualified_request_sdram_s1                (DE0_SOPC_clock_1_out_qualified_request_sdram_s1),
      .DE0_SOPC_clock_1_out_read                                      (DE0_SOPC_clock_1_out_read),
      .DE0_SOPC_clock_1_out_read_data_valid_sdram_s1                  (DE0_SOPC_clock_1_out_read_data_valid_sdram_s1),
      .DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register   (DE0_SOPC_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .DE0_SOPC_clock_1_out_requests_sdram_s1                         (DE0_SOPC_clock_1_out_requests_sdram_s1),
      .DE0_SOPC_clock_1_out_write                                     (DE0_SOPC_clock_1_out_write),
      .DE0_SOPC_clock_1_out_writedata                                 (DE0_SOPC_clock_1_out_writedata),
      .DE0_SOPC_clock_2_out_address_to_slave                          (DE0_SOPC_clock_2_out_address_to_slave),
      .DE0_SOPC_clock_2_out_byteenable                                (DE0_SOPC_clock_2_out_byteenable),
      .DE0_SOPC_clock_2_out_granted_sdram_s1                          (DE0_SOPC_clock_2_out_granted_sdram_s1),
      .DE0_SOPC_clock_2_out_qualified_request_sdram_s1                (DE0_SOPC_clock_2_out_qualified_request_sdram_s1),
      .DE0_SOPC_clock_2_out_read                                      (DE0_SOPC_clock_2_out_read),
      .DE0_SOPC_clock_2_out_read_data_valid_sdram_s1                  (DE0_SOPC_clock_2_out_read_data_valid_sdram_s1),
      .DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register   (DE0_SOPC_clock_2_out_read_data_valid_sdram_s1_shift_register),
      .DE0_SOPC_clock_2_out_requests_sdram_s1                         (DE0_SOPC_clock_2_out_requests_sdram_s1),
      .DE0_SOPC_clock_2_out_write                                     (DE0_SOPC_clock_2_out_write),
      .DE0_SOPC_clock_2_out_writedata                                 (DE0_SOPC_clock_2_out_writedata),
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sdram_s1                            (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sdram_s1                               (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_sdram_s1                     (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sdram_s1                       (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register        (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                              (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .reset_n                                                        (pll_cpu_reset_n),
      .sdram_s1_address                                               (sdram_s1_address),
      .sdram_s1_byteenable_n                                          (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                            (sdram_s1_chipselect),
      .sdram_s1_read_n                                                (sdram_s1_read_n),
      .sdram_s1_readdata                                              (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                         (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                               (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                           (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                               (sdram_s1_write_n),
      .sdram_s1_writedata                                             (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (pll_cpu),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  switches_s1_arbitrator the_switches_s1
    (
      .clk                                           (pll_cpu),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_switches_s1           (cpu_data_master_granted_switches_s1),
      .cpu_data_master_qualified_request_switches_s1 (cpu_data_master_qualified_request_switches_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_switches_s1   (cpu_data_master_read_data_valid_switches_s1),
      .cpu_data_master_requests_switches_s1          (cpu_data_master_requests_switches_s1),
      .cpu_data_master_write                         (cpu_data_master_write),
      .d1_switches_s1_end_xfer                       (d1_switches_s1_end_xfer),
      .reset_n                                       (pll_cpu_reset_n),
      .switches_s1_address                           (switches_s1_address),
      .switches_s1_readdata                          (switches_s1_readdata),
      .switches_s1_readdata_from_sa                  (switches_s1_readdata_from_sa),
      .switches_s1_reset_n                           (switches_s1_reset_n)
    );

  switches the_switches
    (
      .address  (switches_s1_address),
      .clk      (pll_cpu),
      .in_port  (in_port_to_the_switches),
      .readdata (switches_s1_readdata),
      .reset_n  (switches_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (pll_cpu_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                        (pll_cpu),
      .cpu_data_master_address_to_slave           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_timer_s1           (cpu_data_master_granted_timer_s1),
      .cpu_data_master_qualified_request_timer_s1 (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_read                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_timer_s1   (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_requests_timer_s1          (cpu_data_master_requests_timer_s1),
      .cpu_data_master_waitrequest                (cpu_data_master_waitrequest),
      .cpu_data_master_write                      (cpu_data_master_write),
      .cpu_data_master_writedata                  (cpu_data_master_writedata),
      .d1_timer_s1_end_xfer                       (d1_timer_s1_end_xfer),
      .reset_n                                    (pll_cpu_reset_n),
      .timer_s1_address                           (timer_s1_address),
      .timer_s1_chipselect                        (timer_s1_chipselect),
      .timer_s1_irq                               (timer_s1_irq),
      .timer_s1_irq_from_sa                       (timer_s1_irq_from_sa),
      .timer_s1_readdata                          (timer_s1_readdata),
      .timer_s1_readdata_from_sa                  (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                           (timer_s1_reset_n),
      .timer_s1_write_n                           (timer_s1_write_n),
      .timer_s1_writedata                         (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (pll_cpu),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  tristate_bridge_avalon_slave_arbitrator the_tristate_bridge_avalon_slave
    (
      .address_to_the_cfi_flash                                       (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                 (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                        (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_cfi_flash_s1                           (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_cfi_flash_s1                 (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                   (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_requests_cfi_flash_s1                          (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash                                 (data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                        (read_n_to_the_cfi_flash),
      .registered_cpu_data_master_read_data_valid_cfi_flash_s1        (registered_cpu_data_master_read_data_valid_cfi_flash_s1),
      .reset_n                                                        (pll_cpu_reset_n),
      .select_n_to_the_cfi_flash                                      (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash                                       (write_n_to_the_cfi_flash)
    );

  uart_s1_arbitrator the_uart_s1
    (
      .clk                                       (pll_cpu),
      .cpu_data_master_address_to_slave          (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_uart_s1           (cpu_data_master_granted_uart_s1),
      .cpu_data_master_qualified_request_uart_s1 (cpu_data_master_qualified_request_uart_s1),
      .cpu_data_master_read                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_uart_s1   (cpu_data_master_read_data_valid_uart_s1),
      .cpu_data_master_requests_uart_s1          (cpu_data_master_requests_uart_s1),
      .cpu_data_master_write                     (cpu_data_master_write),
      .cpu_data_master_writedata                 (cpu_data_master_writedata),
      .d1_uart_s1_end_xfer                       (d1_uart_s1_end_xfer),
      .reset_n                                   (pll_cpu_reset_n),
      .uart_s1_address                           (uart_s1_address),
      .uart_s1_begintransfer                     (uart_s1_begintransfer),
      .uart_s1_chipselect                        (uart_s1_chipselect),
      .uart_s1_dataavailable                     (uart_s1_dataavailable),
      .uart_s1_dataavailable_from_sa             (uart_s1_dataavailable_from_sa),
      .uart_s1_irq                               (uart_s1_irq),
      .uart_s1_irq_from_sa                       (uart_s1_irq_from_sa),
      .uart_s1_read_n                            (uart_s1_read_n),
      .uart_s1_readdata                          (uart_s1_readdata),
      .uart_s1_readdata_from_sa                  (uart_s1_readdata_from_sa),
      .uart_s1_readyfordata                      (uart_s1_readyfordata),
      .uart_s1_readyfordata_from_sa              (uart_s1_readyfordata_from_sa),
      .uart_s1_reset_n                           (uart_s1_reset_n),
      .uart_s1_write_n                           (uart_s1_write_n),
      .uart_s1_writedata                         (uart_s1_writedata)
    );

  uart the_uart
    (
      .address       (uart_s1_address),
      .begintransfer (uart_s1_begintransfer),
      .chipselect    (uart_s1_chipselect),
      .clk           (pll_cpu),
      .dataavailable (uart_s1_dataavailable),
      .irq           (uart_s1_irq),
      .read_n        (uart_s1_read_n),
      .readdata      (uart_s1_readdata),
      .readyfordata  (uart_s1_readyfordata),
      .reset_n       (uart_s1_reset_n),
      .rxd           (rxd_to_the_uart),
      .txd           (txd_from_the_uart),
      .write_n       (uart_s1_write_n),
      .writedata     (uart_s1_writedata)
    );

  uart2_s1_arbitrator the_uart2_s1
    (
      .DE0_SOPC_clock_7_out_address_to_slave           (DE0_SOPC_clock_7_out_address_to_slave),
      .DE0_SOPC_clock_7_out_granted_uart2_s1           (DE0_SOPC_clock_7_out_granted_uart2_s1),
      .DE0_SOPC_clock_7_out_nativeaddress              (DE0_SOPC_clock_7_out_nativeaddress),
      .DE0_SOPC_clock_7_out_qualified_request_uart2_s1 (DE0_SOPC_clock_7_out_qualified_request_uart2_s1),
      .DE0_SOPC_clock_7_out_read                       (DE0_SOPC_clock_7_out_read),
      .DE0_SOPC_clock_7_out_read_data_valid_uart2_s1   (DE0_SOPC_clock_7_out_read_data_valid_uart2_s1),
      .DE0_SOPC_clock_7_out_requests_uart2_s1          (DE0_SOPC_clock_7_out_requests_uart2_s1),
      .DE0_SOPC_clock_7_out_write                      (DE0_SOPC_clock_7_out_write),
      .DE0_SOPC_clock_7_out_writedata                  (DE0_SOPC_clock_7_out_writedata),
      .clk                                             (clk_0),
      .d1_uart2_s1_end_xfer                            (d1_uart2_s1_end_xfer),
      .reset_n                                         (clk_0_reset_n),
      .uart2_s1_address                                (uart2_s1_address),
      .uart2_s1_begintransfer                          (uart2_s1_begintransfer),
      .uart2_s1_chipselect                             (uart2_s1_chipselect),
      .uart2_s1_dataavailable                          (uart2_s1_dataavailable),
      .uart2_s1_dataavailable_from_sa                  (uart2_s1_dataavailable_from_sa),
      .uart2_s1_irq                                    (uart2_s1_irq),
      .uart2_s1_irq_from_sa                            (uart2_s1_irq_from_sa),
      .uart2_s1_read_n                                 (uart2_s1_read_n),
      .uart2_s1_readdata                               (uart2_s1_readdata),
      .uart2_s1_readdata_from_sa                       (uart2_s1_readdata_from_sa),
      .uart2_s1_readyfordata                           (uart2_s1_readyfordata),
      .uart2_s1_readyfordata_from_sa                   (uart2_s1_readyfordata_from_sa),
      .uart2_s1_reset_n                                (uart2_s1_reset_n),
      .uart2_s1_write_n                                (uart2_s1_write_n),
      .uart2_s1_writedata                              (uart2_s1_writedata)
    );

  uart2 the_uart2
    (
      .address       (uart2_s1_address),
      .begintransfer (uart2_s1_begintransfer),
      .chipselect    (uart2_s1_chipselect),
      .clk           (clk_0),
      .dataavailable (uart2_s1_dataavailable),
      .irq           (uart2_s1_irq),
      .read_n        (uart2_s1_read_n),
      .readdata      (uart2_s1_readdata),
      .readyfordata  (uart2_s1_readyfordata),
      .reset_n       (uart2_s1_reset_n),
      .rxd           (rxd_to_the_uart2),
      .txd           (txd_from_the_uart2),
      .write_n       (uart2_s1_write_n),
      .writedata     (uart2_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE0_SOPC_reset_pll_cpu_domain_synch_module DE0_SOPC_reset_pll_cpu_domain_synch
    (
      .clk      (pll_cpu),
      .data_in  (1'b1),
      .data_out (pll_cpu_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa);

  //reset is asserted asynchronously and deasserted synchronously
  DE0_SOPC_reset_clk_0_domain_synch_module DE0_SOPC_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //DE0_SOPC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_0_out_endofpacket = 0;

  //DE0_SOPC_clock_1_in_writedata of type writedata does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_1_in_writedata = 0;

  //DE0_SOPC_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_1_out_endofpacket = 0;

  //DE0_SOPC_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_2_out_endofpacket = 0;

  //DE0_SOPC_clock_3_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_3_out_endofpacket = 0;

  //DE0_SOPC_clock_4_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_4_out_endofpacket = 0;

  //DE0_SOPC_clock_5_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_5_out_endofpacket = 0;

  //DE0_SOPC_clock_6_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_6_out_endofpacket = 0;

  //DE0_SOPC_clock_7_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_7_out_endofpacket = 0;

  //DE0_SOPC_clock_8_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_8_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane1_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [ 15: 0] data;
  input   [ 20: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //cfi_flash_lane1, which is an e_ram
  cfi_flash_lane1_module cfi_flash_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.0/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.0/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.0/quartus/eda/sim_lib/sgate.v"
`include "SEG7.v"
`include "pll.v"
`include "altpllpll.v"
`include "DE0_SOPC_clock_4.v"
`include "uart.v"
`include "leds.v"
`include "DE0_SOPC_clock_1.v"
`include "lcd_display.v"
`include "sdram.v"
`include "sdram_test_component.v"
`include "sysid.v"
`include "switches.v"
`include "timer.v"
`include "mode_sw.v"
`include "dma.v"
`include "jtag_uart.v"
`include "DE0_SOPC_clock_0.v"
`include "cpu_test_bench.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "DE0_SOPC_clock_8.v"
`include "led_pwm.v"
`include "DE0_SOPC_clock_2.v"
`include "uart2.v"
`include "DE0_SOPC_clock_7.v"
`include "DE0_SOPC_clock_3.v"
`include "DE0_SOPC_clock_6.v"
`include "DE0_SOPC_clock_5.v"
`include "buttons.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_0_out_endofpacket;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_writedata;
  wire             DE0_SOPC_clock_1_out_endofpacket;
  wire    [ 21: 0] DE0_SOPC_clock_1_out_nativeaddress;
  wire    [ 15: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  wire             DE0_SOPC_clock_2_out_endofpacket;
  wire    [ 21: 0] DE0_SOPC_clock_2_out_nativeaddress;
  wire             DE0_SOPC_clock_3_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_3_out_endofpacket;
  wire             DE0_SOPC_clock_4_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_4_out_endofpacket;
  wire             DE0_SOPC_clock_5_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_5_out_endofpacket;
  wire             DE0_SOPC_clock_6_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_6_out_endofpacket;
  wire             DE0_SOPC_clock_7_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_7_out_endofpacket;
  wire             DE0_SOPC_clock_8_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_8_out_endofpacket;
  wire             LCD_E_from_the_lcd_display;
  wire             LCD_RS_from_the_lcd_display;
  wire             LCD_RW_from_the_lcd_display;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_display;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire    [ 31: 0] avs_s1_export_seg7_from_the_SEG7;
  wire             clk;
  reg              clk_0;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire             dma_control_port_slave_readyfordata_from_sa;
  wire    [  2: 0] in_port_to_the_buttons;
  wire             in_port_to_the_mode_sw;
  wire    [  8: 0] in_port_to_the_switches;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire    [  7: 0] out_port_from_the_led_pwm;
  wire    [  9: 0] out_port_from_the_leds;
  wire             pll_cpu;
  wire             pll_sdram;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             rxd_to_the_uart;
  wire             rxd_to_the_uart2;
  wire             select_n_to_the_cfi_flash;
  wire             sysid_control_slave_clock;
  wire             txd_from_the_uart;
  wire             txd_from_the_uart2;
  wire             uart2_s1_dataavailable_from_sa;
  wire             uart2_s1_readyfordata_from_sa;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_readyfordata_from_sa;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  DE0_SOPC DUT
    (
      .LCD_E_from_the_lcd_display           (LCD_E_from_the_lcd_display),
      .LCD_RS_from_the_lcd_display          (LCD_RS_from_the_lcd_display),
      .LCD_RW_from_the_lcd_display          (LCD_RW_from_the_lcd_display),
      .LCD_data_to_and_from_the_lcd_display (LCD_data_to_and_from_the_lcd_display),
      .address_to_the_cfi_flash             (address_to_the_cfi_flash),
      .avs_s1_export_seg7_from_the_SEG7     (avs_s1_export_seg7_from_the_SEG7),
      .clk_0                                (clk_0),
      .data_to_and_from_the_cfi_flash       (data_to_and_from_the_cfi_flash),
      .in_port_to_the_buttons               (in_port_to_the_buttons),
      .in_port_to_the_mode_sw               (in_port_to_the_mode_sw),
      .in_port_to_the_switches              (in_port_to_the_switches),
      .out_port_from_the_led_pwm            (out_port_from_the_led_pwm),
      .out_port_from_the_leds               (out_port_from_the_leds),
      .pll_cpu                              (pll_cpu),
      .pll_sdram                            (pll_sdram),
      .read_n_to_the_cfi_flash              (read_n_to_the_cfi_flash),
      .reset_n                              (reset_n),
      .rxd_to_the_uart                      (rxd_to_the_uart),
      .rxd_to_the_uart2                     (rxd_to_the_uart2),
      .select_n_to_the_cfi_flash            (select_n_to_the_cfi_flash),
      .txd_from_the_uart                    (txd_from_the_uart),
      .txd_from_the_uart2                   (txd_from_the_uart2),
      .write_n_to_the_cfi_flash             (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram               (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                 (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram              (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram               (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram          (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram              (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram               (zs_we_n_from_the_sdram)
    );

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash[21 : 1]),
      .data     (data_to_and_from_the_cfi_flash),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  sdram_test_component the_sdram_test_component
    (
      .clk      (pll_cpu),
      .zs_addr  (zs_addr_from_the_sdram),
      .zs_ba    (zs_ba_from_the_sdram),
      .zs_cas_n (zs_cas_n_from_the_sdram),
      .zs_cke   (zs_cke_from_the_sdram),
      .zs_cs_n  (zs_cs_n_from_the_sdram),
      .zs_dq    (zs_dq_to_and_from_the_sdram),
      .zs_dqm   (zs_dqm_from_the_sdram),
      .zs_ras_n (zs_ras_n_from_the_sdram),
      .zs_we_n  (zs_we_n_from_the_sdram)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on