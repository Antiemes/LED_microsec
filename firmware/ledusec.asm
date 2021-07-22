list p=pic16f876a
include p16f876a.inc
	__CONFIG _HS_OSC & _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON & _LVP_OFF & _DEBUG_OFF
	org 0

	radix dec

;----------[ VARIABLES ]-----------

	cblock 0x20
  i
  j
  m1
  m10
  h1
  h10
  sec
  sub_sec_h
  sub_sec_l
  actual_digit
  portd_bit
  display_skip_counter
  rx_d

	endc

	cblock 0x70 ; Minden bankban ugyanaz
	w_save
	status_save
	fsr_save
	endc

;----------[ MAKROK BANKVALTASHOZ ]

bank0   macro
        bcf     status, rp0
        endm

bank1   macro
        bsf     status, rp0
        endm

;==========================================================================
delay macro
  nop
  nop
  nop
  ;delay1us
  endm
;==========================================================================
delay10us macro
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  endm
;==========================================================================
delay1us macro
  nop
  nop
  nop
  nop
  nop
  endm
;==========================================================================
delay2 macro
  delay
  delay1us
  endm
;==========================================================================
delay1000us macro
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  endm
;==========================================================================

;----------[ RESET VECTOR ]--------

	org 0

	clrf PCLATH ; Ezeket a bootloader miatt kell beletenni.
	goto start
	goto start
	goto start

;----------[ MAIN PROGRAM ]--------

start

	bank0
  call bigdelay

	bank1

	clrf TRISB ; A portb minden bitje output
  clrf TRISA
  clrf TRISC

	bank0

  movlw 0x00
  movwf PORTB

foo
  movlw 0x01
  movwf PORTB
  delay
  
  movlw 0x02
  movwf PORTB
  delay
  
  movlw 0x04
  movwf PORTB
  delay
  
  movlw 0x08
  movwf PORTB
  delay
  ;delay1000us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  ;delay1us
  ;delay1us
  ;delay1us
 
  delay10us
  delay10us
  delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay1us
  ;delay1us

  movlw 0x10
  movwf PORTB
  delay
  
  movlw 0x20
  movwf PORTB
  delay
  
  movlw 0x40
  movwf PORTB
  delay
  
  movlw 0x80
  movwf PORTB
  delay
  
  movlw 0x00
  movwf PORTB
  nop


  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay10us
  ;delay1us
  ;delay1us


  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  ;call delay100us
  call delay100us
  call delay100us
  call delay100us
  call delay100us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;delay1000us
  ;
  delay10us
  delay10us
  delay10us
  delay10us
  delay10us
  delay10us
  delay10us
  delay10us
  delay10us
  ;delay10us
  ;delay1us
  ;delay1us
  ;delay1us
  
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us
  delay1us


  ;nop
  ;nop

  goto foo

;==========================================================================
bigdelay
  movlw 20
  movwf j
init_delay_out
  movlw 20
  movwf i
init_delay_in
  decfsz i
  goto init_delay_in
  decfsz j
  goto init_delay_out
  return

;==========================================================================
delay100us
  movlw 99
  movwf i
init_delay
  nop
  nop
  decfsz i
  goto init_delay
  return

;==========================================================================

  end
