EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "MMv3"
Date ""
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L extraparts:RPi_Pico U4
U 1 1 60D91AB9
P 5850 4000
F 0 "U4" H 5300 5350 50  0000 C CNN
F 1 "RPi_Pico" H 5400 5250 50  0000 C CNN
F 2 "extraparts:RPi_Pico" H 5400 5450 50  0001 C CNN
F 3 "" H 5250 5600 50  0001 C CNN
	1    5850 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 60D95748
P 1600 1450
F 0 "J1" H 1657 1767 50  0000 C CNN
F 1 "PWR" H 1657 1676 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 1650 1410 50  0001 C CNN
F 3 "~" H 1650 1410 50  0001 C CNN
	1    1600 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR08
U 1 1 60D96504
P 1950 1300
F 0 "#PWR08" H 1950 1150 50  0001 C CNN
F 1 "+9V" H 1965 1473 50  0000 C CNN
F 2 "" H 1950 1300 50  0001 C CNN
F 3 "" H 1950 1300 50  0001 C CNN
	1    1950 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60D96C84
P 1950 1600
F 0 "#PWR09" H 1950 1350 50  0001 C CNN
F 1 "GND" H 1955 1427 50  0000 C CNN
F 2 "" H 1950 1600 50  0001 C CNN
F 3 "" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1350 1950 1350
Wire Wire Line
	1950 1350 1950 1300
Wire Wire Line
	1900 1550 1950 1550
Wire Wire Line
	1950 1550 1950 1600
Wire Wire Line
	1900 1450 1950 1450
Wire Wire Line
	1950 1450 1950 1550
Connection ~ 1950 1550
$Comp
L Regulator_Linear:LD1117S50TR_SOT223 U2
U 1 1 60D99D13
P 2800 1400
F 0 "U2" H 2800 1642 50  0000 C CNN
F 1 "LD1117S50TR_SOT223" H 2800 1551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2800 1600 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 2900 1150 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 60D9AA55
P 2300 1550
F 0 "C4" H 2392 1596 50  0000 L CNN
F 1 "10u" H 2392 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 1550 50  0001 C CNN
F 3 "~" H 2300 1550 50  0001 C CNN
	1    2300 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 60D9B338
P 3300 1550
F 0 "C6" H 3392 1596 50  0000 L CNN
F 1 "10u" H 3392 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3300 1550 50  0001 C CNN
F 3 "~" H 3300 1550 50  0001 C CNN
	1    3300 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 60D9C8C8
P 2800 1700
F 0 "#PWR014" H 2800 1450 50  0001 C CNN
F 1 "GND" H 2805 1527 50  0000 C CNN
F 2 "" H 2800 1700 50  0001 C CNN
F 3 "" H 2800 1700 50  0001 C CNN
	1    2800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1650 2300 1700
Wire Wire Line
	2300 1700 2800 1700
Connection ~ 2800 1700
Wire Wire Line
	2800 1700 3300 1700
Wire Wire Line
	3300 1700 3300 1650
Wire Wire Line
	3300 1450 3300 1400
Wire Wire Line
	3300 1400 3100 1400
Wire Wire Line
	2300 1450 2300 1400
Wire Wire Line
	2300 1400 2500 1400
$Comp
L power:+9V #PWR011
U 1 1 60D9D78A
P 2300 1300
F 0 "#PWR011" H 2300 1150 50  0001 C CNN
F 1 "+9V" H 2315 1473 50  0000 C CNN
F 2 "" H 2300 1300 50  0001 C CNN
F 3 "" H 2300 1300 50  0001 C CNN
	1    2300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1300 2300 1400
Connection ~ 2300 1400
NoConn ~ 6550 4700
NoConn ~ 6550 4350
NoConn ~ 6550 4450
NoConn ~ 6550 4550
NoConn ~ 6550 4250
NoConn ~ 6550 4150
Text Label 6550 4800 0    50   ~ 0
+3V3A
$Comp
L power:+3V3 #PWR028
U 1 1 60DA3649
P 6100 2500
F 0 "#PWR028" H 6100 2350 50  0001 C CNN
F 1 "+3V3" H 6115 2673 50  0000 C CNN
F 2 "" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 60D9E581
P 5850 2500
F 0 "#PWR026" H 5850 2350 50  0001 C CNN
F 1 "+5V" H 5865 2673 50  0000 C CNN
F 2 "" H 5850 2500 50  0001 C CNN
F 3 "" H 5850 2500 50  0001 C CNN
	1    5850 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR025
U 1 1 60DAD0D6
P 5600 2500
F 0 "#PWR025" H 5600 2350 50  0001 C CNN
F 1 "VBUS" H 5615 2673 50  0000 C CNN
F 2 "" H 5600 2500 50  0001 C CNN
F 3 "" H 5600 2500 50  0001 C CNN
	1    5600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1400 3300 1400
Connection ~ 3300 1400
$Comp
L power:VBUS #PWR021
U 1 1 60DB27A5
P 3950 1750
F 0 "#PWR021" H 3950 1600 50  0001 C CNN
F 1 "VBUS" H 3965 1923 50  0000 C CNN
F 2 "" H 3950 1750 50  0001 C CNN
F 3 "" H 3950 1750 50  0001 C CNN
	1    3950 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 2700 5850 2500
Wire Wire Line
	5600 2500 5600 2600
Wire Wire Line
	5600 2600 5750 2600
Wire Wire Line
	5750 2600 5750 2700
Wire Wire Line
	5950 2700 5950 2600
Wire Wire Line
	5950 2600 6100 2600
Wire Wire Line
	6100 2600 6100 2500
Text Notes 2700 2300 0    59   ~ 0
Debug
$Comp
L Switch:SW_SPST SW1
U 1 1 60DB80C3
P 2850 2900
F 0 "SW1" V 2804 2998 50  0000 L CNN
F 1 "but" V 2895 2998 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS810" H 2850 2900 50  0001 C CNN
F 3 "~" H 2850 2900 50  0001 C CNN
	1    2850 2900
	0    1    1    0   
$EndComp
$Comp
L LED:WS2812B D1
U 1 1 60DB9045
P 1650 2950
F 0 "D1" H 1350 3300 50  0000 L CNN
F 1 "WS2812B" H 1200 3200 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1700 2650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1750 2575 50  0001 L TNN
	1    1650 2950
	1    0    0    -1  
$EndComp
NoConn ~ 1950 2950
$Comp
L Device:C_Small C3
U 1 1 60DBAD8B
P 2100 2750
F 0 "C3" H 2192 2796 50  0000 L CNN
F 1 "100n" H 2192 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2100 2750 50  0001 C CNN
F 3 "~" H 2100 2750 50  0001 C CNN
	1    2100 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60DBB263
P 2100 2900
F 0 "#PWR010" H 2100 2650 50  0001 C CNN
F 1 "GND" H 2105 2727 50  0000 C CNN
F 2 "" H 2100 2900 50  0001 C CNN
F 3 "" H 2100 2900 50  0001 C CNN
	1    2100 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 60DBD03D
P 1650 2550
F 0 "#PWR06" H 1650 2400 50  0001 C CNN
F 1 "+5V" H 1665 2723 50  0000 C CNN
F 2 "" H 1650 2550 50  0001 C CNN
F 3 "" H 1650 2550 50  0001 C CNN
	1    1650 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2650 1650 2600
Wire Wire Line
	2100 2900 2100 2850
Wire Wire Line
	1650 2600 2100 2600
Wire Wire Line
	2100 2600 2100 2650
Connection ~ 1650 2600
Wire Wire Line
	1650 2600 1650 2550
$Comp
L power:GND #PWR07
U 1 1 60DC0152
P 1650 3300
F 0 "#PWR07" H 1650 3050 50  0001 C CNN
F 1 "GND" H 1655 3127 50  0000 C CNN
F 2 "" H 1650 3300 50  0001 C CNN
F 3 "" H 1650 3300 50  0001 C CNN
	1    1650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3300 1650 3250
Text Label 1350 2950 2    50   ~ 0
neopixel
$Comp
L power:GND #PWR015
U 1 1 60DC98B4
P 2850 3150
F 0 "#PWR015" H 2850 2900 50  0001 C CNN
F 1 "GND" H 2855 2977 50  0000 C CNN
F 2 "" H 2850 3150 50  0001 C CNN
F 3 "" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3150 2850 3100
Text Label 2850 2650 0    50   ~ 0
but
Wire Wire Line
	2850 2650 2850 2700
$Comp
L Connector_Generic:Conn_02x05_Top_Bottom J2
U 1 1 60DCD52C
P 3950 2950
F 0 "J2" H 4000 3367 50  0000 C CNN
F 1 "SWD" H 4000 3276 50  0000 C CNN
F 2 "Connector:Tag-Connect_TC2050-IDC-NL_2x05_P1.27mm_Vertical" H 3950 2950 50  0001 C CNN
F 3 "~" H 3950 2950 50  0001 C CNN
	1    3950 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR019
U 1 1 60DCE3A2
P 3700 2700
F 0 "#PWR019" H 3700 2550 50  0001 C CNN
F 1 "+3V3" H 3715 2873 50  0000 C CNN
F 2 "" H 3700 2700 50  0001 C CNN
F 3 "" H 3700 2700 50  0001 C CNN
	1    3700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 60DCEA8A
P 3700 3200
F 0 "#PWR020" H 3700 2950 50  0001 C CNN
F 1 "GND" H 3705 3027 50  0000 C CNN
F 2 "" H 3700 3200 50  0001 C CNN
F 3 "" H 3700 3200 50  0001 C CNN
	1    3700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3200 3700 3150
Wire Wire Line
	3700 2850 3750 2850
Wire Wire Line
	3750 2950 3700 2950
Connection ~ 3700 2950
Wire Wire Line
	3700 2950 3700 2850
Wire Wire Line
	3750 3150 3700 3150
Connection ~ 3700 3150
Wire Wire Line
	3700 3150 3700 2950
Wire Wire Line
	3750 2750 3700 2750
Wire Wire Line
	3700 2750 3700 2700
NoConn ~ 3750 3050
NoConn ~ 4250 3050
NoConn ~ 4250 2950
Text Label 6550 4900 0    50   ~ 0
RST
Text Label 4250 3150 0    50   ~ 0
RST
Text Label 5150 4800 2    50   ~ 0
SWCLK
Text Label 5150 4900 2    50   ~ 0
SWDIO
Text Label 4250 2750 0    50   ~ 0
SWDIO
Text Label 4250 2850 0    50   ~ 0
SWCLK
$Comp
L power:GND #PWR027
U 1 1 60DD3294
P 5850 5300
F 0 "#PWR027" H 5850 5050 50  0001 C CNN
F 1 "GND" H 5855 5127 50  0000 C CNN
F 2 "" H 5850 5300 50  0001 C CNN
F 3 "" H 5850 5300 50  0001 C CNN
	1    5850 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5300 5450 5300
Connection ~ 5450 5300
Wire Wire Line
	5450 5300 5550 5300
Connection ~ 5550 5300
Wire Wire Line
	5550 5300 5650 5300
Connection ~ 5650 5300
Wire Wire Line
	5650 5300 5750 5300
Connection ~ 5750 5300
Wire Wire Line
	5750 5300 5850 5300
Connection ~ 5850 5300
Wire Wire Line
	5850 5300 5950 5300
Connection ~ 5950 5300
Wire Wire Line
	5950 5300 6050 5300
Connection ~ 6050 5300
Wire Wire Line
	6050 5300 6150 5300
Connection ~ 6150 5300
Wire Wire Line
	6150 5300 6250 5300
Connection ~ 6250 5300
Wire Wire Line
	6250 5300 6350 5300
$Comp
L power:+5V #PWR024
U 1 1 60DD63C8
P 4450 1300
F 0 "#PWR024" H 4450 1150 50  0001 C CNN
F 1 "+5V" H 4465 1473 50  0000 C CNN
F 2 "" H 4450 1300 50  0001 C CNN
F 3 "" H 4450 1300 50  0001 C CNN
	1    4450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1400 4450 1300
Wire Wire Line
	4150 1400 4450 1400
Text Label 5150 3100 2    50   ~ 0
but
Text Label 5150 3200 2    50   ~ 0
neopixel
Text Notes 2600 3650 0    59   ~ 0
Fun Extras
Text Label 5150 3300 2    50   ~ 0
sda
Text Label 5150 3400 2    50   ~ 0
scl
Text Label 5150 3500 2    50   ~ 0
onewire
$Comp
L Sensor_Motion:LSM9DS1 U1
U 1 1 60DDB082
P 2350 5400
F 0 "U1" H 1900 6250 50  0000 C CNN
F 1 "LSM9DS1" H 1900 6150 50  0000 C CNN
F 2 "Package_LGA:LGA-24L_3x3.5mm_P0.43mm" H 3850 6150 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/3f/2a/d6/25/eb/48/46/DM00103319.pdf/files/DM00103319.pdf/jcr:content/translations/en.DM00103319.pdf" H 2350 5500 50  0001 C CNN
	1    2350 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60DDF6BD
P 1500 4800
F 0 "R2" H 1559 4846 50  0000 L CNN
F 1 "1k" H 1559 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1500 4800 50  0001 C CNN
F 3 "~" H 1500 4800 50  0001 C CNN
	1    1500 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 60DDFDDE
P 1200 4800
F 0 "R1" H 1259 4846 50  0000 L CNN
F 1 "1k" H 1259 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1200 4800 50  0001 C CNN
F 3 "~" H 1200 4800 50  0001 C CNN
	1    1200 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 60DE0C34
P 1200 4650
F 0 "#PWR01" H 1200 4500 50  0001 C CNN
F 1 "+3V3" H 1215 4823 50  0000 C CNN
F 2 "" H 1200 4650 50  0001 C CNN
F 3 "" H 1200 4650 50  0001 C CNN
	1    1200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4900 1500 5000
Wire Wire Line
	1500 5000 1650 5000
Wire Wire Line
	1650 5100 1200 5100
Wire Wire Line
	1200 5100 1200 4900
Wire Wire Line
	1200 4650 1200 4700
Wire Wire Line
	1500 4650 1500 4700
Text Label 1650 5100 2    50   ~ 0
sda
Text Label 1650 5000 2    50   ~ 0
scl
Wire Wire Line
	2250 6200 2350 6200
Wire Wire Line
	3050 6200 3050 5900
Connection ~ 2450 6200
Wire Wire Line
	2450 6200 3050 6200
Wire Wire Line
	3050 5500 3050 5600
Connection ~ 3050 5900
Connection ~ 3050 5600
Wire Wire Line
	3050 5600 3050 5700
Connection ~ 3050 5700
Wire Wire Line
	3050 5700 3050 5800
Connection ~ 3050 5800
Wire Wire Line
	3050 5800 3050 5900
$Comp
L power:GND #PWR013
U 1 1 60DEA692
P 2350 6200
F 0 "#PWR013" H 2350 5950 50  0001 C CNN
F 1 "GND" H 2355 6027 50  0000 C CNN
F 2 "" H 2350 6200 50  0001 C CNN
F 3 "" H 2350 6200 50  0001 C CNN
	1    2350 6200
	1    0    0    -1  
$EndComp
Connection ~ 2350 6200
Wire Wire Line
	2350 6200 2450 6200
$Comp
L Device:C_Small C2
U 1 1 60DEAEFA
P 1600 6250
F 0 "C2" H 1692 6296 50  0000 L CNN
F 1 "100n" H 1692 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1600 6250 50  0001 C CNN
F 3 "~" H 1600 6250 50  0001 C CNN
	1    1600 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 60DEC20A
P 1250 6250
F 0 "C1" H 1342 6296 50  0000 L CNN
F 1 "10n" H 1342 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1250 6250 50  0001 C CNN
F 3 "~" H 1250 6250 50  0001 C CNN
	1    1250 6250
	1    0    0    -1  
$EndComp
NoConn ~ 1650 5700
NoConn ~ 1650 5600
NoConn ~ 1650 5500
NoConn ~ 3050 5300
NoConn ~ 3050 5200
Wire Wire Line
	1600 6150 1600 6000
Wire Wire Line
	1600 6000 1650 6000
Wire Wire Line
	1250 6150 1250 5900
Wire Wire Line
	1250 5900 1650 5900
$Comp
L power:GND #PWR05
U 1 1 60DF69B6
P 1600 6400
F 0 "#PWR05" H 1600 6150 50  0001 C CNN
F 1 "GND" H 1605 6227 50  0000 C CNN
F 2 "" H 1600 6400 50  0001 C CNN
F 3 "" H 1600 6400 50  0001 C CNN
	1    1600 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60DF6D1E
P 1250 6400
F 0 "#PWR02" H 1250 6150 50  0001 C CNN
F 1 "GND" H 1255 6227 50  0000 C CNN
F 2 "" H 1250 6400 50  0001 C CNN
F 3 "" H 1250 6400 50  0001 C CNN
	1    1250 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6350 1250 6400
Wire Wire Line
	1600 6400 1600 6350
$Comp
L power:+3V3 #PWR03
U 1 1 60E0079E
P 1500 4650
F 0 "#PWR03" H 1500 4500 50  0001 C CNN
F 1 "+3V3" H 1515 4823 50  0000 C CNN
F 2 "" H 1500 4650 50  0001 C CNN
F 3 "" H 1500 4650 50  0001 C CNN
	1    1500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4600 2650 4600
Connection ~ 2450 4600
Wire Wire Line
	2450 4600 2350 4600
Connection ~ 2650 4600
Wire Wire Line
	2650 4600 2450 4600
Connection ~ 2350 4600
Connection ~ 2950 4150
Wire Wire Line
	3300 4150 2950 4150
Wire Wire Line
	3300 4200 3300 4150
Wire Wire Line
	2350 4150 2350 4100
Connection ~ 2350 4150
Wire Wire Line
	2350 4150 2950 4150
Wire Wire Line
	2950 4200 2950 4150
Wire Wire Line
	2350 4600 2350 4150
Wire Wire Line
	3300 4450 3300 4400
Wire Wire Line
	2950 4450 2950 4400
$Comp
L power:GND #PWR016
U 1 1 60E01548
P 2950 4450
F 0 "#PWR016" H 2950 4200 50  0001 C CNN
F 1 "GND" H 2955 4277 50  0000 C CNN
F 2 "" H 2950 4450 50  0001 C CNN
F 3 "" H 2950 4450 50  0001 C CNN
	1    2950 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 60E00D12
P 2350 4100
F 0 "#PWR012" H 2350 3950 50  0001 C CNN
F 1 "+3V3" H 2365 4273 50  0000 C CNN
F 2 "" H 2350 4100 50  0001 C CNN
F 3 "" H 2350 4100 50  0001 C CNN
	1    2350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 60DEC72E
P 3300 4450
F 0 "#PWR018" H 3300 4200 50  0001 C CNN
F 1 "GND" H 3305 4277 50  0000 C CNN
F 2 "" H 3300 4450 50  0001 C CNN
F 3 "" H 3300 4450 50  0001 C CNN
	1    3300 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 60DE7675
P 3300 4300
F 0 "C7" H 3392 4346 50  0000 L CNN
F 1 "100n" H 3392 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3300 4300 50  0001 C CNN
F 3 "~" H 3300 4300 50  0001 C CNN
	1    3300 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 60DE6DFC
P 2950 4300
F 0 "C5" H 3042 4346 50  0000 L CNN
F 1 "100n" H 3042 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2950 4300 50  0001 C CNN
F 3 "~" H 2950 4300 50  0001 C CNN
	1    2950 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 60E1F558
P 1600 5350
F 0 "#PWR04" H 1600 5200 50  0001 C CNN
F 1 "+3V3" V 1600 5600 50  0000 C CNN
F 2 "" H 1600 5350 50  0001 C CNN
F 3 "" H 1600 5350 50  0001 C CNN
	1    1600 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 5350 1650 5350
Wire Wire Line
	1650 5350 1650 5300
Wire Wire Line
	1650 5400 1650 5350
Connection ~ 1650 5350
$Comp
L power:+3V3 #PWR017
U 1 1 60E28617
P 3100 5050
F 0 "#PWR017" H 3100 4900 50  0001 C CNN
F 1 "+3V3" V 3100 5300 50  0000 C CNN
F 2 "" H 3100 5050 50  0001 C CNN
F 3 "" H 3100 5050 50  0001 C CNN
	1    3100 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5000 3050 5050
Wire Wire Line
	3100 5050 3050 5050
Connection ~ 3050 5050
Wire Wire Line
	3050 5050 3050 5100
$Comp
L extraparts:DS28E05R+T U3
U 1 1 60E348C1
P 4050 5300
F 0 "U3" H 4050 5550 50  0000 C CNN
F 1 "DS28E05R+T" H 4050 5450 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4050 5650 50  0001 C CNN
F 3 "" H 4050 5300 50  0001 C CNN
	1    4050 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60E3597E
P 4400 5150
F 0 "R3" H 4459 5196 50  0000 L CNN
F 1 "1k" H 4459 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4400 5150 50  0001 C CNN
F 3 "~" H 4400 5150 50  0001 C CNN
	1    4400 5150
	1    0    0    -1  
$EndComp
Text Label 4450 5300 0    50   ~ 0
onewire
Wire Wire Line
	4450 5300 4400 5300
Wire Wire Line
	4400 5250 4400 5300
Connection ~ 4400 5300
Wire Wire Line
	4400 5300 4350 5300
$Comp
L power:+3V3 #PWR023
U 1 1 60E3B17A
P 4400 5000
F 0 "#PWR023" H 4400 4850 50  0001 C CNN
F 1 "+3V3" H 4415 5173 50  0000 C CNN
F 2 "" H 4400 5000 50  0001 C CNN
F 3 "" H 4400 5000 50  0001 C CNN
	1    4400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5050 4400 5000
$Comp
L power:GND #PWR022
U 1 1 60E3E0E1
P 4050 5700
F 0 "#PWR022" H 4050 5450 50  0001 C CNN
F 1 "GND" H 4055 5527 50  0000 C CNN
F 2 "" H 4050 5700 50  0001 C CNN
F 3 "" H 4050 5700 50  0001 C CNN
	1    4050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5700 4050 5650
$Comp
L Device:R_Small R4
U 1 1 60E50AE7
P 7050 3800
F 0 "R4" V 7000 3950 50  0000 C CNN
F 1 "1M" V 7000 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7050 3800 50  0001 C CNN
F 3 "~" H 7050 3800 50  0001 C CNN
	1    7050 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 60E51A0E
P 7050 3900
F 0 "R5" V 7000 4050 50  0000 C CNN
F 1 "1M" V 7000 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7050 3900 50  0001 C CNN
F 3 "~" H 7050 3900 50  0001 C CNN
	1    7050 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 60E51C42
P 7050 4000
F 0 "R6" V 7000 4150 50  0000 C CNN
F 1 "1M" V 7000 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7050 4000 50  0001 C CNN
F 3 "~" H 7050 4000 50  0001 C CNN
	1    7050 4000
	0    1    1    0   
$EndComp
Text Label 7350 3800 0    50   ~ 0
+3V3A
Wire Wire Line
	7150 3800 7300 3800
Wire Wire Line
	7150 4000 7300 4000
Wire Wire Line
	7300 4000 7300 3900
Wire Wire Line
	7150 3900 7300 3900
Connection ~ 7300 3900
Wire Wire Line
	7300 3900 7300 3800
Wire Wire Line
	7350 3800 7300 3800
Connection ~ 7300 3800
Text Label 6550 3800 0    50   ~ 0
r_adc
Text Label 6550 3900 0    50   ~ 0
c_adc
Text Label 6550 4000 0    50   ~ 0
l_adc
Wire Wire Line
	6550 3800 6950 3800
Wire Wire Line
	6550 3900 6950 3900
Wire Wire Line
	6550 4000 6950 4000
$Comp
L Transistor_FET:DMG2301L Q1
U 1 1 60EA7C03
P 3950 1500
F 0 "Q1" V 4292 1500 50  0000 C CNN
F 1 "DMG2301L" V 4201 1500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4150 1425 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/DMG2301L.pdf" H 3950 1500 50  0001 L CNN
	1    3950 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 1700 3950 1750
Text Label 6550 3700 0    50   ~ 0
lir_en
Text Label 6550 3500 0    50   ~ 0
lir_a
Text Label 6550 3600 0    50   ~ 0
lir_b
$Sheet
S 8100 2100 550  500 
U 60F3A827
F0 "lir" 50
F1 "ir.sch" 50
F2 "en" I L 8100 2200 50 
F3 "a" I L 8100 2300 50 
F4 "b" I L 8100 2400 50 
F5 "adc" I L 8100 2500 50 
$EndSheet
$Sheet
S 9050 2100 550  500 
U 60F5AA2F
F0 "cir" 50
F1 "ir.sch" 50
F2 "en" I L 9050 2200 50 
F3 "a" I L 9050 2300 50 
F4 "b" I L 9050 2400 50 
F5 "adc" I L 9050 2500 50 
$EndSheet
$Sheet
S 10050 2100 550  500 
U 60F5D694
F0 "rir" 50
F1 "ir.sch" 50
F2 "en" I L 10050 2200 50 
F3 "a" I L 10050 2300 50 
F4 "b" I L 10050 2400 50 
F5 "adc" I L 10050 2500 50 
$EndSheet
Text Label 8100 2500 2    50   ~ 0
l_adc
Text Label 8100 2300 2    50   ~ 0
lir_a
Text Label 8100 2400 2    50   ~ 0
lir_b
Text Label 8100 2200 2    50   ~ 0
lir_en
NoConn ~ 5150 3600
Text Label 5150 3700 2    50   ~ 0
rir_a
Text Label 5150 3800 2    50   ~ 0
rir_b
Text Label 5150 3900 2    50   ~ 0
rir_en
Text Label 5150 4000 2    50   ~ 0
cir_a
Text Label 5150 4100 2    50   ~ 0
cir_b
Text Label 5150 4200 2    50   ~ 0
cir_en
Text Label 9050 2200 2    50   ~ 0
cir_en
Text Label 9050 2300 2    50   ~ 0
cir_a
Text Label 9050 2400 2    50   ~ 0
cir_b
Text Label 9050 2500 2    50   ~ 0
c_adc
Text Label 10050 2200 2    50   ~ 0
rir_en
Text Label 10050 2300 2    50   ~ 0
rir_a
Text Label 10050 2400 2    50   ~ 0
rir_b
Text Label 10050 2500 2    50   ~ 0
r_adc
Text Notes 9150 1850 0    59   ~ 0
Sensors
Text Notes 8950 2950 0    59   ~ 0
Motors/Encoders
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 60F73B7A
P 8450 3650
F 0 "J3" H 8368 3125 50  0000 C CNN
F 1 "left_mot" H 8368 3216 50  0000 C CNN
F 2 "extraparts:JST_ZH_Vert_6pin" H 8450 3650 50  0001 C CNN
F 3 "~" H 8450 3650 50  0001 C CNN
	1    8450 3650
	-1   0    0    1   
$EndComp
Text Label 8650 3850 0    59   ~ 0
lmot_m1
Text Label 8650 3350 0    59   ~ 0
lmot_m2
$Comp
L power:GND #PWR030
U 1 1 60F78863
P 9100 3800
F 0 "#PWR030" H 9100 3550 50  0001 C CNN
F 1 "GND" H 9105 3627 50  0000 C CNN
F 2 "" H 9100 3800 50  0001 C CNN
F 3 "" H 9100 3800 50  0001 C CNN
	1    9100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3800 9100 3750
Wire Wire Line
	9100 3750 8650 3750
Text Label 8650 3650 0    59   ~ 0
lenc_a
Text Label 8650 3550 0    59   ~ 0
lenc_b
$Comp
L power:+3V3 #PWR029
U 1 1 60F7EA01
P 9100 3400
F 0 "#PWR029" H 9100 3250 50  0001 C CNN
F 1 "+3V3" H 9115 3573 50  0000 C CNN
F 2 "" H 9100 3400 50  0001 C CNN
F 3 "" H 9100 3400 50  0001 C CNN
	1    9100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3450 9100 3450
Wire Wire Line
	9100 3450 9100 3400
$Comp
L Connector_Generic:Conn_01x06 J5
U 1 1 60F89CDA
P 9600 3650
F 0 "J5" H 9518 3125 50  0000 C CNN
F 1 "right_mot" H 9518 3216 50  0000 C CNN
F 2 "extraparts:JST_ZH_Vert_6pin" H 9600 3650 50  0001 C CNN
F 3 "~" H 9600 3650 50  0001 C CNN
	1    9600 3650
	-1   0    0    1   
$EndComp
Text Label 9800 3850 0    59   ~ 0
rmot_m1
Text Label 9800 3350 0    59   ~ 0
rmot_m2
$Comp
L power:GND #PWR034
U 1 1 60F89CE2
P 10250 3800
F 0 "#PWR034" H 10250 3550 50  0001 C CNN
F 1 "GND" H 10255 3627 50  0000 C CNN
F 2 "" H 10250 3800 50  0001 C CNN
F 3 "" H 10250 3800 50  0001 C CNN
	1    10250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3800 10250 3750
Wire Wire Line
	10250 3750 9800 3750
Text Label 9800 3650 0    59   ~ 0
renc_a
Text Label 9800 3550 0    59   ~ 0
renc_b
$Comp
L power:+3V3 #PWR033
U 1 1 60F89CEC
P 10250 3400
F 0 "#PWR033" H 10250 3250 50  0001 C CNN
F 1 "+3V3" H 10265 3573 50  0000 C CNN
F 2 "" H 10250 3400 50  0001 C CNN
F 3 "" H 10250 3400 50  0001 C CNN
	1    10250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3450 10250 3450
Wire Wire Line
	10250 3450 10250 3400
Text Label 5150 4400 2    59   ~ 0
lenc_b
Text Label 5150 4300 2    59   ~ 0
lenc_a
Text Label 5150 4500 2    59   ~ 0
renc_a
Text Label 5150 4600 2    59   ~ 0
renc_b
$Comp
L Connector_Generic:Conn_01x06 J4
U 1 1 60F8FA45
P 8450 4900
F 0 "J4" H 8450 5300 50  0000 C CNN
F 1 "DRV8833_L" H 8450 5200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 8450 4900 50  0001 C CNN
F 3 "~" H 8450 4900 50  0001 C CNN
	1    8450 4900
	-1   0    0    -1  
$EndComp
Text Notes 9050 4300 0    59   ~ 0
Motor Driver
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 60F9308F
P 10200 4900
F 0 "J6" H 10150 4400 50  0000 L CNN
F 1 "DRV8833_R" H 10000 4500 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 10200 4900 50  0001 C CNN
F 3 "~" H 10200 4900 50  0001 C CNN
	1    10200 4900
	1    0    0    -1  
$EndComp
Text Label 6550 3400 0    59   ~ 0
lmot_in1
Text Label 6550 3300 0    59   ~ 0
lmot_in2
Text Label 6550 3200 0    59   ~ 0
rmot_in1
Text Label 6550 3100 0    59   ~ 0
rmot_in2
Text Label 8650 4700 0    59   ~ 0
rmot_in2
Text Label 8650 4800 0    59   ~ 0
rmot_in1
Text Label 8650 5100 0    59   ~ 0
lmot_in2
Text Label 8650 5200 0    59   ~ 0
lmot_in1
$Comp
L power:GND #PWR031
U 1 1 60FA4426
P 9150 4850
F 0 "#PWR031" H 9150 4600 50  0001 C CNN
F 1 "GND" H 9155 4677 50  0000 C CNN
F 2 "" H 9150 4850 50  0001 C CNN
F 3 "" H 9150 4850 50  0001 C CNN
	1    9150 4850
	-1   0    0    1   
$EndComp
$Comp
L power:+9V #PWR032
U 1 1 60FA4A36
P 9150 5050
F 0 "#PWR032" H 9150 4900 50  0001 C CNN
F 1 "+9V" H 9165 5223 50  0000 C CNN
F 2 "" H 9150 5050 50  0001 C CNN
F 3 "" H 9150 5050 50  0001 C CNN
	1    9150 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8650 5000 9150 5000
Wire Wire Line
	9150 5000 9150 5050
Wire Wire Line
	9150 4850 9150 4900
Wire Wire Line
	9150 4900 8650 4900
NoConn ~ 10000 4700
NoConn ~ 10000 5200
Text Label 10000 4800 2    59   ~ 0
lmot_m2
Text Label 10000 4900 2    59   ~ 0
lmot_m1
Text Label 10000 5000 2    59   ~ 0
rmot_m2
Text Label 10000 5100 2    59   ~ 0
rmot_m1
$EndSCHEMATC
