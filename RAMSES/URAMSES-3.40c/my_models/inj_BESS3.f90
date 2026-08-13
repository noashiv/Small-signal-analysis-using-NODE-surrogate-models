!  MODEL NAME : inj_BESS3               
!  MODEL DESCRIPTION FILE : BESS3.txt
!  Data :
!       prm(  1)=  PN
!       prm(  2)=  Iprate
!       prm(  3)=  Tg
!       prm(  4)=  Tm
!       prm(  5)=  tLVRT1
!       prm(  6)=  tLVRT2
!       prm(  7)=  tLVRTint
!       prm(  8)=  Vmax
!       prm(  9)=  tau              ! response time of the PLL in milliseconds
!       prm( 10)=  Vminpll          ! Voltage magnitude under which the PLL is blocked
!       prm( 11)=  a 		 ! Vr		
!       prm( 12)=  Vmin
!       prm( 13)=  Vint
!       prm( 14)=  fmin
!       prm( 15)=  fmax
!       prm( 16)=  Trv                  ! Time after which units are allowed to reconnect to the network
!       prm( 17)=  Trf                  ! Time after which units reconnect after frequency protection was triggered
!       prm( 18)=  Re
!       prm( 19)=  Xe
!       prm( 20)=  CM1
!       prm( 21)=  kRCI
!       prm( 22)=  kRCA
!       prm( 23)=  m
!       prm( 24)=  n
!       prm( 25)=  dbmin
!       prm( 26)=  dbmax
!       prm( 27)=  HVRT
!       prm( 28)=  LVRT
!       prm( 29)=  CM2
!       prm( 30)=  Vtrip
!       prm( 31)=  fdbup
!       prm( 32)=  fdbdn
!       prm( 33)=  Rup
!       prm( 34)=  Rdn
!       prm( 35)=  Trocof
!       prm( 36)=  dfmax
!       prm( 37)=  SOCini
!       prm( 38)=  SOCmin
!       prm( 39)=  SOCmax
!       prm( 40)=  Capacity            ! capacity of battery in MWh
!  Parameters :
!       prm( 41)=  IN  
!       prm( 42)=  vxlv  
!       prm( 43)=  vylv  
!       prm( 44)=  Vref  
!       prm( 45)=  Pext  
!       prm( 46)=  Qext  
!       prm( 47)=  Iqref  
!       prm( 48)=  Ipref  
!       prm( 49)=  kpll  
!       prm( 50)=  theta_PLL  
!       prm( 51)=  Uplim  
!       prm( 52)=  Downlim  
!       prm( 53)=  Downlimdisc  
!       prm( 54)=  UplimdeltaP  
!       prm( 55)=  DownlimdeltaP  
!       prm( 56)=  Tlim  
!       prm( 57)=  Uplimdis  
!       prm( 58)=  downlimdis  
!       prm( 59)=  ratemax  
!       prm( 60)=  rate  
!       prm( 61)=  rateh  
!       prm( 62)=  fref  
!       prm( 63)=  dfup  
!       prm( 64)=  dfdn  
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  vxl                   
!       x(  4)=  vyl                   
!       x(  5)=  Vt                    
!       x(  6)=  PLLPhaseAngle         
!       x(  7)=  Vm                    
!       x(  8)=  x2                    
!       x(  9)=  Ip                    
!       x( 10)=  Iq                    
!       x( 11)=  Ipcmd                 
!       x( 12)=  Iqcmd                 
!       x( 13)=  Iqmax                 
!       x( 14)=  Iqmin                 
!       x( 15)=  x4                    
!       x( 16)=  DeltaW                
!       x( 17)=  DeltaWf               
!       x( 18)=  vq                    
!       x( 19)=  vd                    
!       x( 20)=  Pgen                  
!       x( 21)=  Qgen                  
!       x( 22)=  Iqext                 
!       x( 23)=  Fvl                   
!       x( 24)=  Fvli                  
!       x( 25)=  z1                    
!       x( 26)=  x5                    
!       x( 27)=  Iptemp                
!       x( 28)=  Iqtemp                
!       x( 29)=  x10                   
!       x( 30)=  x11                   
!       x( 31)=  z                     
!       x( 32)=  deltaV                
!       x( 33)=  Pflag                 
!       x( 34)=  vxlm                  
!       x( 35)=  vylm                  
!       x( 36)=  omegam                
!       x( 37)=  fm                    
!       x( 38)=  fmfilt                
!       x( 39)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 40)=  Ffl                   
!       x( 41)=  Ffhi                  
!       x( 42)=  Ffh                   
!       x( 43)=  Ptot                  
!       x( 44)=  deltafl               
!       x( 45)=  deltafh               
!       x( 46)=  mult                  
!       x( 47)=  deltaVPLL             
!       x( 48)=  wpll                  
!       x( 49)=  g                     
!       x( 50)=  tr                    
!       x( 51)=  Fr                    
!       x( 52)=  Frtemp                
!       x( 53)=  fvlb                  
!       x( 54)=  deltafvl              
!       x( 55)=  g1                    
!       x( 56)=  tr1                   
!       x( 57)=  Frvh                  
!       x( 58)=  Frvhtemp              
!       x( 59)=  fvhb                  
!       x( 60)=  deltafvh              
!       x( 61)=  g2                    
!       x( 62)=  tr2                   
!       x( 63)=  Frfl                  
!       x( 64)=  Frfltemp              
!       x( 65)=  fflb                  
!       x( 66)=  deltaffl              
!       x( 67)=  g3                    
!       x( 68)=  tr3                   
!       x( 69)=  Frfh                  
!       x( 70)=  Frfhtemp              
!       x( 71)=  ffhb                  
!       x( 72)=  deltaffh              
!       x( 73)=  w1                    
!       x( 74)=  w2                    
!       x( 75)=  w3                    
!       x( 76)=  w4                    
!       x( 77)=  w5                    
!       x( 78)=  w6                    
!       x( 79)=  w7                    
!       x( 80)=  Frvhtemp1             
!       x( 81)=  one                   
!       x( 82)=  zero                  
!       x( 83)=  status                
!       x( 84)=  deltaf                
!       x( 85)=  rocof                 
!       x( 86)=  abrocof               
!       x( 87)=  deltarocof            
!       x( 88)=  Ffri                  
!       x( 89)=  Ffr                   
!       x( 90)=  g4                    
!       x( 91)=  tr4                   
!       x( 92)=  deltaffr              
!       x( 93)=  deltaSOCl             
!       x( 94)=  deltaSOCh             
!       x( 95)=  BatEmpty              
!       x( 96)=  BatFul                
!       x( 97)=  SOC                   
!       x( 98)=  delta_Ebat            
!       x( 99)=  I                     
!       x(100)=  Ipmaxi                
!       x(101)=  Ipmax                 
!       x(102)=  Ipmini                
!       x(103)=  Ipmin                 

!.........................................................................................................

subroutine inj_BESS3(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
   obsname,adix,adiy,eqtyp,tc,t,omega,sbase,bus,vx,vy,ix,iy,x,z,f,obs)

   use MODELING
   use FREQUENCY
   use ISLAND, only : isl
   use SETTINGS, only : blocktol1,omega_ref,pi
   use FUNCTIONS_IN_MODELS

   implicit none
   double precision, intent(in):: t,vx,vy,omega,sbase,ix,iy
   double precision, intent(out):: f(*)
   double precision :: obs(*)
   double precision, intent(inout):: x(*),prm(*),tc(*)
   integer, intent(in):: nb,mode,bus
   integer, intent(inout):: nbxvar,nbzvar,nbdata,nbaddpar,nbobs,eqtyp(*),z(*),adix,adiy
   character(len=20), intent(in):: name
   character(len=10) :: parname(*),obsname(*)

   select case (mode)
   case (define_var_and_par)
      nbdata= 40
      nbaddpar= 24
      parname(  1)='PN'
      parname(  2)='Iprate'
      parname(  3)='Tg'
      parname(  4)='Tm'
      parname(  5)='tLVRT1'
      parname(  6)='tLVRT2'
      parname(  7)='tLVRTint'
      parname(  8)='Vmax'
      parname(  9)='tau'
      parname( 10)='Vminpll'
      parname( 11)='a'
      parname( 12)='Vmin'
      parname( 13)='Vint'
      parname( 14)='fmin'
      parname( 15)='fmax'
      parname( 16)='Trv'
      parname( 17)='Trf'
      parname( 18)='Re'
      parname( 19)='Xe'
      parname( 20)='CM1'
      parname( 21)='kRCI'
      parname( 22)='kRCA'
      parname( 23)='m'
      parname( 24)='n'
      parname( 25)='dbmin'
      parname( 26)='dbmax'
      parname( 27)='HVRT'
      parname( 28)='LVRT'
      parname( 29)='CM2'
      parname( 30)='Vtrip'
      parname( 31)='fdbup'
      parname( 32)='fdbdn'
      parname( 33)='Rup'
      parname( 34)='Rdn'
      parname( 35)='Trocof'
      parname( 36)='dfmax'
      parname( 37)='SOCini'
      parname( 38)='SOCmin'
      parname( 39)='SOCmax'
      parname( 40)='Capacity'
      parname( 41)='IN'
      parname( 42)='vxlv'
      parname( 43)='vylv'
      parname( 44)='Vref'
      parname( 45)='Pext'
      parname( 46)='Qext'
      parname( 47)='Iqref'
      parname( 48)='Ipref'
      parname( 49)='kpll'
      parname( 50)='theta_PLL'
      parname( 51)='Uplim'
      parname( 52)='Downlim'
      parname( 53)='Downlimdisc'
      parname( 54)='UplimdeltaP'
      parname( 55)='DownlimdeltaP'
      parname( 56)='Tlim'
      parname( 57)='Uplimdis'
      parname( 58)='downlimdis'
      parname( 59)='ratemax'
      parname( 60)='rate'
      parname( 61)='rateh'
      parname( 62)='fref'
      parname( 63)='dfup'
      parname( 64)='dfdn'
      adix=  1
      adiy=  2
      nbxvar=111
      nbzvar= 42

!........................................................................................
   case (define_obs)
      nbobs= 23
      obsname(  1)='Ip'
      obsname(  2)='Iq'
      obsname(  3)='Pgen'
      obsname(  4)='Qgen'
      obsname(  5)='Vm'
      obsname(  6)='fmfilt'
      obsname(  7)='status'
      obsname(  8)='Ipcmd'
      obsname(  9)='Vt'
      obsname( 10)='wpll'
      obsname( 11)='vq'
      obsname( 12)='rocof'
      obsname( 13)='SOC'
      obsname( 14)='BatEmpty'
      obsname( 15)='BatFul'
      obsname( 16)='delta_Ebat'
      obsname( 17)='Ipmin'
      obsname( 18)='Ipmax'
      obsname( 19)='I'
      obsname( 20)='Iqmin'
      obsname( 21)='Iqmax'
      obsname( 22)='Ipmaxi'
      obsname( 23)='Ipmini'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 20)              
      obs(  4)=x( 21)              
      obs(  5)=x(  7)              
      obs(  6)=x( 38)              
      obs(  7)=x( 83)              
      obs(  8)=x( 11)              
      obs(  9)=x(  5)              
      obs( 10)=x( 48)              
      obs( 11)=x( 18)              
      obs( 12)=x( 85)              
      obs( 13)=x( 97)              
      obs( 14)=x( 95)              
      obs( 15)=x( 96)              
      obs( 16)=x( 98)              
      obs( 17)=x(103)              
      obs( 18)=x(101)              
      obs( 19)=x( 99)              
      obs( 20)=x( 14)              
      obs( 21)=x( 13)              
      obs( 22)=x(100)              
      obs( 23)=x(102)              

!........................................................................................
   case (initialize)

!IN = {PN}
      prm( 41)= prm(  1)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 42)= vx + prm( 18)*ix - prm( 19)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 43)= vy + prm( 18)*iy + prm( 19)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 44)= dsqrt(prm( 42)**2 + prm( 43)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 45)= -prm( 42)*ix-prm( 43)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 46)= +prm( 42)*iy-prm( 43)*ix

!Iqref = -{Qext}/{Vref}
      prm( 47)= -prm( 46)/prm( 44)

!Ipref = -{Pext}/{Vref}
      prm( 48)= -prm( 45)/prm( 44)

!kpll = 10/({tau}*0.001)
      prm( 49)= 10/(prm(  9)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 50)= atan(prm( 43)/prm( 42))

!Uplim = 9999
      prm( 51)= 9999

!Downlim = -9999
      prm( 52)= -9999

!Downlimdisc = 0
      prm( 53)= 0

!UplimdeltaP = 9999
      prm( 54)= 9999

!DownlimdeltaP = 0
      prm( 55)= 0

!Tlim = 0.01
      prm( 56)= 0.01

!Uplimdis = 0
      prm( 57)= 0

!downlimdis = -9999
      prm( 58)= -9999

!ratemax = {Iprate}*{IN}
      prm( 59)= prm(  2)*prm( 41)

!rate = 0.5
      prm( 60)= 0.5

!rateh = 0.5
      prm( 61)= 0.5

!fref = 1
      prm( 62)= 1

!dfup = 1/{Rup} * {PN}/sbase
      prm( 63)= 1/prm( 33) * prm(  1)/sbase

!dfdn = 1/{Rdn} * {PN}/sbase
      prm( 64)= 1/prm( 34) * prm(  1)/sbase

!vxl =  {vxlv}
      x(  3)= prm( 42)

!vyl =  {vylv}
      x(  4)= prm( 43)

!Vt =  {Vref}
      x(  5)= prm( 44)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 50)

!Vm =  {Vref}
      x(  7)= prm( 44)

!x2 =  {Vref}
      x(  8)= prm( 44)

!Ip =  {Ipref}
      x(  9)= prm( 48)

!Iq =  {Iqref}
      x( 10)= prm( 47)

!Ipcmd =  {Ipref}
      x( 11)= prm( 48)

!Iqcmd =  {Iqref}
      x( 12)= prm( 47)

!Iqmax =  dsqrt({IN}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm( 41)**2 - prm( 48)**2 )

!Iqmin =  - dsqrt({IN}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm( 41)**2 - prm( 48)**2 )

!x4 =  {Ipref}
      x( 15)= prm( 48)

!DeltaW =  0
      x( 16)= 0

!DeltaWf =   0
      x( 17)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 18)= -prm( 42)*sin(prm( 50)) + prm( 43)*cos(prm( 50))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 19)= prm( 42)*cos(prm( 50)) + prm( 43)*sin(prm( 50))

!Pgen =  -{Pext}
      x( 20)= -prm( 45)

!Qgen =  -{Qext}
      x( 21)= -prm( 46)

!Iqext =  0
      x( 22)= 0

!Fvl =  1
      x( 23)= 1

!Fvli =  1
      x( 24)= 1

!z1 =  0.
      x( 25)= 0.

!x5 =  {Iqref}
      x( 26)= prm( 47)

!Iptemp =  {Ipref}
      x( 27)= prm( 48)

!Iqtemp =  {Iqref}
      x( 28)= prm( 47)

!x10 =  -{Vref}
      x( 29)= -prm( 44)

!x11 =  {Vref} - {Vmax}
      x( 30)= prm( 44) - prm(  8)

!z =  0.
      x( 31)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 32)= prm( 44) - prm( 25)

!Pflag =  1
      x( 33)= 1

!vxlm =  {vxlv}
      x( 34)= prm( 42)

!vylm =  {vylv}
      x( 35)= prm( 43)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 36)= -0.5*(prm( 42)*sin(prm( 50)) - prm( 43)*cos(prm( 50))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 37)= 50*(-0.5*(prm( 42)*sin(prm( 50)) - prm( 43)*cos(prm( 50))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 38)= 50*(-0.5*(prm( 42)*sin(prm( 50)) - prm( 43)*cos(prm( 50))) + 1)

!Ffli =  1.
      x( 39)= 1.

!Ffl =  1.
      x( 40)= 1.

!Ffhi =  1.
      x( 41)= 1.

!Ffh =  1.
      x( 42)= 1.

!Ptot =  -{Pext}
      x( 43)= -prm( 45)

!deltafl =  50*[omega] - {fmin}
      x( 44)= 50*omega - prm( 14)

!deltafh =  {fmax} - 50*[omega]
      x( 45)= prm( 15) - 50*omega

!mult =  1
      x( 46)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 47)= prm( 44) - prm( 10)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 48)= -(prm( 42)*sin(prm( 50)) - prm( 43)*cos(prm( 50)))*prm( 49) + 2*pi*50

!g =  0
      x( 49)= 0

!tr =  0
      x( 50)= 0

!Fr =  1
      x( 51)= 1

!Frtemp =  1
      x( 52)= 1

!fvlb =  1
      x( 53)= 1

!deltafvl =  -{Trv}
      x( 54)= -prm( 16)

!g1 =  1
      x( 55)= 1

!tr1 = 0
      x( 56)=0

!Frvh =  1
      x( 57)= 1

!Frvhtemp =  1
      x( 58)= 1

!fvhb =  1
      x( 59)= 1

!deltafvh =  -{Trv}
      x( 60)= -prm( 16)

!g2 =  0
      x( 61)= 0

!tr2 =  0
      x( 62)= 0

!Frfl =  1
      x( 63)= 1

!Frfltemp =  1
      x( 64)= 1

!fflb =  1
      x( 65)= 1

!deltaffl =  -{Trf}
      x( 66)= -prm( 17)

!g3 =  0
      x( 67)= 0

!tr3 =  0
      x( 68)= 0

!Frfh =  1
      x( 69)= 1

!Frfhtemp =  1
      x( 70)= 1

!ffhb =  1
      x( 71)= 1

!deltaffh =  -{Trf}
      x( 72)= -prm( 17)

!w1 =  0
      x( 73)= 0

!w2 =  0
      x( 74)= 0

!w3 =  0
      x( 75)= 0

!w4 =  0
      x( 76)= 0

!w5 =  0
      x( 77)= 0

!w6 =  0
      x( 78)= 0

!w7 =  0
      x( 79)= 0

!Frvhtemp1 = 1
      x( 80)=1

!one =  1
      x( 81)= 1

!zero =  0
      x( 82)= 0

!status =  1
      x( 83)= 1

!deltaf =  0
      x( 84)= 0

!rocof =  0
      x( 85)= 0

!abrocof =  0
      x( 86)= 0

!deltarocof =  {dfmax} - 0
      x( 87)= prm( 36) - 0

!Ffri =  1
      x( 88)= 1

!Ffr =  1
      x( 89)= 1

!g4 =  0
      x( 90)= 0

!tr4 =  0
      x( 91)= 0

!deltaffr =  0.25
      x( 92)= 0.25

!deltaSOCl =  -{SOCini}+{SOCmin}
      x( 93)= -prm( 37)+prm( 38)

!deltaSOCh =  -{SOCmax}+{SOCini}
      x( 94)= -prm( 39)+prm( 37)

!BatEmpty =  0.
      x( 95)= 0.

!BatFul =  0.
      x( 96)= 0.

!SOC =  {SOCini}
      x( 97)= prm( 37)

!delta_Ebat =  0.
      x( 98)= 0.

!I =  dsqrt({Ipref}**2+{Iqref}**2)
      x( 99)= dsqrt(prm( 48)**2+prm( 47)**2)

!Ipmaxi =  {IN}
      x(100)= prm( 41)

!Ipmax =  {IN}
      x(101)= prm( 41)

!Ipmini =  -{IN}
      x(102)= -prm( 41)

!Ipmin =  -{IN}
      x(103)= -prm( 41)

!& algeq
      eqtyp(  1)=0

!& algeq
      eqtyp(  2)=0

!& algeq
      eqtyp(  3)=0

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance
      eqtyp(  4)=0

!& algeq
      eqtyp(  5)=0

!& algeq             ! voltage magnitude at PV
      eqtyp(  6)=0

!& tf1p              ! measurement delay of voltage magnitude
      eqtyp(  7)=  7
      tc(  7)=prm(  4)

!& max1v1c
      eqtyp(  8)=0
      if(x(  7)<0.01)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq         ! maximum active current computation
      eqtyp(  9)=0

!& limvb         ! limit current Ipcmd
      eqtyp( 10)=0
      if(x( 15)>x(101))then
         z(  2)=1
      elseif(x( 15)<x(103))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq
      eqtyp( 11)=0

!& algeq         ! output current computation, consider protection status
      eqtyp( 12)=0

!& tf1p2lim
      if(prm(  3)< 0.001)then
         prm(  3)=0.d0
         prm( 52)=-huge(0.d0)
         prm( 51)= huge(0.d0)
         prm( 52)=-huge(0.d0)
         prm( 59)= huge(0.d0)
      endif
      if(1*x( 11)-x( 27)>prm( 59)*prm(  3))then
         z(  3)=1
      elseif(1*x( 11)-x( 27)<prm( 52)*prm(  3))then
         z(  3)=-1
      else
         z(  3)=0
      endif
      eqtyp( 13)=0
      if(x( 27)>prm( 51))then
         z(  4)=1
         eqtyp( 14)=0
      elseif(x( 27)<prm( 52))then
         z(  4)=-1
         eqtyp( 14)=0
      else
         z(  4)=0
         eqtyp( 14)= 27
      endif
      tc( 14)=prm(  3)

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      eqtyp( 15)=0

!& algeq
      eqtyp( 16)=0

!& algeq                 ! reactive current computation limit and update
      eqtyp( 17)=0

!& limvb
      eqtyp( 18)=0
      if(x( 26)>x( 13))then
         z(  5)=1
      elseif(x( 26)<x( 14))then
         z(  5)=-1
      else
         z(  5)=0
      endif

!& algeq						!
      eqtyp( 19)=0

!& tf1p
      eqtyp( 20)= 28
      tc( 20)=prm(  3)

!& algeq 				  ! Active - reactive power priority, max active current
      eqtyp( 21)=0

!& algeq         ! minimum current
      eqtyp( 22)=0

!& db 						! Reactive current injection, voltage support
      eqtyp( 23)=0
      if(x(  7)>prm( 26))then
         z(  6)=1
      elseif(x(  7)<prm( 25))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq   						!  Low voltage ride-through and LV protection flag
      eqtyp( 24)=0

!& timer5
      eqtyp( 25)=0
      eqtyp( 26)=0
      z(  7)=-1
      x(105)=0.

!& algeq 		
      eqtyp( 27)=0

!& hyst
      eqtyp( 28)=0
      if(x( 24)>1.1)then
         z(  8)=1
      elseif(x( 24)<0.9)then
         z(  8)=-1
      else
         if(1.>= 0.)then
            z(  8)=1
         else
            z(  8)=-1
         endif
      endif

!& algeq
      eqtyp( 29)=0

!& inlim
      if (1>= 0.005)then
         tc( 30)=1
      endif
      if (x( 50)>5)then
         z(  9)=1
         eqtyp( 30)=0
      elseif (x( 50)<0.) then
         z(  9)=-1
         eqtyp( 30)=0
      else
         z(  9)=0
         if (1>= 0.005)then
            eqtyp( 30)= 50
         else
            eqtyp( 30)=0
         endif
      endif

!& algeq
      eqtyp( 31)=0

!& algeq
      eqtyp( 32)=0

!& swsign
      eqtyp( 33)=0
      if(x( 54)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 53)=-huge(0.d0)
         prm( 51)= huge(0.d0)
         prm( 52)=-huge(0.d0)
         prm( 60)= huge(0.d0)
      endif
      if(1*x( 52)-x( 51)>prm( 60)*prm( 56))then
         z( 11)=1
      elseif(1*x( 52)-x( 51)<prm( 52)*prm( 56))then
         z( 11)=-1
      else
         z( 11)=0
      endif
      eqtyp( 34)=0
      if(x( 51)>prm( 51))then
         z( 12)=1
         eqtyp( 35)=0
      elseif(x( 51)<prm( 53))then
         z( 12)=-1
         eqtyp( 35)=0
      else
         z( 12)=0
         eqtyp( 35)= 51
      endif
      tc( 35)=prm( 56)

!& algeq								! High voltage ride-through and HV protection flag
      eqtyp( 36)=0

!& pwlin4
      eqtyp( 37)=0
      if(x( 30)<(-999))then
         z( 13)=1
      elseif(x( 30)>=999)then
         z( 13)=   3
      elseif((-999)<=x( 30) .and. x( 30)<0.)then
         z( 13)=  1
      elseif(0.<=x( 30) .and. x( 30)<0.)then
         z( 13)=  2
      elseif(0.<=x( 30) .and. x( 30)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         tc( 38)=1
      endif
      if (x( 56)>5)then
         z( 14)=1
         eqtyp( 38)=0
      elseif (x( 56)<0.) then
         z( 14)=-1
         eqtyp( 38)=0
      else
         z( 14)=0
         if (1>= 0.005)then
            eqtyp( 38)= 56
         else
            eqtyp( 38)=0
         endif
      endif

!& algeq
      eqtyp( 39)=0

!& algeq
      eqtyp( 40)=0

!& algeq
      eqtyp( 41)=0

!& swsign
      eqtyp( 42)=0
      if(x( 60)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& algeq
      eqtyp( 43)=0

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 53)=-huge(0.d0)
         prm( 51)= huge(0.d0)
         prm( 52)=-huge(0.d0)
         prm( 61)= huge(0.d0)
      endif
      if(1*x( 80)-x( 57)>prm( 61)*prm( 56))then
         z( 16)=1
      elseif(1*x( 80)-x( 57)<prm( 52)*prm( 56))then
         z( 16)=-1
      else
         z( 16)=0
      endif
      eqtyp( 44)=0
      if(x( 57)>prm( 51))then
         z( 17)=1
         eqtyp( 45)=0
      elseif(x( 57)<prm( 53))then
         z( 17)=-1
         eqtyp( 45)=0
      else
         z( 17)=0
         eqtyp( 45)= 57
      endif
      tc( 45)=prm( 56)

!& algeq 						! reactive current priority flag
      eqtyp( 46)=0

!& swsign
      eqtyp( 47)=0
      if(x( 32)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& algeq                     ! PLL
      eqtyp( 48)=0

!& swsign
      eqtyp( 49)=0
      if(x( 47)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 50)=0
      else
         eqtyp( 50)=  6
         tc( 50)=1.
      endif

!& pictl
      eqtyp( 51)=108
      x(108)=x( 48)
      eqtyp( 52)=0

!& algeq
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& tf1p              ! voltage measurement
      eqtyp( 55)= 34
      tc( 55)=prm(  4)

!& tf1p
      eqtyp( 56)= 35
      tc( 56)=prm(  4)

!& algeq                     ! filter PLL frequency , convert to Hz
      eqtyp( 57)=0

!& algeq
      eqtyp( 58)=0

!& tf1p
      eqtyp( 59)= 38
      tc( 59)=0.1

!& algeq                         ! frequency protection flag FFl, and FFh
      eqtyp( 60)=0

!& swsign
      eqtyp( 61)=0
      if(x( 44)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& algeq
      eqtyp( 62)=0

!& swsign
      eqtyp( 63)=0
      if(x( 45)>=0.)then
         z( 21)=1
      else
         z( 21)=2
      endif

!& hyst
      eqtyp( 64)=0
      if(x( 39)>1.1)then
         z( 22)=1
      elseif(x( 39)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& hyst
      eqtyp( 65)=0
      if(x( 41)>1.1)then
         z( 23)=1
      elseif(x( 41)<0.9)then
         z( 23)=-1
      else
         if(1.>= 0.)then
            z( 23)=1
         else
            z( 23)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection
      eqtyp( 66)=0

!& inlim
      if (1>= 0.005)then
         tc( 67)=1
      endif
      if (x( 62)>5)then
         z( 24)=1
         eqtyp( 67)=0
      elseif (x( 62)<0.) then
         z( 24)=-1
         eqtyp( 67)=0
      else
         z( 24)=0
         if (1>= 0.005)then
            eqtyp( 67)= 62
         else
            eqtyp( 67)=0
         endif
      endif

!& algeq
      eqtyp( 68)=0

!& algeq
      eqtyp( 69)=0

!& swsign
      eqtyp( 70)=0
      if(x( 66)>=0.)then
         z( 25)=1
      else
         z( 25)=2
      endif

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 53)=-huge(0.d0)
         prm( 51)= huge(0.d0)
         prm( 52)=-huge(0.d0)
         prm( 61)= huge(0.d0)
      endif
      if(1*x( 64)-x( 63)>prm( 61)*prm( 56))then
         z( 26)=1
      elseif(1*x( 64)-x( 63)<prm( 52)*prm( 56))then
         z( 26)=-1
      else
         z( 26)=0
      endif
      eqtyp( 71)=0
      if(x( 63)>prm( 51))then
         z( 27)=1
         eqtyp( 72)=0
      elseif(x( 63)<prm( 53))then
         z( 27)=-1
         eqtyp( 72)=0
      else
         z( 27)=0
         eqtyp( 72)= 63
      endif
      tc( 72)=prm( 56)

!& algeq								! High frequency protection and reconnection
      eqtyp( 73)=0

!& inlim
      if (1>= 0.005)then
         tc( 74)=1
      endif
      if (x( 68)>5)then
         z( 28)=1
         eqtyp( 74)=0
      elseif (x( 68)<0.) then
         z( 28)=-1
         eqtyp( 74)=0
      else
         z( 28)=0
         if (1>= 0.005)then
            eqtyp( 74)= 68
         else
            eqtyp( 74)=0
         endif
      endif

!& algeq
      eqtyp( 75)=0

!& algeq
      eqtyp( 76)=0

!& swsign
      eqtyp( 77)=0
      if(x( 72)>=0.)then
         z( 29)=1
      else
         z( 29)=2
      endif

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 53)=-huge(0.d0)
         prm( 51)= huge(0.d0)
         prm( 52)=-huge(0.d0)
         prm( 61)= huge(0.d0)
      endif
      if(1*x( 70)-x( 69)>prm( 61)*prm( 56))then
         z( 30)=1
      elseif(1*x( 70)-x( 69)<prm( 52)*prm( 56))then
         z( 30)=-1
      else
         z( 30)=0
      endif
      eqtyp( 78)=0
      if(x( 69)>prm( 51))then
         z( 31)=1
         eqtyp( 79)=0
      elseif(x( 69)<prm( 53))then
         z( 31)=-1
         eqtyp( 79)=0
      else
         z( 31)=0
         eqtyp( 79)= 69
      endif
      tc( 79)=prm( 56)

!& algeq				! Frequency droop control
      eqtyp( 80)=0

!& db
      eqtyp( 81)=0
      if(x( 73)>prm( 32))then
         z( 32)=1
      elseif(x( 73)<prm( 31))then
         z( 32)=-1
      else
         z( 32)=0
      endif

!& algeq
      eqtyp( 82)=0

!& algeq
      eqtyp( 83)=0

!& lim
      eqtyp( 84)=0
      if(x( 75)>0.00001)then
         z( 33)=1
      elseif(x( 75)<(-99999.))then
         z( 33)=-1
      else
         z( 33)=0
      endif

!& lim
      eqtyp( 85)=0
      if(x( 76)>99999.)then
         z( 34)=1
      elseif(x( 76)<0.0001)then
         z( 34)=-1
      else
         z( 34)=0
      endif

!& algeq
      eqtyp( 86)=0

!& algeq
      eqtyp( 87)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 88)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x(111)=x( 84)
      eqtyp( 89)=111
      tc( 89)=prm( 35)
      eqtyp( 90)=0

!& abs
      eqtyp( 91)=0
      if(x( 85)>0. )then
         z( 35)=1
      else
         z( 35)=-1
      endif

!& algeq               ! rocof protection and timer
      eqtyp( 92)=0

!& swsign
      eqtyp( 93)=0
      if(x( 87)>=0.)then
         z( 36)=1
      else
         z( 36)=2
      endif

!& algeq
      eqtyp( 94)=0

!& inlim
      if (1>= 0.005)then
         tc( 95)=1
      endif
      if (x( 91)>5)then
         z( 37)=1
         eqtyp( 95)=0
      elseif (x( 91)<0) then
         z( 37)=-1
         eqtyp( 95)=0
      else
         z( 37)=0
         if (1>= 0.005)then
            eqtyp( 95)= 91
         else
            eqtyp( 95)=0
         endif
      endif

!& algeq
      eqtyp( 96)=0

!& swsign
      eqtyp( 97)=0
      if(x( 92)>=0.)then
         z( 38)=1
      else
         z( 38)=2
      endif

!& algeq                 ! alignment equations
      eqtyp( 98)=0

!& algeq
      eqtyp( 99)=0

!& algeq
      eqtyp(100)=0

!& algeq
      eqtyp(101)=0

!& algeq
      eqtyp(102)=0

!& algeq
      eqtyp(103)=0

!& int               ! change in battery energy
      if (3600< 0.005)then
         eqtyp(104)=0
      else
         eqtyp(104)= 98
         tc(104)=3600
      endif

!& algeq
      eqtyp(105)=0

!& algeq
      eqtyp(106)=0

!& swsign
      eqtyp(107)=0
      if(x( 93)>=0.)then
         z( 39)=1
      else
         z( 39)=2
      endif

!& algeq
      eqtyp(108)=0

!& swsign
      eqtyp(109)=0
      if(x( 94)>=0.)then
         z( 40)=1
      else
         z( 40)=2
      endif

!& pwlin4            ! limit active power consumption during undervoltage
      eqtyp(110)=0
      if(x(  7)<0)then
         z( 41)=1
      elseif(x(  7)>=1.5)then
         z( 41)=   3
      elseif(0<=x(  7) .and. x(  7)<0.9)then
         z( 41)=  1
      elseif(0.9<=x(  7) .and. x(  7)<0.93)then
         z( 41)=  2
      elseif(0.93<=x(  7) .and. x(  7)<1.5)then
         z( 41)=  3
      endif

!& pwlin4            ! limit active power generation during overvoltage
      eqtyp(111)=0
      if(x(  7)<0)then
         z( 42)=1
      elseif(x(  7)>=1.5)then
         z( 42)=   3
      elseif(0<=x(  7) .and. x(  7)<1.1)then
         z( 42)=  1
      elseif(1.1<=x(  7) .and. x(  7)<1.13)then
         z( 42)=  2
      elseif(1.13<=x(  7) .and. x(  7)<1.5)then
         z( 42)=  3
      endif

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=-x( 83) + x( 51)*x( 57)*x( 63)*x( 69)*x( 89)

!& algeq
      f(  2)=x( 81)-1

!& algeq
      f(  3)=x( 82)

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance
      f(  4)=vx + prm( 18)*x(  1) - prm( 19)*x(  2) - x(  3)

!& algeq
      f(  5)=vy + prm( 18)*x(  2) + prm( 19)*x(  1) - x(  4)

!& algeq             ! voltage magnitude at PV
      f(  6)=x(  5) - dsqrt(x(  3)**2 + x(  4)**2)

!& tf1p              ! measurement delay of voltage magnitude
      f(  7)=(-x(  7)+1.*x(  5))

!& max1v1c
      select case (z(  1))
         case(1)
            f(  8)=0.01-x(  8)
         case(2)
            f(  8)=x(  7)-x(  8)
      end select

!& algeq         ! maximum active current computation
      f(  9)=x( 43)/x(  8) - x( 15)

!& limvb         ! limit current Ipcmd
      select case (z(  2))
         case(0)
            f( 10)=x( 11)-x( 15)
         case(-1)
            f( 10)=x( 11)-x(103)
         case(1)
            f( 10)=x( 11)-x(101)
      end select

!& algeq
      f( 11)=-x( 99) + dsqrt(x(  9)**2+x( 10)**2)

!& algeq         ! output current computation, consider protection status
      f( 12)=x( 27)*x( 83) - x(  9)

!& tf1p2lim
      select case (z(  3))
         case(0)
            f( 13)=x(104)-1*x( 11)+x( 27)
         case(1)
            f( 13)=x(104)-prm( 59)*prm(  3)
         case(-1)
            f( 13)=x(104)-prm( 52)*prm(  3)
      end select
      select case (z(  4))
         case(0)
            f( 14)=x(104)
         case(1)
            f( 14)=x( 27)-prm( 51)
         case(-1)
            f( 14)=x( 27)-prm( 52)
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      f( 15)=x( 13) -x( 33)*dsqrt(max(0.d0,prm( 41)**2 - x( 11)**2)) - (1-x( 33))*(prm( 29)*prm( 41)*0.707 + (1-prm( 29))*prm( 41))

!& algeq
      f( 16)=x( 14) + x( 33)*dsqrt(max(0.d0,prm( 41)**2 - x( 11)**2)) + (1-x( 33))*prm( 41)

!& algeq                 ! reactive current computation limit and update
      f( 17)=-x( 22) + prm( 47) - x( 26)

!& limvb
      select case (z(  5))
         case(0)
            f( 18)=x( 12)-x( 26)
         case(-1)
            f( 18)=x( 12)-x( 14)
         case(1)
            f( 18)=x( 12)-x( 13)
      end select

!& algeq						!
      f( 19)=x( 28)*x( 83) - x( 10)

!& tf1p
      f( 20)=(-x( 28)+1.*x( 12))

!& algeq 				  ! Active - reactive power priority, max active current
      f( 21)=x(101) - (x( 33)*prm( 41) +  (1-x( 33))*min(x(100), dsqrt(max(0.d0,prm( 41)**2 - x( 12)**2)) ))*(1-x( 95))

!& algeq         ! minimum current
      f( 22)=x(103) + (x( 33)*prm( 41) +  (1-x( 33))*min(abs(x(102)), dsqrt(max(0.d0,prm( 41)**2 - x( 12)**2)) ))*(1-x( 96))

!& db 						! Reactive current injection, voltage support
      select case (z(  6))
         case(0)
            f( 23)=x( 22)
         case(-1)
            f( 23)=x( 22)-(-prm( 23)*prm( 41)*(prm( 20) + prm( 29)))-(prm( 21)*prm( 41)*(prm( 20) + prm( 29) ))*(x(  7)-prm( 25))
         case(1)
            f( 23)=x( 22)-prm( 24)*prm( 41)-prm( 22)*prm( 41)*prm( 27)*(x(  7)-prm( 26))
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag
      f( 24)=x(  7) + x( 29)

!& timer5
      select case (z(  7))
         case (-1)
            f( 25)=x( 31)
            f( 26)=x(105)
         case (0)
            f( 25)=x( 31)
            f( 26)= 1.
         case (1)
            f( 25)=x( 31)-1.
            f( 26)= 0.
      end select

!& algeq 		
      f( 27)=x( 24) -1 + x( 31)

!& hyst
      if(z(  8) == 1)then
         f( 28)=x( 23)-1.-(1.-1.)*(x( 24)-1.1)/(1.1-0.9)
      else
         f( 28)=x( 23)-0.-(0.-0.)*(x( 24)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 29)=x( 49) - 1 + x( 23)

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               f( 30)=x( 49)
            case(1)
               f( 30)=x( 50)-5
            case(-1)
               f( 30)=x( 50)-0.
         end select
      else
         select case (z(  9))
            case(0)
               f( 30)=x( 49)-x( 50)
            case(1)
               f( 30)=x( 50)-5
            case(-1)
               f( 30)=x( 50)-0.
         end select
      endif

!& algeq
      f( 31)=x( 53) - 1 + x( 49)

!& algeq
      f( 32)=x( 54) + prm( 16) - x( 50)

!& swsign
      select case (z( 10))
         case(1)
            f( 33)=x( 52)-x( 81)
         case(2)
            f( 33)=x( 52)-x( 53)
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            f( 34)=x(106)-1*x( 52)+x( 51)
         case(1)
            f( 34)=x(106)-prm( 60)*prm( 56)
         case(-1)
            f( 34)=x(106)-prm( 52)*prm( 56)
      end select
      select case (z( 12))
         case(0)
            f( 35)=x(106)
         case(1)
            f( 35)=x( 51)-prm( 51)
         case(-1)
            f( 35)=x( 51)-prm( 53)
      end select

!& algeq								! High voltage ride-through and HV protection flag
      f( 36)=x( 30) - x(  7) + prm(  8)

!& pwlin4
      select case (z( 13))
         case (  1)
            f( 37)=0.+ ( (0.-0.)*(x( 30)-(-999))/(0.-(-999)) ) -x( 25)
         case (  2)
            f( 37)=0.+ ( (1.-0.)*(x( 30)-0.)/(0.-0.) ) -x( 25)
         case (  3)
            f( 37)=1.+ ( (1.-1.)*(x( 30)-0.)/(999-0.) ) -x( 25)
      end select

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               f( 38)=x( 25)
            case(1)
               f( 38)=x( 56)-5
            case(-1)
               f( 38)=x( 56)-0.
         end select
      else
         select case (z( 14))
            case(0)
               f( 38)=x( 25)-x( 56)
            case(1)
               f( 38)=x( 56)-5
            case(-1)
               f( 38)=x( 56)-0.
         end select
      endif

!& algeq
      f( 39)=x( 55) - 1 + x( 25)

!& algeq
      f( 40)=x( 59) - 1 + x( 25)

!& algeq
      f( 41)=x( 60) + prm( 16) - x( 56)

!& swsign
      select case (z( 15))
         case(1)
            f( 42)=x( 58)-x( 81)
         case(2)
            f( 42)=x( 58)-x( 59)
      end select

!& algeq
      f( 43)=x( 80) - x( 58)*x( 55)

!& tf1p2lim
      select case (z( 16))
         case(0)
            f( 44)=x(107)-1*x( 80)+x( 57)
         case(1)
            f( 44)=x(107)-prm( 61)*prm( 56)
         case(-1)
            f( 44)=x(107)-prm( 52)*prm( 56)
      end select
      select case (z( 17))
         case(0)
            f( 45)=x(107)
         case(1)
            f( 45)=x( 57)-prm( 51)
         case(-1)
            f( 45)=x( 57)-prm( 53)
      end select

!& algeq 						! reactive current priority flag
      f( 46)=x( 32) - x(  7) + prm( 25)

!& swsign
      select case (z( 18))
         case(1)
            f( 47)=x( 33)-x( 81)
         case(2)
            f( 47)=x( 33)-x( 82)
      end select

!& algeq                     ! PLL
      f( 48)=x( 47) - x(  7) + prm( 10)

!& swsign
      select case (z( 19))
         case(1)
            f( 49)=x( 46)-x( 81)
         case(2)
            f( 49)=x( 46)-x( 82)
      end select

!& int
      if (1.< 0.005)then
         f( 50)=x( 17)-x(  6)
      else
         f( 50)=x( 17)
      endif

!& pictl
      f( 51)=0.1/(prm(  9)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 18)
      f( 52)=0.5/(prm(  9)*0.001)                                                                                                                                                                                                                                                                                        *x( 18)+x(108)-x( 48)

!& algeq
      f( 53)=x( 16) - x( 48) + omega*2*pi*50

!& algeq
      f( 54)=x( 17) - x( 16)*x( 46)

!& tf1p              ! voltage measurement
      f( 55)=(-x( 34)+1.*x(  3))

!& tf1p
      f( 56)=(-x( 35)+1.*x(  4))

!& algeq                     ! filter PLL frequency , convert to Hz
      f( 57)=x( 36) - x( 48)/(2*pi*50)

!& algeq
      f( 58)=x( 37) - 50*x( 36)

!& tf1p
      f( 59)=(-x( 38)+1*x( 37))

!& algeq                         ! frequency protection flag FFl, and FFh
      f( 60)=x( 44) - x( 38) + prm( 14)

!& swsign
      select case (z( 20))
         case(1)
            f( 61)=x( 39)-x( 81)
         case(2)
            f( 61)=x( 39)-x( 82)
      end select

!& algeq
      f( 62)=x( 45) - prm( 15) + x( 38)

!& swsign
      select case (z( 21))
         case(1)
            f( 63)=x( 41)-x( 81)
         case(2)
            f( 63)=x( 41)-x( 82)
      end select

!& hyst
      if(z( 22) == 1)then
         f( 64)=x( 40)-1.-(1.-1.)*(x( 39)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 40)-0.-(0.-0.)*(x( 39)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 23) == 1)then
         f( 65)=x( 42)-1.-(1.-1.)*(x( 41)-1.1)/(1.1-0.9)
      else
         f( 65)=x( 42)-0.-(0.-0.)*(x( 41)-0.9)/(1.1-0.9)
      endif

!& algeq						       ! Low frequency protection and reconnection
      f( 66)=x( 61) - 1 + x( 40)

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               f( 67)=x( 61)
            case(1)
               f( 67)=x( 62)-5
            case(-1)
               f( 67)=x( 62)-0.
         end select
      else
         select case (z( 24))
            case(0)
               f( 67)=x( 61)-x( 62)
            case(1)
               f( 67)=x( 62)-5
            case(-1)
               f( 67)=x( 62)-0.
         end select
      endif

!& algeq
      f( 68)=x( 65) - 1 + x( 61)

!& algeq
      f( 69)=x( 66) + prm( 17) - x( 62)

!& swsign
      select case (z( 25))
         case(1)
            f( 70)=x( 64)-x( 81)
         case(2)
            f( 70)=x( 64)-x( 65)
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            f( 71)=x(109)-1*x( 64)+x( 63)
         case(1)
            f( 71)=x(109)-prm( 61)*prm( 56)
         case(-1)
            f( 71)=x(109)-prm( 52)*prm( 56)
      end select
      select case (z( 27))
         case(0)
            f( 72)=x(109)
         case(1)
            f( 72)=x( 63)-prm( 51)
         case(-1)
            f( 72)=x( 63)-prm( 53)
      end select

!& algeq								! High frequency protection and reconnection
      f( 73)=x( 67) - 1 + x( 42)

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               f( 74)=x( 67)
            case(1)
               f( 74)=x( 68)-5
            case(-1)
               f( 74)=x( 68)-0.
         end select
      else
         select case (z( 28))
            case(0)
               f( 74)=x( 67)-x( 68)
            case(1)
               f( 74)=x( 68)-5
            case(-1)
               f( 74)=x( 68)-0.
         end select
      endif

!& algeq
      f( 75)=x( 71) - 1 + x( 67)

!& algeq
      f( 76)=x( 72) + prm( 17) - x( 68)

!& swsign
      select case (z( 29))
         case(1)
            f( 77)=x( 70)-x( 81)
         case(2)
            f( 77)=x( 70)-x( 71)
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            f( 78)=x(110)-1*x( 70)+x( 69)
         case(1)
            f( 78)=x(110)-prm( 61)*prm( 56)
         case(-1)
            f( 78)=x(110)-prm( 52)*prm( 56)
      end select
      select case (z( 31))
         case(0)
            f( 79)=x(110)
         case(1)
            f( 79)=x( 69)-prm( 51)
         case(-1)
            f( 79)=x( 69)-prm( 53)
      end select

!& algeq				! Frequency droop control
      f( 80)=x( 73) + (x( 38)/50) - prm( 62)

!& db
      select case (z( 32))
         case(0)
            f( 81)=x( 74)
         case(-1)
            f( 81)=x( 74)-0.-1.*(x( 73)-prm( 31))
         case(1)
            f( 81)=x( 74)-0.-1.*(x( 73)-prm( 32))
      end select

!& algeq
      f( 82)=x( 75) - x( 74)*prm( 64)

!& algeq
      f( 83)=x( 76) - x( 74)*prm( 63)

!& lim
      select case (z( 33))
         case(0)
            f( 84)=x( 77)-x( 75)
         case(-1)
            f( 84)=x( 77)-(-99999.)
         case(1)
            f( 84)=x( 77)-0.00001
      end select

!& lim
      select case (z( 34))
         case(0)
            f( 85)=x( 78)-x( 76)
         case(-1)
            f( 85)=x( 78)-0.0001
         case(1)
            f( 85)=x( 78)-99999.
      end select

!& algeq
      f( 86)=x( 79)-x( 78)-x( 77)

!& algeq
      f( 87)=x( 43)+prm( 45)-x( 79)

!& algeq                ! frequency deviation in Hz
      f( 88)=-x( 84) + x( 38)-prm( 62)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 89)=-x(111)+x( 84)
      if (prm( 35)< 0.005)then
         f( 90)=1/prm( 35)*x( 84)-x( 85)
      else
         f( 90)=1/prm( 35)*(x( 84)-x(111))-x( 85)
      endif

!& abs
      if(z( 35) == 1 )then
         f( 91)=x( 86)-x( 85)
      else
         f( 91)=x( 86)+x( 85)
      endif

!& algeq               ! rocof protection and timer
      f( 92)=-x( 87) +prm( 36) -x( 86)

!& swsign
      select case (z( 36))
         case(1)
            f( 93)=x( 88)-x( 81)
         case(2)
            f( 93)=x( 88)-x( 82)
      end select

!& algeq
      f( 94)=x( 90) - 1 + x( 88)

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               f( 95)=x( 90)
            case(1)
               f( 95)=x( 91)-5
            case(-1)
               f( 95)=x( 91)-0
         end select
      else
         select case (z( 37))
            case(0)
               f( 95)=x( 90)-x( 91)
            case(1)
               f( 95)=x( 91)-5
            case(-1)
               f( 95)=x( 91)-0
         end select
      endif

!& algeq
      f( 96)=-x( 92) + 0.25 - x( 91)

!& swsign
      select case (z( 38))
         case(1)
            f( 97)=x( 89)-x( 81)
         case(2)
            f( 97)=x( 89)-x( 82)
      end select

!& algeq                 ! alignment equations
      f( 98)=x( 19) - x( 34)*cos(x(  6)) - x( 35)*sin(x(  6))

!& algeq
      f( 99)=x( 18) + x( 34)*sin(x(  6)) - x( 35)*cos(x(  6))

!& algeq
      f(100)=x( 20) - x( 19)*x(  9)

!& algeq
      f(101)=x( 21) - x( 19)*x( 10)

!& algeq
      f(102)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f(103)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!& int               ! change in battery energy
      if (3600< 0.005)then
         f(104)=x( 20)-x( 98)
      else
         f(104)=x( 20)
      endif

!& algeq
      f(105)=-x( 97) + prm( 37) - x( 98)/prm( 40)

!& algeq
      f(106)=x( 93) + x( 97) - prm( 38)

!& swsign
      select case (z( 39))
         case(1)
            f(107)=x( 95)-x( 81)
         case(2)
            f(107)=x( 95)-x( 82)
      end select

!& algeq
      f(108)=x( 94) + prm( 39) - x( 97)

!& swsign
      select case (z( 40))
         case(1)
            f(109)=x( 96)-x( 81)
         case(2)
            f(109)=x( 96)-x( 82)
      end select

!& pwlin4            ! limit active power consumption during undervoltage
      select case (z( 41))
         case (  1)
            f(110)=(-0.2*prm( 41))+ ( ((-0.2*prm( 41))-(-0.2*prm( 41)))*(x(  7)-0)/(0.9-0) ) -x(102)
         case (  2)
            f(110)=(-0.2*prm( 41))+ ( ((-prm( 41))-(-0.2*prm( 41)))*(x(  7)-0.9)/(0.93-0.9) ) -x(102)
         case (  3)
            f(110)=(-prm( 41))+ ( ((-prm( 41))-(-prm( 41)))*(x(  7)-0.93)/(1.5-0.93) ) -x(102)
      end select

!& pwlin4            ! limit active power generation during overvoltage
      select case (z( 42))
         case (  1)
            f(111)=prm( 41)+ ( (prm( 41)-prm( 41))*(x(  7)-0)/(1.1-0) ) -x(100)
         case (  2)
            f(111)=prm( 41)+ ( (0.2*prm( 41)-prm( 41))*(x(  7)-1.1)/(1.13-1.1) ) -x(100)
         case (  3)
            f(111)=0.2*prm( 41)+ ( (0.2*prm( 41)-0.2*prm( 41))*(x(  7)-1.13)/(1.5-1.13) ) -x(100)
      end select

!........................................................................................
   case (update_disc)

!& algeq

!& algeq

!& algeq

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance

!& algeq

!& algeq             ! voltage magnitude at PV

!& tf1p              ! measurement delay of voltage magnitude

!& max1v1c
      select case (z(  1))
         case(1)
            if(x(  7)>0.01)then
               z(  1)=2
            endif
         case(2)
            if(0.01>x(  7))then
               z(  1)=1
            endif
      end select

!& algeq         ! maximum active current computation

!& limvb         ! limit current Ipcmd
      select case (z(  2))
         case(0)
            if(x( 15)>x(101))then
               z(  2)=1
            elseif(x( 15)<x(103))then
               z(  2)=-1
            endif
         case(-1)
            if(x( 15)>x(103))then
               z(  2)=0
            endif
         case(1)
            if(x( 15)<x(101))then
               z(  2)=0
            endif
      end select

!& algeq

!& algeq         ! output current computation, consider protection status

!& tf1p2lim
      select case (z(  3))
         case(0)
            if(x(104)>prm( 59)*prm(  3))then
               z(  3)=1
            elseif(x(104)<prm( 52)*prm(  3))then
               z(  3)=-1
            endif
         case(1)
            if(1*x( 11)-x( 27)<prm( 59)*prm(  3))then
               z(  3)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 27)>prm( 52)*prm(  3))then
               z(  3)= 0
            endif
      end select
      select case (z(  4))
         case(0)
            if(x( 27)>prm( 51))then
               z(  4)=1
               eqtyp( 14)=0
            elseif(x( 27)<prm( 52))then
               z(  4)=-1
               eqtyp( 14)=0
            endif
         case(1)
            if (x(104)<0.)then
               z(  4)= 0
               eqtyp( 14)= 27
            endif
         case(-1)
            if(x(104)>0.)then
               z(  4)= 0
               eqtyp( 14)= 27
            endif
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current

!& algeq

!& algeq                 ! reactive current computation limit and update

!& limvb
      select case (z(  5))
         case(0)
            if(x( 26)>x( 13))then
               z(  5)=1
            elseif(x( 26)<x( 14))then
               z(  5)=-1
            endif
         case(-1)
            if(x( 26)>x( 14))then
               z(  5)=0
            endif
         case(1)
            if(x( 26)<x( 13))then
               z(  5)=0
            endif
      end select

!& algeq						!

!& tf1p

!& algeq 				  ! Active - reactive power priority, max active current

!& algeq         ! minimum current

!& db 						! Reactive current injection, voltage support
      select case (z(  6))
         case(0)
            if(x(  7)>prm( 26))then
               z(  6)=1
            elseif(x(  7)<prm( 25))then
               z(  6)=-1
            endif
         case(-1)
            if(x(  7)>prm( 25))then
               z(  6)=0
            endif
         case(1)
            if(x(  7)<prm( 26))then
               z(  6)=0
            endif
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag

!& timer5
      if(z(  7) == -1)then
         if(x( 29) >= (-prm( 11)))then
            z(  7)=0
            eqtyp( 26)=105
         endif
      else
         if(x( 29) < (-prm( 11)))then
            z(  7)=-1
            eqtyp( 26)=0
         endif
      endif
      if(z(  7) == 0)then
         if(x( 29) > (-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30))))then
            if(x(105) > 0.)then
               z(  7)=1
            endif
         elseif(x( 29) > (-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30))))then
            if(x(105) > prm(  5)+(0.-prm(  5))*(x( 29)-(-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 29) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x(105) > prm(  5)+(prm(  5)-prm(  5))*(x( 29)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 12) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 29) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x(105) > prm(  7)+(prm(  5)-prm(  7))*(x( 29)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 29) > (-prm( 11)))then
            if(x(105) > prm(  6)+(prm(  7)-prm(  6))*(x( 29)-(-prm( 11)))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-prm( 11))))then
               z(  7)=1
            endif
         endif
      endif

!& algeq 		

!& hyst
      if (z(  8) == -1)then
         if(x( 24)>1.1)then
            z(  8)=1
         endif
      else
         if(x( 24)<0.9)then
            z(  8)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               if(x( 50)<0.)then
                  z(  9)=-1
                  eqtyp( 30)=0
               elseif(x( 50)>5)then
                  z(  9)= 1
                  eqtyp( 30)=0
               endif
            case(1)
               if(x( 49)<0.)then
                  z(  9)=0
                  eqtyp( 30)= 50
               endif
            case(-1)
               if(x( 49)>0.)then
                  z(  9)=0
                  eqtyp( 30)= 50
               endif
         end select
      else
         select case (z(  9))
            case(0)
               if(x( 50)<0.)then
                  z(  9)=-1
               elseif(x( 50)>5)then
                  z(  9)= 1
               endif
            case(1)
               if(x( 49)<5)then
                  z(  9)=0
               endif
            case(-1)
               if(x( 49)>0.)then
                  z(  9)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 10))
         case(1)
            if(x( 54)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 54)>=0.)then
               z( 10)=1
            endif
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            if(x(106)>prm( 60)*prm( 56))then
               z( 11)=1
            elseif(x(106)<prm( 52)*prm( 56))then
               z( 11)=-1
            endif
         case(1)
            if(1*x( 52)-x( 51)<prm( 60)*prm( 56))then
               z( 11)= 0
            endif
         case(-1)
            if(1*x( 52)-x( 51)>prm( 52)*prm( 56))then
               z( 11)= 0
            endif
      end select
      select case (z( 12))
         case(0)
            if(x( 51)>prm( 51))then
               z( 12)=1
               eqtyp( 35)=0
            elseif(x( 51)<prm( 53))then
               z( 12)=-1
               eqtyp( 35)=0
            endif
         case(1)
            if (x(106)<0.)then
               z( 12)= 0
               eqtyp( 35)= 51
            endif
         case(-1)
            if(x(106)>0.)then
               z( 12)= 0
               eqtyp( 35)= 51
            endif
      end select

!& algeq								! High voltage ride-through and HV protection flag

!& pwlin4
      if(x( 30)<(-999))then
         z( 13)=1
      elseif(x( 30)>=999)then
         z( 13)=  3
      elseif((-999)<=x( 30) .and. x( 30)<0.)then
         z( 13)=  1
      elseif(0.<=x( 30) .and. x( 30)<0.)then
         z( 13)=  2
      elseif(0.<=x( 30) .and. x( 30)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               if(x( 56)<0.)then
                  z( 14)=-1
                  eqtyp( 38)=0
               elseif(x( 56)>5)then
                  z( 14)= 1
                  eqtyp( 38)=0
               endif
            case(1)
               if(x( 25)<0.)then
                  z( 14)=0
                  eqtyp( 38)= 56
               endif
            case(-1)
               if(x( 25)>0.)then
                  z( 14)=0
                  eqtyp( 38)= 56
               endif
         end select
      else
         select case (z( 14))
            case(0)
               if(x( 56)<0.)then
                  z( 14)=-1
               elseif(x( 56)>5)then
                  z( 14)= 1
               endif
            case(1)
               if(x( 25)<5)then
                  z( 14)=0
               endif
            case(-1)
               if(x( 25)>0.)then
                  z( 14)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 15))
         case(1)
            if(x( 60)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 60)>=0.)then
               z( 15)=1
            endif
      end select

!& algeq

!& tf1p2lim
      select case (z( 16))
         case(0)
            if(x(107)>prm( 61)*prm( 56))then
               z( 16)=1
            elseif(x(107)<prm( 52)*prm( 56))then
               z( 16)=-1
            endif
         case(1)
            if(1*x( 80)-x( 57)<prm( 61)*prm( 56))then
               z( 16)= 0
            endif
         case(-1)
            if(1*x( 80)-x( 57)>prm( 52)*prm( 56))then
               z( 16)= 0
            endif
      end select
      select case (z( 17))
         case(0)
            if(x( 57)>prm( 51))then
               z( 17)=1
               eqtyp( 45)=0
            elseif(x( 57)<prm( 53))then
               z( 17)=-1
               eqtyp( 45)=0
            endif
         case(1)
            if (x(107)<0.)then
               z( 17)= 0
               eqtyp( 45)= 57
            endif
         case(-1)
            if(x(107)>0.)then
               z( 17)= 0
               eqtyp( 45)= 57
            endif
      end select

!& algeq 						! reactive current priority flag

!& swsign
      select case (z( 18))
         case(1)
            if(x( 32)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 32)>=0.)then
               z( 18)=1
            endif
      end select

!& algeq                     ! PLL

!& swsign
      select case (z( 19))
         case(1)
            if(x( 47)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 47)>=0.)then
               z( 19)=1
            endif
      end select

!& int

!& pictl

!& algeq

!& algeq

!& tf1p              ! voltage measurement

!& tf1p

!& algeq                     ! filter PLL frequency , convert to Hz

!& algeq

!& tf1p

!& algeq                         ! frequency protection flag FFl, and FFh

!& swsign
      select case (z( 20))
         case(1)
            if(x( 44)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 44)>=0.)then
               z( 20)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 21))
         case(1)
            if(x( 45)<0.)then
               z( 21)=2
            endif
         case(2)
            if(x( 45)>=0.)then
               z( 21)=1
            endif
      end select

!& hyst
      if (z( 22) == -1)then
         if(x( 39)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 39)<0.9)then
            z( 22)=-1
         endif
      endif

!& hyst
      if (z( 23) == -1)then
         if(x( 41)>1.1)then
            z( 23)=1
         endif
      else
         if(x( 41)<0.9)then
            z( 23)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               if(x( 62)<0.)then
                  z( 24)=-1
                  eqtyp( 67)=0
               elseif(x( 62)>5)then
                  z( 24)= 1
                  eqtyp( 67)=0
               endif
            case(1)
               if(x( 61)<0.)then
                  z( 24)=0
                  eqtyp( 67)= 62
               endif
            case(-1)
               if(x( 61)>0.)then
                  z( 24)=0
                  eqtyp( 67)= 62
               endif
         end select
      else
         select case (z( 24))
            case(0)
               if(x( 62)<0.)then
                  z( 24)=-1
               elseif(x( 62)>5)then
                  z( 24)= 1
               endif
            case(1)
               if(x( 61)<5)then
                  z( 24)=0
               endif
            case(-1)
               if(x( 61)>0.)then
                  z( 24)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 25))
         case(1)
            if(x( 66)<0.)then
               z( 25)=2
            endif
         case(2)
            if(x( 66)>=0.)then
               z( 25)=1
            endif
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            if(x(109)>prm( 61)*prm( 56))then
               z( 26)=1
            elseif(x(109)<prm( 52)*prm( 56))then
               z( 26)=-1
            endif
         case(1)
            if(1*x( 64)-x( 63)<prm( 61)*prm( 56))then
               z( 26)= 0
            endif
         case(-1)
            if(1*x( 64)-x( 63)>prm( 52)*prm( 56))then
               z( 26)= 0
            endif
      end select
      select case (z( 27))
         case(0)
            if(x( 63)>prm( 51))then
               z( 27)=1
               eqtyp( 72)=0
            elseif(x( 63)<prm( 53))then
               z( 27)=-1
               eqtyp( 72)=0
            endif
         case(1)
            if (x(109)<0.)then
               z( 27)= 0
               eqtyp( 72)= 63
            endif
         case(-1)
            if(x(109)>0.)then
               z( 27)= 0
               eqtyp( 72)= 63
            endif
      end select

!& algeq								! High frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               if(x( 68)<0.)then
                  z( 28)=-1
                  eqtyp( 74)=0
               elseif(x( 68)>5)then
                  z( 28)= 1
                  eqtyp( 74)=0
               endif
            case(1)
               if(x( 67)<0.)then
                  z( 28)=0
                  eqtyp( 74)= 68
               endif
            case(-1)
               if(x( 67)>0.)then
                  z( 28)=0
                  eqtyp( 74)= 68
               endif
         end select
      else
         select case (z( 28))
            case(0)
               if(x( 68)<0.)then
                  z( 28)=-1
               elseif(x( 68)>5)then
                  z( 28)= 1
               endif
            case(1)
               if(x( 67)<5)then
                  z( 28)=0
               endif
            case(-1)
               if(x( 67)>0.)then
                  z( 28)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 29))
         case(1)
            if(x( 72)<0.)then
               z( 29)=2
            endif
         case(2)
            if(x( 72)>=0.)then
               z( 29)=1
            endif
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            if(x(110)>prm( 61)*prm( 56))then
               z( 30)=1
            elseif(x(110)<prm( 52)*prm( 56))then
               z( 30)=-1
            endif
         case(1)
            if(1*x( 70)-x( 69)<prm( 61)*prm( 56))then
               z( 30)= 0
            endif
         case(-1)
            if(1*x( 70)-x( 69)>prm( 52)*prm( 56))then
               z( 30)= 0
            endif
      end select
      select case (z( 31))
         case(0)
            if(x( 69)>prm( 51))then
               z( 31)=1
               eqtyp( 79)=0
            elseif(x( 69)<prm( 53))then
               z( 31)=-1
               eqtyp( 79)=0
            endif
         case(1)
            if (x(110)<0.)then
               z( 31)= 0
               eqtyp( 79)= 69
            endif
         case(-1)
            if(x(110)>0.)then
               z( 31)= 0
               eqtyp( 79)= 69
            endif
      end select

!& algeq				! Frequency droop control

!& db
      select case (z( 32))
         case(0)
            if(x( 73)>prm( 32))then
               z( 32)=1
            elseif(x( 73)<prm( 31))then
               z( 32)=-1
            endif
         case(-1)
            if(x( 73)>prm( 31))then
               z( 32)=0
            endif
         case(1)
            if(x( 73)<prm( 32))then
               z( 32)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 33))
         case(0)
            if(x( 75)>0.00001)then
               z( 33)=1
            elseif(x( 75)<(-99999.))then
               z( 33)=-1
            endif
         case(-1)
            if(x( 75)>(-99999.))then
               z( 33)=0
            endif
         case(1)
            if(x( 75)<0.00001)then
               z( 33)=0
            endif
      end select

!& lim
      select case (z( 34))
         case(0)
            if(x( 76)>99999.)then
               z( 34)=1
            elseif(x( 76)<0.0001)then
               z( 34)=-1
            endif
         case(-1)
            if(x( 76)>0.0001)then
               z( 34)=0
            endif
         case(1)
            if(x( 76)<99999.)then
               z( 34)=0
            endif
      end select

!& algeq

!& algeq

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 35) == -1 )then
         if(x( 85)> blocktol1 )then
            z( 35)=1
         endif
      else
         if(x( 85)< - blocktol1 )then
            z( 35)=-1
         endif
      endif

!& algeq               ! rocof protection and timer

!& swsign
      select case (z( 36))
         case(1)
            if(x( 87)<0.)then
               z( 36)=2
            endif
         case(2)
            if(x( 87)>=0.)then
               z( 36)=1
            endif
      end select

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               if(x( 91)<0)then
                  z( 37)=-1
                  eqtyp( 95)=0
               elseif(x( 91)>5)then
                  z( 37)= 1
                  eqtyp( 95)=0
               endif
            case(1)
               if(x( 90)<0.)then
                  z( 37)=0
                  eqtyp( 95)= 91
               endif
            case(-1)
               if(x( 90)>0.)then
                  z( 37)=0
                  eqtyp( 95)= 91
               endif
         end select
      else
         select case (z( 37))
            case(0)
               if(x( 91)<0)then
                  z( 37)=-1
               elseif(x( 91)>5)then
                  z( 37)= 1
               endif
            case(1)
               if(x( 90)<5)then
                  z( 37)=0
               endif
            case(-1)
               if(x( 90)>0)then
                  z( 37)=0
               endif
         end select
      endif

!& algeq

!& swsign
      select case (z( 38))
         case(1)
            if(x( 92)<0.)then
               z( 38)=2
            endif
         case(2)
            if(x( 92)>=0.)then
               z( 38)=1
            endif
      end select

!& algeq                 ! alignment equations

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq

!& int               ! change in battery energy

!& algeq

!& algeq

!& swsign
      select case (z( 39))
         case(1)
            if(x( 93)<0.)then
               z( 39)=2
            endif
         case(2)
            if(x( 93)>=0.)then
               z( 39)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 40))
         case(1)
            if(x( 94)<0.)then
               z( 40)=2
            endif
         case(2)
            if(x( 94)>=0.)then
               z( 40)=1
            endif
      end select

!& pwlin4            ! limit active power consumption during undervoltage
      if(x(  7)<0)then
         z( 41)=1
      elseif(x(  7)>=1.5)then
         z( 41)=  3
      elseif(0<=x(  7) .and. x(  7)<0.9)then
         z( 41)=  1
      elseif(0.9<=x(  7) .and. x(  7)<0.93)then
         z( 41)=  2
      elseif(0.93<=x(  7) .and. x(  7)<1.5)then
         z( 41)=  3
      endif

!& pwlin4            ! limit active power generation during overvoltage
      if(x(  7)<0)then
         z( 42)=1
      elseif(x(  7)>=1.5)then
         z( 42)=  3
      elseif(0<=x(  7) .and. x(  7)<1.1)then
         z( 42)=  1
      elseif(1.1<=x(  7) .and. x(  7)<1.13)then
         z( 42)=  2
      elseif(1.13<=x(  7) .and. x(  7)<1.5)then
         z( 42)=  3
      endif
   end select

end subroutine inj_BESS3
