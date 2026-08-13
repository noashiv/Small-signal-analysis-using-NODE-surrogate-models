!  MODEL NAME : inj_IBG3s               
!  MODEL DESCRIPTION FILE : IBG3_status.txt
!  Data :
!       prm(  1)=  PMPP            ! maximum power tracking point
!       prm(  2)=  PN              ! rated power in system base
!       prm(  3)=  Iprate          ! current rate limit
!       prm(  4)=  Tg
!       prm(  5)=  Tm
!       prm(  6)=  tLVRT1
!       prm(  7)=  tLVRT2
!       prm(  8)=  tLVRTint
!       prm(  9)=  Vmax
!       prm( 10)=  tau              ! response time of the PLL in milliseconds
!       prm( 11)=  Vminpll          ! Voltage magnitude under which the PLL is blocked
!       prm( 12)=  a 		 ! Vr		
!       prm( 13)=  Vmin
!       prm( 14)=  Vint
!       prm( 15)=  fmin
!       prm( 16)=  fmax
!       prm( 17)=  Trv                  ! Time after which units are allowed to reconnect to the network
!       prm( 18)=  Trf                  ! Time after which units reconnect after frequency protection was triggered
!       prm( 19)=  Re
!       prm( 20)=  Xe
!       prm( 21)=  CM1
!       prm( 22)=  kRCI
!       prm( 23)=  kRCA
!       prm( 24)=  m
!       prm( 25)=  n
!       prm( 26)=  dbmin
!       prm( 27)=  dbmax
!       prm( 28)=  HVRT
!       prm( 29)=  LVRT
!       prm( 30)=  CM2
!       prm( 31)=  Vtrip
!       prm( 32)=  fdbup
!       prm( 33)=  fdbdn
!       prm( 34)=  Rup
!       prm( 35)=  Rdn
!       prm( 36)=  Trocof
!       prm( 37)=  dfmax
!       prm( 38)=  protection
!       prm( 39)=  support
!  Parameters :
!       prm( 40)=  IN  
!       prm( 41)=  vxlv  
!       prm( 42)=  vylv  
!       prm( 43)=  Vref  
!       prm( 44)=  Pext  
!       prm( 45)=  Qext  
!       prm( 46)=  Iqref  
!       prm( 47)=  Ipref  
!       prm( 48)=  kpll  
!       prm( 49)=  theta_PLL  
!       prm( 50)=  Uplim  
!       prm( 51)=  Downlim  
!       prm( 52)=  Downlimdisc  
!       prm( 53)=  UplimdeltaP  
!       prm( 54)=  DownlimdeltaP  
!       prm( 55)=  Tlim  
!       prm( 56)=  Uplimdis  
!       prm( 57)=  downlimdis  
!       prm( 58)=  ratemax  
!       prm( 59)=  dfup  
!       prm( 60)=  dfdn  
!       prm( 61)=  rate  
!       prm( 62)=  rateh  
!       prm( 63)=  fref  
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
!       x( 15)=  Ipmaxi                
!       x( 16)=  Ipmax                 
!       x( 17)=  Ipmin                 
!       x( 18)=  x4                    
!       x( 19)=  DeltaW                
!       x( 20)=  DeltaWf               
!       x( 21)=  vq                    
!       x( 22)=  vd                    
!       x( 23)=  Pgen                  
!       x( 24)=  Qgen                  
!       x( 25)=  Iqext                 
!       x( 26)=  Fvl                   
!       x( 27)=  Fvli                  
!       x( 28)=  z1                    
!       x( 29)=  x5                    
!       x( 30)=  Iptemp                
!       x( 31)=  Iqtemp                
!       x( 32)=  x10                   
!       x( 33)=  x11                   
!       x( 34)=  z                     
!       x( 35)=  deltaV                
!       x( 36)=  Pflag                 
!       x( 37)=  Pflagi                
!       x( 38)=  vxlm                  
!       x( 39)=  vylm                  
!       x( 40)=  omegam                
!       x( 41)=  fm                    
!       x( 42)=  fmfilt                
!       x( 43)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 44)=  Ffl                   
!       x( 45)=  Ffhi                  
!       x( 46)=  Ffh                   
!       x( 47)=  Ptot                  
!       x( 48)=  deltafl               
!       x( 49)=  deltafh               
!       x( 50)=  mult                  
!       x( 51)=  deltaVPLL             
!       x( 52)=  wpll                  
!       x( 53)=  g                     
!       x( 54)=  tr                    
!       x( 55)=  Fr                    
!       x( 56)=  Frtemp                
!       x( 57)=  fvlb                  
!       x( 58)=  deltafvl              
!       x( 59)=  g1                    
!       x( 60)=  tr1                   
!       x( 61)=  Frvh                  
!       x( 62)=  Frvhtemp              
!       x( 63)=  fvhb                  
!       x( 64)=  deltafvh              
!       x( 65)=  g2                    
!       x( 66)=  tr2                   
!       x( 67)=  Frfl                  
!       x( 68)=  Frfltemp              
!       x( 69)=  fflb                  
!       x( 70)=  deltaffl              
!       x( 71)=  g3                    
!       x( 72)=  tr3                   
!       x( 73)=  Frfh                  
!       x( 74)=  Frfhtemp              
!       x( 75)=  ffhb                  
!       x( 76)=  deltaffh              
!       x( 77)=  w1                    
!       x( 78)=  w2                    
!       x( 79)=  w3                    
!       x( 80)=  w4                    
!       x( 81)=  w5                    
!       x( 82)=  w6                    
!       x( 83)=  w7                    
!       x( 84)=  w8                    
!       x( 85)=  Frvhtemp1             
!       x( 86)=  one                   
!       x( 87)=  zero                  
!       x( 88)=  status                
!       x( 89)=  p1                    
!       x( 90)=  p2                    
!       x( 91)=  p3                    
!       x( 92)=  s1                    
!       x( 93)=  s2                    
!       x( 94)=  s3                    
!       x( 95)=  deltaf                
!       x( 96)=  rocof                 
!       x( 97)=  abrocof               
!       x( 98)=  deltarocof            
!       x( 99)=  Ffri                  
!       x(100)=  Ffr                   
!       x(101)=  g4                    
!       x(102)=  tr4                   
!       x(103)=  deltaffr              

!.........................................................................................................

subroutine inj_IBG3s(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 39
      nbaddpar= 24
      parname(  1)='PMPP'
      parname(  2)='PN'
      parname(  3)='Iprate'
      parname(  4)='Tg'
      parname(  5)='Tm'
      parname(  6)='tLVRT1'
      parname(  7)='tLVRT2'
      parname(  8)='tLVRTint'
      parname(  9)='Vmax'
      parname( 10)='tau'
      parname( 11)='Vminpll'
      parname( 12)='a'
      parname( 13)='Vmin'
      parname( 14)='Vint'
      parname( 15)='fmin'
      parname( 16)='fmax'
      parname( 17)='Trv'
      parname( 18)='Trf'
      parname( 19)='Re'
      parname( 20)='Xe'
      parname( 21)='CM1'
      parname( 22)='kRCI'
      parname( 23)='kRCA'
      parname( 24)='m'
      parname( 25)='n'
      parname( 26)='dbmin'
      parname( 27)='dbmax'
      parname( 28)='HVRT'
      parname( 29)='LVRT'
      parname( 30)='CM2'
      parname( 31)='Vtrip'
      parname( 32)='fdbup'
      parname( 33)='fdbdn'
      parname( 34)='Rup'
      parname( 35)='Rdn'
      parname( 36)='Trocof'
      parname( 37)='dfmax'
      parname( 38)='protection'
      parname( 39)='support'
      parname( 40)='IN'
      parname( 41)='vxlv'
      parname( 42)='vylv'
      parname( 43)='Vref'
      parname( 44)='Pext'
      parname( 45)='Qext'
      parname( 46)='Iqref'
      parname( 47)='Ipref'
      parname( 48)='kpll'
      parname( 49)='theta_PLL'
      parname( 50)='Uplim'
      parname( 51)='Downlim'
      parname( 52)='Downlimdisc'
      parname( 53)='UplimdeltaP'
      parname( 54)='DownlimdeltaP'
      parname( 55)='Tlim'
      parname( 56)='Uplimdis'
      parname( 57)='downlimdis'
      parname( 58)='ratemax'
      parname( 59)='dfup'
      parname( 60)='dfdn'
      parname( 61)='rate'
      parname( 62)='rateh'
      parname( 63)='fref'
      adix=  1
      adiy=  2
      nbxvar=111
      nbzvar= 41

!........................................................................................
   case (define_obs)
      nbobs= 21
      obsname(  1)='Ip'
      obsname(  2)='Iq'
      obsname(  3)='Pgen'
      obsname(  4)='Qgen'
      obsname(  5)='Vm'
      obsname(  6)='PLLPhaseAngle'
      obsname(  7)='fm'
      obsname(  8)='fmfilt'
      obsname(  9)='Fr'
      obsname( 10)='status'
      obsname( 11)='Frfh'
      obsname( 12)='Frfl'
      obsname( 13)='Ipcmd'
      obsname( 14)='Vt'
      obsname( 15)='wpll'
      obsname( 16)='vq'
      obsname( 17)='rocof'
      obsname( 18)='Ffr'
      obsname( 19)='Ffl'
      obsname( 20)='Ffh'
      obsname( 21)='Pflag'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 23)              
      obs(  4)=x( 24)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 41)              
      obs(  8)=x( 42)              
      obs(  9)=x( 55)              
      obs( 10)=x( 88)              
      obs( 11)=x( 73)              
      obs( 12)=x( 67)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 52)              
      obs( 16)=x( 21)              
      obs( 17)=x( 96)              
      obs( 18)=x(100)              
      obs( 19)=x( 44)              
      obs( 20)=x( 46)              
      obs( 21)=x( 36)              

!........................................................................................
   case (initialize)

!IN = {PN}
      prm( 40)= prm(  2)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 41)= vx + prm( 19)*ix - prm( 20)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 42)= vy + prm( 19)*iy + prm( 20)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 43)= dsqrt(prm( 41)**2 + prm( 42)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 44)= -prm( 41)*ix-prm( 42)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 45)= +prm( 41)*iy-prm( 42)*ix

!Iqref = -{Qext}/{Vref}
      prm( 46)= -prm( 45)/prm( 43)

!Ipref = -{Pext}/{Vref}
      prm( 47)= -prm( 44)/prm( 43)

!kpll = 10/({tau}*0.001)
      prm( 48)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 49)= atan(prm( 42)/prm( 41))

!Uplim = 9999
      prm( 50)= 9999

!Downlim = -9999
      prm( 51)= -9999

!Downlimdisc = 0
      prm( 52)= 0

!UplimdeltaP = 9999
      prm( 53)= 9999

!DownlimdeltaP = 0
      prm( 54)= 0

!Tlim = 0.01
      prm( 55)= 0.01

!Uplimdis = 0
      prm( 56)= 0

!downlimdis = -9999
      prm( 57)= -9999

!ratemax = {Iprate}*{IN}
      prm( 58)= prm(  3)*prm( 40)

!dfup = 1/{Rup} * {PN}/sbase
      prm( 59)= 1/prm( 34) * prm(  2)/sbase

!dfdn = 1/{Rdn} * {PN}/sbase
      prm( 60)= 1/prm( 35) * prm(  2)/sbase

!rate = 0.5
      prm( 61)= 0.5

!rateh = 0.5
      prm( 62)= 0.5

!fref = 1
      prm( 63)= 1

!vxl =  {vxlv}
      x(  3)= prm( 41)

!vyl =  {vylv}
      x(  4)= prm( 42)

!Vt =  {Vref}
      x(  5)= prm( 43)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 49)

!Vm =  {Vref}
      x(  7)= prm( 43)

!x2 =  {Vref}
      x(  8)= prm( 43)

!Ip =  {Ipref}
      x(  9)= prm( 47)

!Iq =  {Iqref}
      x( 10)= prm( 46)

!Ipcmd =  {Ipref}
      x( 11)= prm( 47)

!Iqcmd =  {Iqref}
      x( 12)= prm( 46)

!Iqmax =  dsqrt({IN}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm( 40)**2 - prm( 47)**2 )

!Iqmin =  - dsqrt({IN}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm( 40)**2 - prm( 47)**2 )

!Ipmaxi =  {IN}
      x( 15)= prm( 40)

!Ipmax =  min({IN},{PMPP}/{Vref})
      x( 16)= min(prm( 40),prm(  1)/prm( 43))

!Ipmin =  -0.001
      x( 17)= -0.001

!x4 =  {Ipref}
      x( 18)= prm( 47)

!DeltaW =  0
      x( 19)= 0

!DeltaWf =   0
      x( 20)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 21)= -prm( 41)*sin(prm( 49)) + prm( 42)*cos(prm( 49))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 22)= prm( 41)*cos(prm( 49)) + prm( 42)*sin(prm( 49))

!Pgen =  -{Pext}
      x( 23)= -prm( 44)

!Qgen =  -{Qext}
      x( 24)= -prm( 45)

!Iqext =  0
      x( 25)= 0

!Fvl =  1
      x( 26)= 1

!Fvli =  1
      x( 27)= 1

!z1 =  0.
      x( 28)= 0.

!x5 =  {Iqref}
      x( 29)= prm( 46)

!Iptemp =  {Ipref}
      x( 30)= prm( 47)

!Iqtemp =  {Iqref}
      x( 31)= prm( 46)

!x10 =  -{Vref}
      x( 32)= -prm( 43)

!x11 =  {Vref} - {Vmax}
      x( 33)= prm( 43) - prm(  9)

!z =  0.
      x( 34)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 35)= prm( 43) - prm( 26)

!Pflag =  1
      x( 36)= 1

!Pflagi =  1
      x( 37)= 1

!vxlm =  {vxlv}
      x( 38)= prm( 41)

!vylm =  {vylv}
      x( 39)= prm( 42)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 40)= -0.5*(prm( 41)*sin(prm( 49)) - prm( 42)*cos(prm( 49))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 41)= 50*(-0.5*(prm( 41)*sin(prm( 49)) - prm( 42)*cos(prm( 49))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 42)= 50*(-0.5*(prm( 41)*sin(prm( 49)) - prm( 42)*cos(prm( 49))) + 1)

!Ffli =  1.
      x( 43)= 1.

!Ffl =  1.
      x( 44)= 1.

!Ffhi =  1.
      x( 45)= 1.

!Ffh =  1.
      x( 46)= 1.

!Ptot =  -{Pext}
      x( 47)= -prm( 44)

!deltafl =  50*[omega] - {fmin}
      x( 48)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 49)= prm( 16) - 50*omega

!mult =  1
      x( 50)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 51)= prm( 43) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 52)= -(prm( 41)*sin(prm( 49)) - prm( 42)*cos(prm( 49)))*prm( 48) + 2*pi*50

!g =  0
      x( 53)= 0

!tr =  0
      x( 54)= 0

!Fr =  1
      x( 55)= 1

!Frtemp =  1
      x( 56)= 1

!fvlb =  1
      x( 57)= 1

!deltafvl =  -{Trv}
      x( 58)= -prm( 17)

!g1 =  1
      x( 59)= 1

!tr1 = 0
      x( 60)=0

!Frvh =  1
      x( 61)= 1

!Frvhtemp =  1
      x( 62)= 1

!fvhb =  1
      x( 63)= 1

!deltafvh =  -{Trv}
      x( 64)= -prm( 17)

!g2 =  0
      x( 65)= 0

!tr2 =  0
      x( 66)= 0

!Frfl =  1
      x( 67)= 1

!Frfltemp =  1
      x( 68)= 1

!fflb =  1
      x( 69)= 1

!deltaffl =  -{Trf}
      x( 70)= -prm( 18)

!g3 =  0
      x( 71)= 0

!tr3 =  0
      x( 72)= 0

!Frfh =  1
      x( 73)= 1

!Frfhtemp =  1
      x( 74)= 1

!ffhb =  1
      x( 75)= 1

!deltaffh =  -{Trf}
      x( 76)= -prm( 18)

!w1 =  0
      x( 77)= 0

!w2 =  0
      x( 78)= 0

!w3 =  0
      x( 79)= 0

!w4 =  0
      x( 80)= 0

!w5 =  0
      x( 81)= 0

!w6 =  0
      x( 82)= 0

!w7 =  0
      x( 83)= 0

!w8 =  0
      x( 84)= 0

!Frvhtemp1 = 1
      x( 85)=1

!one =  1
      x( 86)= 1

!zero =  0
      x( 87)= 0

!status =  1
      x( 88)= 1

!p1 =  {protection}
      x( 89)= prm( 38)

!p2 =  1
      x( 90)= 1

!p3 =  1
      x( 91)= 1

!s1 = {support}
      x( 92)=prm( 39)

!s2 =  1
      x( 93)= 1

!s3 =  0
      x( 94)= 0

!deltaf =  0
      x( 95)= 0

!rocof =  0
      x( 96)= 0

!abrocof =  0
      x( 97)= 0

!deltarocof =  {dfmax} - 0
      x( 98)= prm( 37) - 0

!Ffri =  1
      x( 99)= 1

!Ffr =  1
      x(100)= 1

!g4 =  0
      x(101)= 0

!tr4 =  0
      x(102)= 0

!deltaffr =  0.25
      x(103)= 0.25

!& algeq
      eqtyp(  1)=0

!& algeq
      eqtyp(  2)=0

!& algeq
      eqtyp(  3)=0

!& swsign
      eqtyp(  4)=0
      if(x( 89)>=0.)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq             ! switch support on and off
      eqtyp(  5)=0

!& algeq
      eqtyp(  6)=0

!& swsign            ! switch support off
      eqtyp(  7)=0
      if(x( 92)>=0.)then
         z(  2)=1
      else
         z(  2)=2
      endif

!& algeq
      eqtyp(  8)=0

!& algeq
      eqtyp(  9)=0

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance
      eqtyp( 10)=0

!& algeq
      eqtyp( 11)=0

!& algeq             ! voltage magnitude at PV
      eqtyp( 12)=0

!& tf1p              ! measurement delay of voltage magnitude
      eqtyp( 13)=  7
      tc( 13)=prm(  5)

!& max1v1c
      eqtyp( 14)=0
      if(x(  7)<0.01)then
         z(  3)=1
      else
         z(  3)=2
      endif

!& algeq         ! maximum active current computation
      eqtyp( 15)=0

!& algeq         ! minimum current
      eqtyp( 16)=0

!& limvb         ! limit current Ipcmd
      eqtyp( 17)=0
      if(x( 18)>x( 16))then
         z(  4)=1
      elseif(x( 18)<x( 17))then
         z(  4)=-1
      else
         z(  4)=0
      endif

!& algeq         ! output current computation, consider protection status
      eqtyp( 18)=0

!& tf1p2lim
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 58)= huge(0.d0)
      endif
      if(1*x( 11)-x( 30)>prm( 58)*prm(  4))then
         z(  5)=1
      elseif(1*x( 11)-x( 30)<prm( 51)*prm(  4))then
         z(  5)=-1
      else
         z(  5)=0
      endif
      eqtyp( 19)=0
      if(x( 30)>prm( 50))then
         z(  6)=1
         eqtyp( 20)=0
      elseif(x( 30)<prm( 51))then
         z(  6)=-1
         eqtyp( 20)=0
      else
         z(  6)=0
         eqtyp( 20)= 30
      endif
      tc( 20)=prm(  4)

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      eqtyp( 21)=0

!& algeq
      eqtyp( 22)=0

!& algeq                 ! reactive current computation limit and update
      eqtyp( 23)=0

!& limvb
      eqtyp( 24)=0
      if(x( 29)>x( 13))then
         z(  7)=1
      elseif(x( 29)<x( 14))then
         z(  7)=-1
      else
         z(  7)=0
      endif

!& algeq						!
      eqtyp( 25)=0

!& tf1p
      eqtyp( 26)= 31
      tc( 26)=prm(  4)

!& algeq 				  ! Active - reactive power priority, max active current, converter limit
      eqtyp( 27)=0

!& algeq 				  ! MPP limit
      eqtyp( 28)=0

!& db 						! Reactive current injection, voltage support
      eqtyp( 29)=0
      if(x(  7)>prm( 27))then
         z(  8)=1
      elseif(x(  7)<prm( 26))then
         z(  8)=-1
      else
         z(  8)=0
      endif

!& algeq   						!  Low voltage ride-through and LV protection flag
      eqtyp( 30)=0

!& timer5
      eqtyp( 31)=0
      eqtyp( 32)=0
      z(  9)=-1
      x(105)=0.

!& algeq 		
      eqtyp( 33)=0

!& hyst
      eqtyp( 34)=0
      if(x( 27)>1.1)then
         z( 10)=1
      elseif(x( 27)<0.9)then
         z( 10)=-1
      else
         if(1.>= 0.)then
            z( 10)=1
         else
            z( 10)=-1
         endif
      endif

!& algeq
      eqtyp( 35)=0

!& inlim
      if (1>= 0.005)then
         tc( 36)=1
      endif
      if (x( 54)>5)then
         z( 11)=1
         eqtyp( 36)=0
      elseif (x( 54)<0.) then
         z( 11)=-1
         eqtyp( 36)=0
      else
         z( 11)=0
         if (1>= 0.005)then
            eqtyp( 36)= 54
         else
            eqtyp( 36)=0
         endif
      endif

!& algeq
      eqtyp( 37)=0

!& algeq
      eqtyp( 38)=0

!& swsign
      eqtyp( 39)=0
      if(x( 58)>=0.)then
         z( 12)=1
      else
         z( 12)=2
      endif

!& tf1p2lim
      if(prm( 55)< 0.001)then
         prm( 55)=0.d0
         prm( 52)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 61)= huge(0.d0)
      endif
      if(1*x( 56)-x( 55)>prm( 61)*prm( 55))then
         z( 13)=1
      elseif(1*x( 56)-x( 55)<prm( 51)*prm( 55))then
         z( 13)=-1
      else
         z( 13)=0
      endif
      eqtyp( 40)=0
      if(x( 55)>prm( 50))then
         z( 14)=1
         eqtyp( 41)=0
      elseif(x( 55)<prm( 52))then
         z( 14)=-1
         eqtyp( 41)=0
      else
         z( 14)=0
         eqtyp( 41)= 55
      endif
      tc( 41)=prm( 55)

!& algeq								! High voltage ride-through and HV protection flag
      eqtyp( 42)=0

!& pwlin4
      eqtyp( 43)=0
      if(x( 33)<(-999))then
         z( 15)=1
      elseif(x( 33)>=999)then
         z( 15)=   3
      elseif((-999)<=x( 33) .and. x( 33)<0.)then
         z( 15)=  1
      elseif(0.<=x( 33) .and. x( 33)<0.)then
         z( 15)=  2
      elseif(0.<=x( 33) .and. x( 33)<999)then
         z( 15)=  3
      endif

!& inlim
      if (1>= 0.005)then
         tc( 44)=1
      endif
      if (x( 60)>5)then
         z( 16)=1
         eqtyp( 44)=0
      elseif (x( 60)<0.) then
         z( 16)=-1
         eqtyp( 44)=0
      else
         z( 16)=0
         if (1>= 0.005)then
            eqtyp( 44)= 60
         else
            eqtyp( 44)=0
         endif
      endif

!& algeq
      eqtyp( 45)=0

!& algeq
      eqtyp( 46)=0

!& algeq
      eqtyp( 47)=0

!& swsign
      eqtyp( 48)=0
      if(x( 64)>=0.)then
         z( 17)=1
      else
         z( 17)=2
      endif

!& algeq
      eqtyp( 49)=0

!& tf1p2lim
      if(prm( 55)< 0.001)then
         prm( 55)=0.d0
         prm( 52)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 62)= huge(0.d0)
      endif
      if(1*x( 85)-x( 61)>prm( 62)*prm( 55))then
         z( 18)=1
      elseif(1*x( 85)-x( 61)<prm( 51)*prm( 55))then
         z( 18)=-1
      else
         z( 18)=0
      endif
      eqtyp( 50)=0
      if(x( 61)>prm( 50))then
         z( 19)=1
         eqtyp( 51)=0
      elseif(x( 61)<prm( 52))then
         z( 19)=-1
         eqtyp( 51)=0
      else
         z( 19)=0
         eqtyp( 51)= 61
      endif
      tc( 51)=prm( 55)

!& algeq 						! reactive current priority flag
      eqtyp( 52)=0

!& swsign
      eqtyp( 53)=0
      if(x( 35)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& algeq                     ! PLL
      eqtyp( 54)=0

!& swsign
      eqtyp( 55)=0
      if(x( 51)>=0.)then
         z( 21)=1
      else
         z( 21)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 56)=0
      else
         eqtyp( 56)=  6
         tc( 56)=1.
      endif

!& pictl
      eqtyp( 57)=108
      x(108)=x( 52)
      eqtyp( 58)=0

!& algeq
      eqtyp( 59)=0

!& algeq
      eqtyp( 60)=0

!& tf1p              ! voltage measurement
      eqtyp( 61)= 38
      tc( 61)=prm(  5)

!& tf1p
      eqtyp( 62)= 39
      tc( 62)=prm(  5)

!& algeq                     ! filter PLL frequency , convert to Hz
      eqtyp( 63)=0

!& algeq
      eqtyp( 64)=0

!& tf1p
      eqtyp( 65)= 42
      tc( 65)=0.1

!& algeq                         ! frequency protection flag FFl, and FFh
      eqtyp( 66)=0

!& swsign
      eqtyp( 67)=0
      if(x( 48)>=0.)then
         z( 22)=1
      else
         z( 22)=2
      endif

!& algeq
      eqtyp( 68)=0

!& swsign
      eqtyp( 69)=0
      if(x( 49)>=0.)then
         z( 23)=1
      else
         z( 23)=2
      endif

!& hyst
      eqtyp( 70)=0
      if(x( 43)>1.1)then
         z( 24)=1
      elseif(x( 43)<0.9)then
         z( 24)=-1
      else
         if(1.>= 0.)then
            z( 24)=1
         else
            z( 24)=-1
         endif
      endif

!& hyst
      eqtyp( 71)=0
      if(x( 45)>1.1)then
         z( 25)=1
      elseif(x( 45)<0.9)then
         z( 25)=-1
      else
         if(1.>= 0.)then
            z( 25)=1
         else
            z( 25)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection
      eqtyp( 72)=0

!& inlim
      if (1>= 0.005)then
         tc( 73)=1
      endif
      if (x( 66)>5)then
         z( 26)=1
         eqtyp( 73)=0
      elseif (x( 66)<0.) then
         z( 26)=-1
         eqtyp( 73)=0
      else
         z( 26)=0
         if (1>= 0.005)then
            eqtyp( 73)= 66
         else
            eqtyp( 73)=0
         endif
      endif

!& algeq
      eqtyp( 74)=0

!& algeq
      eqtyp( 75)=0

!& swsign
      eqtyp( 76)=0
      if(x( 70)>=0.)then
         z( 27)=1
      else
         z( 27)=2
      endif

!& tf1p2lim
      if(prm( 55)< 0.001)then
         prm( 55)=0.d0
         prm( 52)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 62)= huge(0.d0)
      endif
      if(1*x( 68)-x( 67)>prm( 62)*prm( 55))then
         z( 28)=1
      elseif(1*x( 68)-x( 67)<prm( 51)*prm( 55))then
         z( 28)=-1
      else
         z( 28)=0
      endif
      eqtyp( 77)=0
      if(x( 67)>prm( 50))then
         z( 29)=1
         eqtyp( 78)=0
      elseif(x( 67)<prm( 52))then
         z( 29)=-1
         eqtyp( 78)=0
      else
         z( 29)=0
         eqtyp( 78)= 67
      endif
      tc( 78)=prm( 55)

!& algeq								! High frequency protection and reconnection
      eqtyp( 79)=0

!& inlim
      if (1>= 0.005)then
         tc( 80)=1
      endif
      if (x( 72)>5)then
         z( 30)=1
         eqtyp( 80)=0
      elseif (x( 72)<0.) then
         z( 30)=-1
         eqtyp( 80)=0
      else
         z( 30)=0
         if (1>= 0.005)then
            eqtyp( 80)= 72
         else
            eqtyp( 80)=0
         endif
      endif

!& algeq
      eqtyp( 81)=0

!& algeq
      eqtyp( 82)=0

!& swsign
      eqtyp( 83)=0
      if(x( 76)>=0.)then
         z( 31)=1
      else
         z( 31)=2
      endif

!& tf1p2lim
      if(prm( 55)< 0.001)then
         prm( 55)=0.d0
         prm( 52)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 62)= huge(0.d0)
      endif
      if(1*x( 74)-x( 73)>prm( 62)*prm( 55))then
         z( 32)=1
      elseif(1*x( 74)-x( 73)<prm( 51)*prm( 55))then
         z( 32)=-1
      else
         z( 32)=0
      endif
      eqtyp( 84)=0
      if(x( 73)>prm( 50))then
         z( 33)=1
         eqtyp( 85)=0
      elseif(x( 73)<prm( 52))then
         z( 33)=-1
         eqtyp( 85)=0
      else
         z( 33)=0
         eqtyp( 85)= 73
      endif
      tc( 85)=prm( 55)

!& algeq				! Frequency droop control
      eqtyp( 86)=0

!& db
      eqtyp( 87)=0
      if(x( 77)>prm( 33))then
         z( 34)=1
      elseif(x( 77)<prm( 32))then
         z( 34)=-1
      else
         z( 34)=0
      endif

!& algeq
      eqtyp( 88)=0

!& algeq
      eqtyp( 89)=0

!& lim
      eqtyp( 90)=0
      if(x( 79)>0.00001)then
         z( 35)=1
      elseif(x( 79)<(-99999.))then
         z( 35)=-1
      else
         z( 35)=0
      endif

!& lim
      eqtyp( 91)=0
      if(x( 80)>99999.)then
         z( 36)=1
      elseif(x( 80)<0.0001)then
         z( 36)=-1
      else
         z( 36)=0
      endif

!& algeq
      eqtyp( 92)=0

!& algeq
      eqtyp( 93)=0

!& swsign            ! switch support off
      eqtyp( 94)=0
      if(x( 92)>=0.)then
         z( 37)=1
      else
         z( 37)=2
      endif

!& algeq
      eqtyp( 95)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 96)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x(111)=x( 95)
      eqtyp( 97)=111
      tc( 97)=prm( 36)
      eqtyp( 98)=0

!& abs
      eqtyp( 99)=0
      if(x( 96)>0. )then
         z( 38)=1
      else
         z( 38)=-1
      endif

!& algeq               ! rocof protection and timer
      eqtyp(100)=0

!& swsign
      eqtyp(101)=0
      if(x( 98)>=0.)then
         z( 39)=1
      else
         z( 39)=2
      endif

!& algeq
      eqtyp(102)=0

!& inlim
      if (1>= 0.005)then
         tc(103)=1
      endif
      if (x(102)>5)then
         z( 40)=1
         eqtyp(103)=0
      elseif (x(102)<0) then
         z( 40)=-1
         eqtyp(103)=0
      else
         z( 40)=0
         if (1>= 0.005)then
            eqtyp(103)=102
         else
            eqtyp(103)=0
         endif
      endif

!& algeq
      eqtyp(104)=0

!& swsign
      eqtyp(105)=0
      if(x(103)>=0.)then
         z( 41)=1
      else
         z( 41)=2
      endif

!& algeq                 ! alignment equations
      eqtyp(106)=0

!& algeq
      eqtyp(107)=0

!& algeq
      eqtyp(108)=0

!& algeq
      eqtyp(109)=0

!& algeq
      eqtyp(110)=0

!& algeq
      eqtyp(111)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=-x( 90) + x( 55)*x( 61)*x( 67)*x( 73)*x(100)

!& algeq
      f(  2)=x( 89) - prm( 38)

!& algeq
      f(  3)=x( 91) - 1

!& swsign
      select case (z(  1))
         case(1)
            f(  4)=x( 88)-x( 90)
         case(2)
            f(  4)=x( 88)-x( 91)
      end select

!& algeq             ! switch support on and off
      f(  5)=x( 92) - prm( 39)

!& algeq
      f(  6)=x( 93) - 1

!& swsign            ! switch support off
      select case (z(  2))
         case(1)
            f(  7)=x( 36)-x( 37)
         case(2)
            f(  7)=x( 36)-x( 93)
      end select

!& algeq
      f(  8)=x( 86)-1

!& algeq
      f(  9)=x( 87)

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance
      f( 10)=vx + prm( 19)*x(  1) - prm( 20)*x(  2) - x(  3)

!& algeq
      f( 11)=vy + prm( 19)*x(  2) + prm( 20)*x(  1) - x(  4)

!& algeq             ! voltage magnitude at PV
      f( 12)=x(  5) - dsqrt(x(  3)**2 + x(  4)**2)

!& tf1p              ! measurement delay of voltage magnitude
      f( 13)=(-x(  7)+1.*x(  5))

!& max1v1c
      select case (z(  3))
         case(1)
            f( 14)=0.01-x(  8)
         case(2)
            f( 14)=x(  7)-x(  8)
      end select

!& algeq         ! maximum active current computation
      f( 15)=x( 47)/x(  8) - x( 18)

!& algeq         ! minimum current
      f( 16)=x( 17) + 0.001

!& limvb         ! limit current Ipcmd
      select case (z(  4))
         case(0)
            f( 17)=x( 11)-x( 18)
         case(-1)
            f( 17)=x( 11)-x( 17)
         case(1)
            f( 17)=x( 11)-x( 16)
      end select

!& algeq         ! output current computation, consider protection status
      f( 18)=x( 30)*x( 88) - x(  9)

!& tf1p2lim
      select case (z(  5))
         case(0)
            f( 19)=x(104)-1*x( 11)+x( 30)
         case(1)
            f( 19)=x(104)-prm( 58)*prm(  4)
         case(-1)
            f( 19)=x(104)-prm( 51)*prm(  4)
      end select
      select case (z(  6))
         case(0)
            f( 20)=x(104)
         case(1)
            f( 20)=x( 30)-prm( 50)
         case(-1)
            f( 20)=x( 30)-prm( 51)
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      f( 21)=x( 13) -x( 36)*dsqrt(max(0.d0,prm( 40)**2 - x( 11)**2)) - (1-x( 36))*prm( 40)

!& algeq
      f( 22)=x( 14) + x( 36)*dsqrt(max(0.d0,prm( 40)**2 - x( 11)**2)) + (1-x( 36))*prm( 40)

!& algeq                 ! reactive current computation limit and update
      f( 23)=-x( 25) + prm( 46) - x( 29)

!& limvb
      select case (z(  7))
         case(0)
            f( 24)=x( 12)-x( 29)
         case(-1)
            f( 24)=x( 12)-x( 14)
         case(1)
            f( 24)=x( 12)-x( 13)
      end select

!& algeq						!
      f( 25)=x( 31)*x( 88) - x( 10)

!& tf1p
      f( 26)=(-x( 31)+1.*x( 12))

!& algeq 				  ! Active - reactive power priority, max active current, converter limit
      f( 27)=x( 15) - x( 36)*prm( 40) -  (1-x( 36))*dsqrt(max(0.d0,prm( 40)**2 - x( 12)**2))

!& algeq 				  ! MPP limit
      f( 28)=- x( 16) + min(x( 15), prm(  1)/x(  7))

!& db 						! Reactive current injection, voltage support
      select case (z(  8))
         case(0)
            f( 29)=x( 25)
         case(-1)
            f( 29)=x( 25)-(-prm( 24)*prm( 40)*(prm( 21) + prm( 30)))-(prm( 22)*prm( 40)*(prm( 21) + prm( 30) ))*(x(  7)-prm( 26))
         case(1)
            f( 29)=x( 25)-prm( 25)*prm( 40)-prm( 23)*prm( 40)*prm( 28)*(x(  7)-prm( 27))
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag
      f( 30)=x(  7) + x( 32)

!& timer5
      select case (z(  9))
         case (-1)
            f( 31)=x( 34)
            f( 32)=x(105)
         case (0)
            f( 31)=x( 34)
            f( 32)= 1.
         case (1)
            f( 31)=x( 34)-1.
            f( 32)= 0.
      end select

!& algeq 		
      f( 33)=x( 27) -1 + x( 34)

!& hyst
      if(z( 10) == 1)then
         f( 34)=x( 26)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 34)=x( 26)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 35)=x( 53) - 1 + x( 26)

!& inlim
      if (1>= 0.005)then
         select case (z( 11))
            case(0)
               f( 36)=x( 53)
            case(1)
               f( 36)=x( 54)-5
            case(-1)
               f( 36)=x( 54)-0.
         end select
      else
         select case (z( 11))
            case(0)
               f( 36)=x( 53)-x( 54)
            case(1)
               f( 36)=x( 54)-5
            case(-1)
               f( 36)=x( 54)-0.
         end select
      endif

!& algeq
      f( 37)=x( 57) - 1 + x( 53)

!& algeq
      f( 38)=x( 58) + prm( 17) - x( 54)

!& swsign
      select case (z( 12))
         case(1)
            f( 39)=x( 56)-x( 86)
         case(2)
            f( 39)=x( 56)-x( 57)
      end select

!& tf1p2lim
      select case (z( 13))
         case(0)
            f( 40)=x(106)-1*x( 56)+x( 55)
         case(1)
            f( 40)=x(106)-prm( 61)*prm( 55)
         case(-1)
            f( 40)=x(106)-prm( 51)*prm( 55)
      end select
      select case (z( 14))
         case(0)
            f( 41)=x(106)
         case(1)
            f( 41)=x( 55)-prm( 50)
         case(-1)
            f( 41)=x( 55)-prm( 52)
      end select

!& algeq								! High voltage ride-through and HV protection flag
      f( 42)=x( 33) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 15))
         case (  1)
            f( 43)=0.+ ( (0.-0.)*(x( 33)-(-999))/(0.-(-999)) ) -x( 28)
         case (  2)
            f( 43)=0.+ ( (1.-0.)*(x( 33)-0.)/(0.-0.) ) -x( 28)
         case (  3)
            f( 43)=1.+ ( (1.-1.)*(x( 33)-0.)/(999-0.) ) -x( 28)
      end select

!& inlim
      if (1>= 0.005)then
         select case (z( 16))
            case(0)
               f( 44)=x( 28)
            case(1)
               f( 44)=x( 60)-5
            case(-1)
               f( 44)=x( 60)-0.
         end select
      else
         select case (z( 16))
            case(0)
               f( 44)=x( 28)-x( 60)
            case(1)
               f( 44)=x( 60)-5
            case(-1)
               f( 44)=x( 60)-0.
         end select
      endif

!& algeq
      f( 45)=x( 59) - 1 + x( 28)

!& algeq
      f( 46)=x( 63) - 1 + x( 28)

!& algeq
      f( 47)=x( 64) + prm( 17) - x( 60)

!& swsign
      select case (z( 17))
         case(1)
            f( 48)=x( 62)-x( 86)
         case(2)
            f( 48)=x( 62)-x( 63)
      end select

!& algeq
      f( 49)=x( 85) - x( 62)*x( 59)

!& tf1p2lim
      select case (z( 18))
         case(0)
            f( 50)=x(107)-1*x( 85)+x( 61)
         case(1)
            f( 50)=x(107)-prm( 62)*prm( 55)
         case(-1)
            f( 50)=x(107)-prm( 51)*prm( 55)
      end select
      select case (z( 19))
         case(0)
            f( 51)=x(107)
         case(1)
            f( 51)=x( 61)-prm( 50)
         case(-1)
            f( 51)=x( 61)-prm( 52)
      end select

!& algeq 						! reactive current priority flag
      f( 52)=x( 35) - x(  7) + prm( 26)

!& swsign
      select case (z( 20))
         case(1)
            f( 53)=x( 36)-x( 86)
         case(2)
            f( 53)=x( 36)-x( 87)
      end select

!& algeq                     ! PLL
      f( 54)=x( 51) - x(  7) + prm( 11)

!& swsign
      select case (z( 21))
         case(1)
            f( 55)=x( 50)-x( 86)
         case(2)
            f( 55)=x( 50)-x( 87)
      end select

!& int
      if (1.< 0.005)then
         f( 56)=x( 20)-x(  6)
      else
         f( 56)=x( 20)
      endif

!& pictl
      f( 57)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 21)
      f( 58)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 21)+x(108)-x( 52)

!& algeq
      f( 59)=x( 19) - x( 52) + omega*2*pi*50

!& algeq
      f( 60)=x( 20) - x( 19)*x( 50)

!& tf1p              ! voltage measurement
      f( 61)=(-x( 38)+1.*x(  3))

!& tf1p
      f( 62)=(-x( 39)+1.*x(  4))

!& algeq                     ! filter PLL frequency , convert to Hz
      f( 63)=x( 40) - x( 52)/(2*pi*50)

!& algeq
      f( 64)=x( 41) - 50*x( 40)

!& tf1p
      f( 65)=(-x( 42)+1*x( 41))

!& algeq                         ! frequency protection flag FFl, and FFh
      f( 66)=x( 48) - x( 42) + prm( 15)

!& swsign
      select case (z( 22))
         case(1)
            f( 67)=x( 43)-x( 86)
         case(2)
            f( 67)=x( 43)-x( 87)
      end select

!& algeq
      f( 68)=x( 49) - prm( 16) + x( 42)

!& swsign
      select case (z( 23))
         case(1)
            f( 69)=x( 45)-x( 86)
         case(2)
            f( 69)=x( 45)-x( 87)
      end select

!& hyst
      if(z( 24) == 1)then
         f( 70)=x( 44)-1.-(1.-1.)*(x( 43)-1.1)/(1.1-0.9)
      else
         f( 70)=x( 44)-0.-(0.-0.)*(x( 43)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 25) == 1)then
         f( 71)=x( 46)-1.-(1.-1.)*(x( 45)-1.1)/(1.1-0.9)
      else
         f( 71)=x( 46)-0.-(0.-0.)*(x( 45)-0.9)/(1.1-0.9)
      endif

!& algeq						       ! Low frequency protection and reconnection
      f( 72)=x( 65) - 1 + x( 44)

!& inlim
      if (1>= 0.005)then
         select case (z( 26))
            case(0)
               f( 73)=x( 65)
            case(1)
               f( 73)=x( 66)-5
            case(-1)
               f( 73)=x( 66)-0.
         end select
      else
         select case (z( 26))
            case(0)
               f( 73)=x( 65)-x( 66)
            case(1)
               f( 73)=x( 66)-5
            case(-1)
               f( 73)=x( 66)-0.
         end select
      endif

!& algeq
      f( 74)=x( 69) - 1 + x( 65)

!& algeq
      f( 75)=x( 70) + prm( 18) - x( 66)

!& swsign
      select case (z( 27))
         case(1)
            f( 76)=x( 68)-x( 86)
         case(2)
            f( 76)=x( 68)-x( 69)
      end select

!& tf1p2lim
      select case (z( 28))
         case(0)
            f( 77)=x(109)-1*x( 68)+x( 67)
         case(1)
            f( 77)=x(109)-prm( 62)*prm( 55)
         case(-1)
            f( 77)=x(109)-prm( 51)*prm( 55)
      end select
      select case (z( 29))
         case(0)
            f( 78)=x(109)
         case(1)
            f( 78)=x( 67)-prm( 50)
         case(-1)
            f( 78)=x( 67)-prm( 52)
      end select

!& algeq								! High frequency protection and reconnection
      f( 79)=x( 71) - 1 + x( 46)

!& inlim
      if (1>= 0.005)then
         select case (z( 30))
            case(0)
               f( 80)=x( 71)
            case(1)
               f( 80)=x( 72)-5
            case(-1)
               f( 80)=x( 72)-0.
         end select
      else
         select case (z( 30))
            case(0)
               f( 80)=x( 71)-x( 72)
            case(1)
               f( 80)=x( 72)-5
            case(-1)
               f( 80)=x( 72)-0.
         end select
      endif

!& algeq
      f( 81)=x( 75) - 1 + x( 71)

!& algeq
      f( 82)=x( 76) + prm( 18) - x( 72)

!& swsign
      select case (z( 31))
         case(1)
            f( 83)=x( 74)-x( 86)
         case(2)
            f( 83)=x( 74)-x( 75)
      end select

!& tf1p2lim
      select case (z( 32))
         case(0)
            f( 84)=x(110)-1*x( 74)+x( 73)
         case(1)
            f( 84)=x(110)-prm( 62)*prm( 55)
         case(-1)
            f( 84)=x(110)-prm( 51)*prm( 55)
      end select
      select case (z( 33))
         case(0)
            f( 85)=x(110)
         case(1)
            f( 85)=x( 73)-prm( 50)
         case(-1)
            f( 85)=x( 73)-prm( 52)
      end select

!& algeq				! Frequency droop control
      f( 86)=x( 77) + (x( 42)/50) - prm( 63)

!& db
      select case (z( 34))
         case(0)
            f( 87)=x( 78)
         case(-1)
            f( 87)=x( 78)-0.-1.*(x( 77)-prm( 32))
         case(1)
            f( 87)=x( 78)-0.-1.*(x( 77)-prm( 33))
      end select

!& algeq
      f( 88)=x( 79) - x( 78)*prm( 59)

!& algeq
      f( 89)=x( 80) - x( 78)*prm( 60)

!& lim
      select case (z( 35))
         case(0)
            f( 90)=x( 81)-x( 79)
         case(-1)
            f( 90)=x( 81)-(-99999.)
         case(1)
            f( 90)=x( 81)-0.00001
      end select

!& lim
      select case (z( 36))
         case(0)
            f( 91)=x( 82)-x( 80)
         case(-1)
            f( 91)=x( 82)-0.0001
         case(1)
            f( 91)=x( 82)-99999.
      end select

!& algeq
      f( 92)=x( 83)-x( 82)-x( 81)

!& algeq
      f( 93)=x( 94)

!& swsign            ! switch support off
      select case (z( 37))
         case(1)
            f( 94)=x( 84)-x( 83)
         case(2)
            f( 94)=x( 84)-x( 94)
      end select

!& algeq
      f( 95)=x( 47)+prm( 44)-x( 84)

!& algeq                ! frequency deviation in Hz
      f( 96)=-x( 95) + x( 42)-prm( 63)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 97)=-x(111)+x( 95)
      if (prm( 36)< 0.005)then
         f( 98)=1/prm( 36)*x( 95)-x( 96)
      else
         f( 98)=1/prm( 36)*(x( 95)-x(111))-x( 96)
      endif

!& abs
      if(z( 38) == 1 )then
         f( 99)=x( 97)-x( 96)
      else
         f( 99)=x( 97)+x( 96)
      endif

!& algeq               ! rocof protection and timer
      f(100)=-x( 98) +prm( 37) -x( 97)

!& swsign
      select case (z( 39))
         case(1)
            f(101)=x( 99)-x( 86)
         case(2)
            f(101)=x( 99)-x( 87)
      end select

!& algeq
      f(102)=x(101) - 1 + x( 99)

!& inlim
      if (1>= 0.005)then
         select case (z( 40))
            case(0)
               f(103)=x(101)
            case(1)
               f(103)=x(102)-5
            case(-1)
               f(103)=x(102)-0
         end select
      else
         select case (z( 40))
            case(0)
               f(103)=x(101)-x(102)
            case(1)
               f(103)=x(102)-5
            case(-1)
               f(103)=x(102)-0
         end select
      endif

!& algeq
      f(104)=-x(103) + 0.25 - x(102)

!& swsign
      select case (z( 41))
         case(1)
            f(105)=x(100)-x( 86)
         case(2)
            f(105)=x(100)-x( 87)
      end select

!& algeq                 ! alignment equations
      f(106)=x( 22) - x( 38)*cos(x(  6)) - x( 39)*sin(x(  6))

!& algeq
      f(107)=x( 21) + x( 38)*sin(x(  6)) - x( 39)*cos(x(  6))

!& algeq
      f(108)=x( 23) - x( 22)*x(  9)

!& algeq
      f(109)=x( 24) - x( 22)*x( 10)

!& algeq
      f(110)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f(111)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!........................................................................................
   case (update_disc)

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z(  1))
         case(1)
            if(x( 89)<0.)then
               z(  1)=2
            endif
         case(2)
            if(x( 89)>=0.)then
               z(  1)=1
            endif
      end select

!& algeq             ! switch support on and off

!& algeq

!& swsign            ! switch support off
      select case (z(  2))
         case(1)
            if(x( 92)<0.)then
               z(  2)=2
            endif
         case(2)
            if(x( 92)>=0.)then
               z(  2)=1
            endif
      end select

!& algeq

!& algeq

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance

!& algeq

!& algeq             ! voltage magnitude at PV

!& tf1p              ! measurement delay of voltage magnitude

!& max1v1c
      select case (z(  3))
         case(1)
            if(x(  7)>0.01)then
               z(  3)=2
            endif
         case(2)
            if(0.01>x(  7))then
               z(  3)=1
            endif
      end select

!& algeq         ! maximum active current computation

!& algeq         ! minimum current

!& limvb         ! limit current Ipcmd
      select case (z(  4))
         case(0)
            if(x( 18)>x( 16))then
               z(  4)=1
            elseif(x( 18)<x( 17))then
               z(  4)=-1
            endif
         case(-1)
            if(x( 18)>x( 17))then
               z(  4)=0
            endif
         case(1)
            if(x( 18)<x( 16))then
               z(  4)=0
            endif
      end select

!& algeq         ! output current computation, consider protection status

!& tf1p2lim
      select case (z(  5))
         case(0)
            if(x(104)>prm( 58)*prm(  4))then
               z(  5)=1
            elseif(x(104)<prm( 51)*prm(  4))then
               z(  5)=-1
            endif
         case(1)
            if(1*x( 11)-x( 30)<prm( 58)*prm(  4))then
               z(  5)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 30)>prm( 51)*prm(  4))then
               z(  5)= 0
            endif
      end select
      select case (z(  6))
         case(0)
            if(x( 30)>prm( 50))then
               z(  6)=1
               eqtyp( 20)=0
            elseif(x( 30)<prm( 51))then
               z(  6)=-1
               eqtyp( 20)=0
            endif
         case(1)
            if (x(104)<0.)then
               z(  6)= 0
               eqtyp( 20)= 30
            endif
         case(-1)
            if(x(104)>0.)then
               z(  6)= 0
               eqtyp( 20)= 30
            endif
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current

!& algeq

!& algeq                 ! reactive current computation limit and update

!& limvb
      select case (z(  7))
         case(0)
            if(x( 29)>x( 13))then
               z(  7)=1
            elseif(x( 29)<x( 14))then
               z(  7)=-1
            endif
         case(-1)
            if(x( 29)>x( 14))then
               z(  7)=0
            endif
         case(1)
            if(x( 29)<x( 13))then
               z(  7)=0
            endif
      end select

!& algeq						!

!& tf1p

!& algeq 				  ! Active - reactive power priority, max active current, converter limit

!& algeq 				  ! MPP limit

!& db 						! Reactive current injection, voltage support
      select case (z(  8))
         case(0)
            if(x(  7)>prm( 27))then
               z(  8)=1
            elseif(x(  7)<prm( 26))then
               z(  8)=-1
            endif
         case(-1)
            if(x(  7)>prm( 26))then
               z(  8)=0
            endif
         case(1)
            if(x(  7)<prm( 27))then
               z(  8)=0
            endif
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag

!& timer5
      if(z(  9) == -1)then
         if(x( 32) >= (-prm( 12)))then
            z(  9)=0
            eqtyp( 32)=105
         endif
      else
         if(x( 32) < (-prm( 12)))then
            z(  9)=-1
            eqtyp( 32)=0
         endif
      endif
      if(z(  9) == 0)then
         if(x( 32) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x(105) > 0.)then
               z(  9)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x(105) > prm(  6)+(0.-prm(  6))*(x( 32)-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))))then
               z(  9)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x(105) > prm(  6)+(prm(  6)-prm(  6))*(x( 32)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  9)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x(105) > prm(  8)+(prm(  6)-prm(  8))*(x( 32)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  9)=1
            endif
         elseif(x( 32) > (-prm( 12)))then
            if(x(105) > prm(  7)+(prm(  8)-prm(  7))*(x( 32)-(-prm( 12)))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-prm( 12))))then
               z(  9)=1
            endif
         endif
      endif

!& algeq 		

!& hyst
      if (z( 10) == -1)then
         if(x( 27)>1.1)then
            z( 10)=1
         endif
      else
         if(x( 27)<0.9)then
            z( 10)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 11))
            case(0)
               if(x( 54)<0.)then
                  z( 11)=-1
                  eqtyp( 36)=0
               elseif(x( 54)>5)then
                  z( 11)= 1
                  eqtyp( 36)=0
               endif
            case(1)
               if(x( 53)<0.)then
                  z( 11)=0
                  eqtyp( 36)= 54
               endif
            case(-1)
               if(x( 53)>0.)then
                  z( 11)=0
                  eqtyp( 36)= 54
               endif
         end select
      else
         select case (z( 11))
            case(0)
               if(x( 54)<0.)then
                  z( 11)=-1
               elseif(x( 54)>5)then
                  z( 11)= 1
               endif
            case(1)
               if(x( 53)<5)then
                  z( 11)=0
               endif
            case(-1)
               if(x( 53)>0.)then
                  z( 11)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 12))
         case(1)
            if(x( 58)<0.)then
               z( 12)=2
            endif
         case(2)
            if(x( 58)>=0.)then
               z( 12)=1
            endif
      end select

!& tf1p2lim
      select case (z( 13))
         case(0)
            if(x(106)>prm( 61)*prm( 55))then
               z( 13)=1
            elseif(x(106)<prm( 51)*prm( 55))then
               z( 13)=-1
            endif
         case(1)
            if(1*x( 56)-x( 55)<prm( 61)*prm( 55))then
               z( 13)= 0
            endif
         case(-1)
            if(1*x( 56)-x( 55)>prm( 51)*prm( 55))then
               z( 13)= 0
            endif
      end select
      select case (z( 14))
         case(0)
            if(x( 55)>prm( 50))then
               z( 14)=1
               eqtyp( 41)=0
            elseif(x( 55)<prm( 52))then
               z( 14)=-1
               eqtyp( 41)=0
            endif
         case(1)
            if (x(106)<0.)then
               z( 14)= 0
               eqtyp( 41)= 55
            endif
         case(-1)
            if(x(106)>0.)then
               z( 14)= 0
               eqtyp( 41)= 55
            endif
      end select

!& algeq								! High voltage ride-through and HV protection flag

!& pwlin4
      if(x( 33)<(-999))then
         z( 15)=1
      elseif(x( 33)>=999)then
         z( 15)=  3
      elseif((-999)<=x( 33) .and. x( 33)<0.)then
         z( 15)=  1
      elseif(0.<=x( 33) .and. x( 33)<0.)then
         z( 15)=  2
      elseif(0.<=x( 33) .and. x( 33)<999)then
         z( 15)=  3
      endif

!& inlim
      if (1>= 0.005)then
         select case (z( 16))
            case(0)
               if(x( 60)<0.)then
                  z( 16)=-1
                  eqtyp( 44)=0
               elseif(x( 60)>5)then
                  z( 16)= 1
                  eqtyp( 44)=0
               endif
            case(1)
               if(x( 28)<0.)then
                  z( 16)=0
                  eqtyp( 44)= 60
               endif
            case(-1)
               if(x( 28)>0.)then
                  z( 16)=0
                  eqtyp( 44)= 60
               endif
         end select
      else
         select case (z( 16))
            case(0)
               if(x( 60)<0.)then
                  z( 16)=-1
               elseif(x( 60)>5)then
                  z( 16)= 1
               endif
            case(1)
               if(x( 28)<5)then
                  z( 16)=0
               endif
            case(-1)
               if(x( 28)>0.)then
                  z( 16)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 17))
         case(1)
            if(x( 64)<0.)then
               z( 17)=2
            endif
         case(2)
            if(x( 64)>=0.)then
               z( 17)=1
            endif
      end select

!& algeq

!& tf1p2lim
      select case (z( 18))
         case(0)
            if(x(107)>prm( 62)*prm( 55))then
               z( 18)=1
            elseif(x(107)<prm( 51)*prm( 55))then
               z( 18)=-1
            endif
         case(1)
            if(1*x( 85)-x( 61)<prm( 62)*prm( 55))then
               z( 18)= 0
            endif
         case(-1)
            if(1*x( 85)-x( 61)>prm( 51)*prm( 55))then
               z( 18)= 0
            endif
      end select
      select case (z( 19))
         case(0)
            if(x( 61)>prm( 50))then
               z( 19)=1
               eqtyp( 51)=0
            elseif(x( 61)<prm( 52))then
               z( 19)=-1
               eqtyp( 51)=0
            endif
         case(1)
            if (x(107)<0.)then
               z( 19)= 0
               eqtyp( 51)= 61
            endif
         case(-1)
            if(x(107)>0.)then
               z( 19)= 0
               eqtyp( 51)= 61
            endif
      end select

!& algeq 						! reactive current priority flag

!& swsign
      select case (z( 20))
         case(1)
            if(x( 35)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 35)>=0.)then
               z( 20)=1
            endif
      end select

!& algeq                     ! PLL

!& swsign
      select case (z( 21))
         case(1)
            if(x( 51)<0.)then
               z( 21)=2
            endif
         case(2)
            if(x( 51)>=0.)then
               z( 21)=1
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
      select case (z( 22))
         case(1)
            if(x( 48)<0.)then
               z( 22)=2
            endif
         case(2)
            if(x( 48)>=0.)then
               z( 22)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 23))
         case(1)
            if(x( 49)<0.)then
               z( 23)=2
            endif
         case(2)
            if(x( 49)>=0.)then
               z( 23)=1
            endif
      end select

!& hyst
      if (z( 24) == -1)then
         if(x( 43)>1.1)then
            z( 24)=1
         endif
      else
         if(x( 43)<0.9)then
            z( 24)=-1
         endif
      endif

!& hyst
      if (z( 25) == -1)then
         if(x( 45)>1.1)then
            z( 25)=1
         endif
      else
         if(x( 45)<0.9)then
            z( 25)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 26))
            case(0)
               if(x( 66)<0.)then
                  z( 26)=-1
                  eqtyp( 73)=0
               elseif(x( 66)>5)then
                  z( 26)= 1
                  eqtyp( 73)=0
               endif
            case(1)
               if(x( 65)<0.)then
                  z( 26)=0
                  eqtyp( 73)= 66
               endif
            case(-1)
               if(x( 65)>0.)then
                  z( 26)=0
                  eqtyp( 73)= 66
               endif
         end select
      else
         select case (z( 26))
            case(0)
               if(x( 66)<0.)then
                  z( 26)=-1
               elseif(x( 66)>5)then
                  z( 26)= 1
               endif
            case(1)
               if(x( 65)<5)then
                  z( 26)=0
               endif
            case(-1)
               if(x( 65)>0.)then
                  z( 26)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 27))
         case(1)
            if(x( 70)<0.)then
               z( 27)=2
            endif
         case(2)
            if(x( 70)>=0.)then
               z( 27)=1
            endif
      end select

!& tf1p2lim
      select case (z( 28))
         case(0)
            if(x(109)>prm( 62)*prm( 55))then
               z( 28)=1
            elseif(x(109)<prm( 51)*prm( 55))then
               z( 28)=-1
            endif
         case(1)
            if(1*x( 68)-x( 67)<prm( 62)*prm( 55))then
               z( 28)= 0
            endif
         case(-1)
            if(1*x( 68)-x( 67)>prm( 51)*prm( 55))then
               z( 28)= 0
            endif
      end select
      select case (z( 29))
         case(0)
            if(x( 67)>prm( 50))then
               z( 29)=1
               eqtyp( 78)=0
            elseif(x( 67)<prm( 52))then
               z( 29)=-1
               eqtyp( 78)=0
            endif
         case(1)
            if (x(109)<0.)then
               z( 29)= 0
               eqtyp( 78)= 67
            endif
         case(-1)
            if(x(109)>0.)then
               z( 29)= 0
               eqtyp( 78)= 67
            endif
      end select

!& algeq								! High frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 30))
            case(0)
               if(x( 72)<0.)then
                  z( 30)=-1
                  eqtyp( 80)=0
               elseif(x( 72)>5)then
                  z( 30)= 1
                  eqtyp( 80)=0
               endif
            case(1)
               if(x( 71)<0.)then
                  z( 30)=0
                  eqtyp( 80)= 72
               endif
            case(-1)
               if(x( 71)>0.)then
                  z( 30)=0
                  eqtyp( 80)= 72
               endif
         end select
      else
         select case (z( 30))
            case(0)
               if(x( 72)<0.)then
                  z( 30)=-1
               elseif(x( 72)>5)then
                  z( 30)= 1
               endif
            case(1)
               if(x( 71)<5)then
                  z( 30)=0
               endif
            case(-1)
               if(x( 71)>0.)then
                  z( 30)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 31))
         case(1)
            if(x( 76)<0.)then
               z( 31)=2
            endif
         case(2)
            if(x( 76)>=0.)then
               z( 31)=1
            endif
      end select

!& tf1p2lim
      select case (z( 32))
         case(0)
            if(x(110)>prm( 62)*prm( 55))then
               z( 32)=1
            elseif(x(110)<prm( 51)*prm( 55))then
               z( 32)=-1
            endif
         case(1)
            if(1*x( 74)-x( 73)<prm( 62)*prm( 55))then
               z( 32)= 0
            endif
         case(-1)
            if(1*x( 74)-x( 73)>prm( 51)*prm( 55))then
               z( 32)= 0
            endif
      end select
      select case (z( 33))
         case(0)
            if(x( 73)>prm( 50))then
               z( 33)=1
               eqtyp( 85)=0
            elseif(x( 73)<prm( 52))then
               z( 33)=-1
               eqtyp( 85)=0
            endif
         case(1)
            if (x(110)<0.)then
               z( 33)= 0
               eqtyp( 85)= 73
            endif
         case(-1)
            if(x(110)>0.)then
               z( 33)= 0
               eqtyp( 85)= 73
            endif
      end select

!& algeq				! Frequency droop control

!& db
      select case (z( 34))
         case(0)
            if(x( 77)>prm( 33))then
               z( 34)=1
            elseif(x( 77)<prm( 32))then
               z( 34)=-1
            endif
         case(-1)
            if(x( 77)>prm( 32))then
               z( 34)=0
            endif
         case(1)
            if(x( 77)<prm( 33))then
               z( 34)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 35))
         case(0)
            if(x( 79)>0.00001)then
               z( 35)=1
            elseif(x( 79)<(-99999.))then
               z( 35)=-1
            endif
         case(-1)
            if(x( 79)>(-99999.))then
               z( 35)=0
            endif
         case(1)
            if(x( 79)<0.00001)then
               z( 35)=0
            endif
      end select

!& lim
      select case (z( 36))
         case(0)
            if(x( 80)>99999.)then
               z( 36)=1
            elseif(x( 80)<0.0001)then
               z( 36)=-1
            endif
         case(-1)
            if(x( 80)>0.0001)then
               z( 36)=0
            endif
         case(1)
            if(x( 80)<99999.)then
               z( 36)=0
            endif
      end select

!& algeq

!& algeq

!& swsign            ! switch support off
      select case (z( 37))
         case(1)
            if(x( 92)<0.)then
               z( 37)=2
            endif
         case(2)
            if(x( 92)>=0.)then
               z( 37)=1
            endif
      end select

!& algeq

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 38) == -1 )then
         if(x( 96)> blocktol1 )then
            z( 38)=1
         endif
      else
         if(x( 96)< - blocktol1 )then
            z( 38)=-1
         endif
      endif

!& algeq               ! rocof protection and timer

!& swsign
      select case (z( 39))
         case(1)
            if(x( 98)<0.)then
               z( 39)=2
            endif
         case(2)
            if(x( 98)>=0.)then
               z( 39)=1
            endif
      end select

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 40))
            case(0)
               if(x(102)<0)then
                  z( 40)=-1
                  eqtyp(103)=0
               elseif(x(102)>5)then
                  z( 40)= 1
                  eqtyp(103)=0
               endif
            case(1)
               if(x(101)<0.)then
                  z( 40)=0
                  eqtyp(103)=102
               endif
            case(-1)
               if(x(101)>0.)then
                  z( 40)=0
                  eqtyp(103)=102
               endif
         end select
      else
         select case (z( 40))
            case(0)
               if(x(102)<0)then
                  z( 40)=-1
               elseif(x(102)>5)then
                  z( 40)= 1
               endif
            case(1)
               if(x(101)<5)then
                  z( 40)=0
               endif
            case(-1)
               if(x(101)>0)then
                  z( 40)=0
               endif
         end select
      endif

!& algeq

!& swsign
      select case (z( 41))
         case(1)
            if(x(103)<0.)then
               z( 41)=2
            endif
         case(2)
            if(x(103)>=0.)then
               z( 41)=1
            endif
      end select

!& algeq                 ! alignment equations

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq
   end select

end subroutine inj_IBG3s
