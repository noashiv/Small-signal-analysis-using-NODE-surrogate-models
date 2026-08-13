!  MODEL NAME : inj_BESS2               
!  MODEL DESCRIPTION FILE : BESS.txt
!  Data :
!       prm(  1)=  Imax
!       prm(  2)=  IN
!       prm(  3)=  Iprate
!       prm(  4)=  Tg
!       prm(  5)=  Tm
!       prm(  6)=  tLVRT1
!       prm(  7)=  tLVRT2
!       prm(  8)=  tLVRTint
!       prm(  9)=  Vmax
!       prm( 10)=  tau              ! response time of the PLL in milliseconds
!       prm( 11)=  Vminpll          ! Voltage magnitude under which the PLL is blocked
!       prm( 12)=  a
!       prm( 13)=  Vmin
!       prm( 14)=  Vint
!       prm( 15)=  fmin
!       prm( 16)=  fmax
!       prm( 17)=  Tr      ! Time after which units are allowed to reconnect to the network
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
!       prm( 35)=  Trocof                          ! delay for ROCOF measurement
!       prm( 36)=  dfmax                           ! maximum permissable ROCOF
!       prm( 37)=  SOCini				! initial state of charge, between 0 and 1
!       prm( 38)=  SOCmin				! lower and upper state of charge limits, between 0 and 1
!       prm( 39)=  SOCmax
!       prm( 40)=  Capacity			! capacity of battery in MWh
!       prm( 41)=  protection                      -1 to switch off, 1 to switch on
!       prm( 42)=  support
!  Parameters :
!       prm( 43)=  vxlv  
!       prm( 44)=  vylv  
!       prm( 45)=  Vref  
!       prm( 46)=  Pext  
!       prm( 47)=  Qext  
!       prm( 48)=  Iqref  
!       prm( 49)=  Ipref  
!       prm( 50)=  kpll  
!       prm( 51)=  theta_PLL  
!       prm( 52)=  Uplim  
!       prm( 53)=  Downlim  
!       prm( 54)=  Downlimdisc  
!       prm( 55)=  Uplimdis  
!       prm( 56)=  downlimdis  
!       prm( 57)=  ratemax  
!       prm( 58)=  rate  
!       prm( 59)=  fref  
!       prm( 60)=  Tlim  
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
!       x( 15)=  Ipmax                 
!       x( 16)=  Ipmin                 
!       x( 17)=  x4                    
!       x( 18)=  DeltaW                
!       x( 19)=  DeltaWf               
!       x( 20)=  vq                    
!       x( 21)=  vd                    
!       x( 22)=  Pgen                  
!       x( 23)=  Qgen                  
!       x( 24)=  Iqext                 
!       x( 25)=  Fvl                   
!       x( 26)=  Fvli                  
!       x( 27)=  Fvhi                  
!       x( 28)=  Fvh                   
!       x( 29)=  z1                    
!       x( 30)=  x5                    
!       x( 31)=  Iptemp                
!       x( 32)=  Iqtemp                
!       x( 33)=  x10                   
!       x( 34)=  x11                   
!       x( 35)=  z                     
!       x( 36)=  deltaV                
!       x( 37)=  Pflag                 
!       x( 38)=  Pflagi                
!       x( 39)=  vxlm                  
!       x( 40)=  vylm                  
!       x( 41)=  omegam                
!       x( 42)=  fm                    
!       x( 43)=  fmfilt                
!       x( 44)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 45)=  Ffl                   
!       x( 46)=  Ffhi                  
!       x( 47)=  Ffh                   
!       x( 48)=  Ptot                  
!       x( 49)=  deltafl               
!       x( 50)=  deltafh               
!       x( 51)=  mult                  
!       x( 52)=  deltaVPLL             
!       x( 53)=  wpll                  
!       x( 54)=  g                     
!       x( 55)=  tr                    
!       x( 56)=  Fr                    
!       x( 57)=  Frtemp                
!       x( 58)=  fvlb                  
!       x( 59)=  deltafvl              
!       x( 60)=  w1                    
!       x( 61)=  w2                    
!       x( 62)=  w3                    
!       x( 63)=  w4                    
!       x( 64)=  w5                    
!       x( 65)=  w6                    
!       x( 66)=  w7                    
!       x( 67)=  w8                    
!       x( 68)=  deltaf                
!       x( 69)=  rocof                 
!       x( 70)=  abrocof               
!       x( 71)=  deltarocof            
!       x( 72)=  Ffri                  
!       x( 73)=  Ffr                   
!       x( 74)=  status                
!       x( 75)=  p1                    
!       x( 76)=  p2                    
!       x( 77)=  p3                    
!       x( 78)=  s1                    
!       x( 79)=  SOC                   
!       x( 80)=  delta_Ebat            
!       x( 81)=  one                   
!       x( 82)=  zero                  
!       x( 83)=  deltaSOCl             
!       x( 84)=  deltaSOCh             
!       x( 85)=  BatEmpty              
!       x( 86)=  BatFul                

!.........................................................................................................

subroutine inj_BESS2(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 42
      nbaddpar= 18
      parname(  1)='Imax'
      parname(  2)='IN'
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
      parname( 17)='Tr'
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
      parname( 41)='protection'
      parname( 42)='support'
      parname( 43)='vxlv'
      parname( 44)='vylv'
      parname( 45)='Vref'
      parname( 46)='Pext'
      parname( 47)='Qext'
      parname( 48)='Iqref'
      parname( 49)='Ipref'
      parname( 50)='kpll'
      parname( 51)='theta_PLL'
      parname( 52)='Uplim'
      parname( 53)='Downlim'
      parname( 54)='Downlimdisc'
      parname( 55)='Uplimdis'
      parname( 56)='downlimdis'
      parname( 57)='ratemax'
      parname( 58)='rate'
      parname( 59)='fref'
      parname( 60)='Tlim'
      adix=  1
      adiy=  2
      nbxvar= 91
      nbzvar= 31

!........................................................................................
   case (define_obs)
      nbobs= 26
      obsname(  1)='Ip'
      obsname(  2)='Iq'
      obsname(  3)='Pgen'
      obsname(  4)='Qgen'
      obsname(  5)='Vm'
      obsname(  6)='PLLPhaseAngle'
      obsname(  7)='fmfilt'
      obsname(  8)='Fr'
      obsname(  9)='Fvh'
      obsname( 10)='Ffl'
      obsname( 11)='Ffh'
      obsname( 12)='Frtemp'
      obsname( 13)='Ipcmd'
      obsname( 14)='Vt'
      obsname( 15)='wpll'
      obsname( 16)='vq'
      obsname( 17)='rocof'
      obsname( 18)='status'
      obsname( 19)='Fvl'
      obsname( 20)='Ffr'
      obsname( 21)='SOC'
      obsname( 22)='BatEmpty'
      obsname( 23)='BatFul'
      obsname( 24)='delta_Ebat'
      obsname( 25)='Ipmax'
      obsname( 26)='Ipmin'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 22)              
      obs(  4)=x( 23)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 43)              
      obs(  8)=x( 56)              
      obs(  9)=x( 28)              
      obs( 10)=x( 45)              
      obs( 11)=x( 47)              
      obs( 12)=x( 57)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 53)              
      obs( 16)=x( 20)              
      obs( 17)=x( 69)              
      obs( 18)=x( 74)              
      obs( 19)=x( 25)              
      obs( 20)=x( 73)              
      obs( 21)=x( 79)              
      obs( 22)=x( 85)              
      obs( 23)=x( 86)              
      obs( 24)=x( 80)              
      obs( 25)=x( 15)              
      obs( 26)=x( 16)              

!........................................................................................
   case (initialize)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 43)= vx + prm( 18)*ix - prm( 19)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 44)= vy + prm( 18)*iy + prm( 19)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 45)= dsqrt(prm( 43)**2 + prm( 44)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 46)= -prm( 43)*ix-prm( 44)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 47)= +prm( 43)*iy-prm( 44)*ix

!Iqref = -{Qext}/{Vref}
      prm( 48)= -prm( 47)/prm( 45)

!Ipref = -{Pext}/{Vref}
      prm( 49)= -prm( 46)/prm( 45)

!kpll = 10/({tau}*0.001)
      prm( 50)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 51)= atan(prm( 44)/prm( 43))

!Uplim = 9999
      prm( 52)= 9999

!Downlim = -9999
      prm( 53)= -9999

!Downlimdisc = 0
      prm( 54)= 0

!Uplimdis = 0
      prm( 55)= 0

!downlimdis = -9999
      prm( 56)= -9999

!ratemax = {Iprate}*{IN}
      prm( 57)= prm(  3)*prm(  2)

!rate = 0.1
      prm( 58)= 0.1

!fref = 1
      prm( 59)= 1

!Tlim = 0.01
      prm( 60)= 0.01

!vxl =  {vxlv}
      x(  3)= prm( 43)

!vyl =  {vylv}
      x(  4)= prm( 44)

!Vt =  {Vref}
      x(  5)= prm( 45)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 51)

!Vm =  {Vref}
      x(  7)= prm( 45)

!x2 =  {Vref}
      x(  8)= prm( 45)

!Ip =  {Ipref}
      x(  9)= prm( 49)

!Iq =  {Iqref}
      x( 10)= prm( 48)

!Ipcmd =  {Ipref}
      x( 11)= prm( 49)

!Iqcmd =  {Iqref}
      x( 12)= prm( 48)

!Iqmax =  dsqrt({Imax}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm(  1)**2 - prm( 49)**2 )

!Iqmin =  - dsqrt({Imax}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm(  1)**2 - prm( 49)**2 )

!Ipmax =  {IN}
      x( 15)= prm(  2)

!Ipmin =  -{IN}
      x( 16)= -prm(  2)

!x4 =  {Ipref}
      x( 17)= prm( 49)

!DeltaW =  0
      x( 18)= 0

!DeltaWf =   0
      x( 19)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 20)= -prm( 43)*sin(prm( 51)) + prm( 44)*cos(prm( 51))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 21)= prm( 43)*cos(prm( 51)) + prm( 44)*sin(prm( 51))

!Pgen =  -{Pext}
      x( 22)= -prm( 46)

!Qgen =  -{Qext}
      x( 23)= -prm( 47)

!Iqext =  0
      x( 24)= 0

!Fvl =  1
      x( 25)= 1

!Fvli =  1
      x( 26)= 1

!Fvhi =  1
      x( 27)= 1

!Fvh =  1
      x( 28)= 1

!z1 =  0.
      x( 29)= 0.

!x5 =  {Iqref}
      x( 30)= prm( 48)

!Iptemp =  {Ipref}
      x( 31)= prm( 49)

!Iqtemp =  {Iqref}
      x( 32)= prm( 48)

!x10 =  -{Vref}
      x( 33)= -prm( 45)

!x11 =  {Vref} - {Vmax}
      x( 34)= prm( 45) - prm(  9)

!z =  0.
      x( 35)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 36)= prm( 45) - prm( 25)

!Pflag =  1
      x( 37)= 1

!Pflagi =  1
      x( 38)= 1

!vxlm =  {vxlv}
      x( 39)= prm( 43)

!vylm =  {vylv}
      x( 40)= prm( 44)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 41)= -0.5*(prm( 43)*sin(prm( 51)) - prm( 44)*cos(prm( 51))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 42)= 50*(-0.5*(prm( 43)*sin(prm( 51)) - prm( 44)*cos(prm( 51))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 43)= 50*(-0.5*(prm( 43)*sin(prm( 51)) - prm( 44)*cos(prm( 51))) + 1)

!Ffli =  1.
      x( 44)= 1.

!Ffl =  1.
      x( 45)= 1.

!Ffhi =  1.
      x( 46)= 1.

!Ffh =  1.
      x( 47)= 1.

!Ptot =  -{Pext}
      x( 48)= -prm( 46)

!deltafl =  50*[omega] - {fmin}
      x( 49)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 50)= prm( 16) - 50*omega

!mult =  1
      x( 51)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 52)= prm( 45) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 53)= -(prm( 43)*sin(prm( 51)) - prm( 44)*cos(prm( 51)))*prm( 50) + 2*pi*50

!g =  0
      x( 54)= 0

!tr =  0
      x( 55)= 0

!Fr =  1
      x( 56)= 1

!Frtemp =  1
      x( 57)= 1

!fvlb =  1
      x( 58)= 1

!deltafvl =  -{Tr}
      x( 59)= -prm( 17)

!w1 =  0
      x( 60)= 0

!w2 =  0
      x( 61)= 0

!w3 =  0
      x( 62)= 0

!w4 =  0
      x( 63)= 0

!w5 =  0
      x( 64)= 0

!w6 =  0
      x( 65)= 0

!w7 =  0
      x( 66)= 0

!w8 =  0
      x( 67)= 0

!deltaf =  0
      x( 68)= 0

!rocof =  0
      x( 69)= 0

!abrocof =  0
      x( 70)= 0

!deltarocof =  {dfmax} - 0
      x( 71)= prm( 36) - 0

!Ffri =  1
      x( 72)= 1

!Ffr =  1
      x( 73)= 1

!status =  1
      x( 74)= 1

!p1 =  {protection}
      x( 75)= prm( 41)

!p2 =  1
      x( 76)= 1

!p3 =  1
      x( 77)= 1

!s1 = {support}
      x( 78)=prm( 42)

!SOC =  {SOCini}
      x( 79)= prm( 37)

!delta_Ebat =  0.
      x( 80)= 0.

!one =  1.
      x( 81)= 1.

!zero =  0.
      x( 82)= 0.

!deltaSOCl =  -{SOCini}+{SOCmin}
      x( 83)= -prm( 37)+prm( 38)

!deltaSOCh =  -{SOCmax}+{SOCini}
      x( 84)= -prm( 39)+prm( 37)

!BatEmpty =  0.
      x( 85)= 0.

!BatFul =  0.
      x( 86)= 0.

!& algeq				! voltage drop over line that connects PV, vxl is after impedance
      eqtyp(  1)=0

!& algeq
      eqtyp(  2)=0

!& algeq				! voltage magnitude at PV
      eqtyp(  3)=0

!& tf1p                          ! voltage measurement
      eqtyp(  4)=  7
      tc(  4)=prm(  5)

!& max1v1c			! maximum between voltage and 0.01
      eqtyp(  5)=0
      if(x(  7)<0.01)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq                         ! current computation
      eqtyp(  6)=0

!& limvb				! limit current Ipcmd
      eqtyp(  7)=0
      if(x( 17)>x( 15))then
         z(  2)=1
      elseif(x( 17)<x( 16))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq             ! compute status	
      eqtyp(  8)=0

!& algeq
      eqtyp(  9)=0

!& algeq
      eqtyp( 10)=0

!& swsign
      eqtyp( 11)=0
      if(x( 75)>=0.)then
         z(  3)=1
      else
         z(  3)=2
      endif

!& algeq                     ! current computation
      eqtyp( 12)=0

!& tf1p2lim			! temporary current is
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 53)=-huge(0.d0)
         prm( 52)= huge(0.d0)
         prm( 53)=-huge(0.d0)
         prm( 57)= huge(0.d0)
      endif
      if(1*x( 11)-x( 31)>prm( 57)*prm(  4))then
         z(  4)=1
      elseif(1*x( 11)-x( 31)<prm( 53)*prm(  4))then
         z(  4)=-1
      else
         z(  4)=0
      endif
      eqtyp( 13)=0
      if(x( 31)>prm( 52))then
         z(  5)=1
         eqtyp( 14)=0
      elseif(x( 31)<prm( 53))then
         z(  5)=-1
         eqtyp( 14)=0
      else
         z(  5)=0
         eqtyp( 14)= 31
      endif
      tc( 14)=prm(  4)

!& algeq                     ! include reactive current priority
      eqtyp( 15)=0

!& algeq
      eqtyp( 16)=0

!& algeq
      eqtyp( 17)=0

!& limvb
      eqtyp( 18)=0
      if(x( 30)>x( 13))then
         z(  6)=1
      elseif(x( 30)<x( 14))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq
      eqtyp( 19)=0

!& tf1p
      eqtyp( 20)= 32
      tc( 20)=prm(  4)

!& algeq			! active current limit, maximum current with reactive current priority
      eqtyp( 21)=0

!& algeq         ! active current minimum limit
      eqtyp( 22)=0

!& db                    ! Voltage support        	
      eqtyp( 23)=0
      if(x(  7)>prm( 26))then
         z(  7)=1
      elseif(x(  7)<prm( 25))then
         z(  7)=-1
      else
         z(  7)=0
      endif

!& algeq               !LVRT
      eqtyp( 24)=0

!& timer5
      eqtyp( 25)=0
      eqtyp( 26)=0
      z(  8)=-1
      x( 88)=0.

!& algeq
      eqtyp( 27)=0

!& hyst
      eqtyp( 28)=0
      if(x( 26)>1.1)then
         z(  9)=1
      elseif(x( 26)<0.9)then
         z(  9)=-1
      else
         if(1.>= 0.)then
            z(  9)=1
         else
            z(  9)=-1
         endif
      endif

!& algeq
      eqtyp( 29)=0

!& inlim
      if (1>= 0.005)then
         tc( 30)=1
      endif
      if (x( 55)>5)then
         z( 10)=1
         eqtyp( 30)=0
      elseif (x( 55)<0.) then
         z( 10)=-1
         eqtyp( 30)=0
      else
         z( 10)=0
         if (1>= 0.005)then
            eqtyp( 30)= 55
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
      if(x( 59)>=0.)then
         z( 11)=1
      else
         z( 11)=2
      endif

!& tf1p2lim
      if(prm( 60)< 0.001)then
         prm( 60)=0.d0
         prm( 54)=-huge(0.d0)
         prm( 52)= huge(0.d0)
         prm( 53)=-huge(0.d0)
         prm( 58)= huge(0.d0)
      endif
      if(1*x( 57)-x( 56)>prm( 58)*prm( 60))then
         z( 12)=1
      elseif(1*x( 57)-x( 56)<prm( 53)*prm( 60))then
         z( 12)=-1
      else
         z( 12)=0
      endif
      eqtyp( 34)=0
      if(x( 56)>prm( 52))then
         z( 13)=1
         eqtyp( 35)=0
      elseif(x( 56)<prm( 54))then
         z( 13)=-1
         eqtyp( 35)=0
      else
         z( 13)=0
         eqtyp( 35)= 56
      endif
      tc( 35)=prm( 60)

!& algeq             ! overvoltage protection
      eqtyp( 36)=0

!& pwlin4
      eqtyp( 37)=0
      if(x( 34)<(-999))then
         z( 14)=1
      elseif(x( 34)>=999)then
         z( 14)=   3
      elseif((-999)<=x( 34) .and. x( 34)<0.)then
         z( 14)=  1
      elseif(0.<=x( 34) .and. x( 34)<0.)then
         z( 14)=  2
      elseif(0.<=x( 34) .and. x( 34)<999)then
         z( 14)=  3
      endif

!& algeq
      eqtyp( 38)=0

!& hyst
      eqtyp( 39)=0
      if(x( 27)>1.1)then
         z( 15)=1
      elseif(x( 27)<0.9)then
         z( 15)=-1
      else
         if(1.>= 0.)then
            z( 15)=1
         else
            z( 15)=-1
         endif
      endif

!& algeq                     ! reactive current priority during undervoltage
      eqtyp( 40)=0

!& swsign
      eqtyp( 41)=0
      if(x( 36)>=0.)then
         z( 16)=1
      else
         z( 16)=2
      endif

!& algeq             ! switch support on and off
      eqtyp( 42)=0

!& swsign            ! switch support off
      eqtyp( 43)=0
      if(x( 78)>=0.)then
         z( 17)=1
      else
         z( 17)=2
      endif

!& algeq	!PLL
      eqtyp( 44)=0

!& swsign
      eqtyp( 45)=0
      if(x( 52)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 46)=0
      else
         eqtyp( 46)=  6
         tc( 46)=1.
      endif

!& pictl
      eqtyp( 47)= 90
      x( 90)=x( 53)
      eqtyp( 48)=0

!& algeq
      eqtyp( 49)=0

!& algeq
      eqtyp( 50)=0

!& tf1p
      eqtyp( 51)= 39
      tc( 51)=prm(  5)

!& tf1p
      eqtyp( 52)= 40
      tc( 52)=prm(  5)

!& algeq             ! frequency measurement
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& tf1p
      eqtyp( 55)= 43
      tc( 55)=0.1

!& algeq     	! frequency protection
      eqtyp( 56)=0

!& swsign
      eqtyp( 57)=0
      if(x( 49)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& algeq
      eqtyp( 58)=0

!& swsign
      eqtyp( 59)=0
      if(x( 50)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& hyst
      eqtyp( 60)=0
      if(x( 44)>1.1)then
         z( 21)=1
      elseif(x( 44)<0.9)then
         z( 21)=-1
      else
         if(1.>= 0.)then
            z( 21)=1
         else
            z( 21)=-1
         endif
      endif

!& hyst
      eqtyp( 61)=0
      if(x( 46)>1.1)then
         z( 22)=1
      elseif(x( 46)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control
      eqtyp( 62)=0

!& db
      eqtyp( 63)=0
      if(x( 60)>prm( 32))then
         z( 23)=1
      elseif(x( 60)<prm( 31))then
         z( 23)=-1
      else
         z( 23)=0
      endif

!& algeq
      eqtyp( 64)=0

!& algeq
      eqtyp( 65)=0

!& lim
      eqtyp( 66)=0
      if(x( 62)>(-0.00001))then
         z( 24)=1
      elseif(x( 62)<(-99999.))then
         z( 24)=-1
      else
         z( 24)=0
      endif

!& lim
      eqtyp( 67)=0
      if(x( 63)>99999.)then
         z( 25)=1
      elseif(x( 63)<0.00001)then
         z( 25)=-1
      else
         z( 25)=0
      endif

!& algeq
      eqtyp( 68)=0

!& swsign            ! switch support off
      eqtyp( 69)=0
      if(x( 78)>=0.)then
         z( 26)=1
      else
         z( 26)=2
      endif

!& algeq
      eqtyp( 70)=0

!& algeq             ! alignment
      eqtyp( 71)=0

!& algeq
      eqtyp( 72)=0

!& algeq
      eqtyp( 73)=0

!& algeq
      eqtyp( 74)=0

!& algeq
      eqtyp( 75)=0

!& algeq
      eqtyp( 76)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 77)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x( 91)=x( 68)
      eqtyp( 78)= 91
      tc( 78)=prm( 35)
      eqtyp( 79)=0

!& abs
      eqtyp( 80)=0
      if(x( 69)>0. )then
         z( 27)=1
      else
         z( 27)=-1
      endif

!& algeq 		 ! Rocof protection
      eqtyp( 81)=0

!& swsign
      eqtyp( 82)=0
      if(x( 71)>=0.)then
         z( 28)=1
      else
         z( 28)=2
      endif

!& hyst
      eqtyp( 83)=0
      if(x( 72)>1.1)then
         z( 29)=1
      elseif(x( 72)<0.9)then
         z( 29)=-1
      else
         if(1.>= 0.)then
            z( 29)=1
         else
            z( 29)=-1
         endif
      endif

!& int		! Change of Energy in Battery
      if (3600< 0.005)then
         eqtyp( 84)=0
      else
         eqtyp( 84)= 80
         tc( 84)=3600
      endif

!& algeq		! SOC
      eqtyp( 85)=0

!& algeq
      eqtyp( 86)=0

!& swsign
      eqtyp( 87)=0
      if(x( 83)>=0.)then
         z( 30)=1
      else
         z( 30)=2
      endif

!& algeq
      eqtyp( 88)=0

!& swsign
      eqtyp( 89)=0
      if(x( 84)>=0.)then
         z( 31)=1
      else
         z( 31)=2
      endif

!& algeq
      eqtyp( 90)=0

!& algeq
      eqtyp( 91)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq				! voltage drop over line that connects PV, vxl is after impedance
      f(  1)=vx + prm( 18)*x(  1) - prm( 19)*x(  2) - x(  3)

!& algeq
      f(  2)=vy + prm( 18)*x(  2) + prm( 19)*x(  1) - x(  4)

!& algeq				! voltage magnitude at PV
      f(  3)=x(  5) - dsqrt(x(  3)**2 + x(  4)**2)

!& tf1p                          ! voltage measurement
      f(  4)=(-x(  7)+1.*x(  5))

!& max1v1c			! maximum between voltage and 0.01
      select case (z(  1))
         case(1)
            f(  5)=0.01-x(  8)
         case(2)
            f(  5)=x(  7)-x(  8)
      end select

!& algeq                         ! current computation
      f(  6)=x( 48)/x(  8) - x( 17)

!& limvb				! limit current Ipcmd
      select case (z(  2))
         case(0)
            f(  7)=x( 11)-x( 17)
         case(-1)
            f(  7)=x( 11)-x( 16)
         case(1)
            f(  7)=x( 11)-x( 15)
      end select

!& algeq             ! compute status	
      f(  8)=x( 76) - x( 28)*x( 45)*x( 47)*x( 73)*x( 56)

!& algeq
      f(  9)=x( 75) - prm( 41)

!& algeq
      f( 10)=x( 77) - 1

!& swsign
      select case (z(  3))
         case(1)
            f( 11)=x( 74)-x( 76)
         case(2)
            f( 11)=x( 74)-x( 77)
      end select

!& algeq                     ! current computation
      f( 12)=x( 31)*x( 74) - x(  9)

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            f( 13)=x( 87)-1*x( 11)+x( 31)
         case(1)
            f( 13)=x( 87)-prm( 57)*prm(  4)
         case(-1)
            f( 13)=x( 87)-prm( 53)*prm(  4)
      end select
      select case (z(  5))
         case(0)
            f( 14)=x( 87)
         case(1)
            f( 14)=x( 31)-prm( 52)
         case(-1)
            f( 14)=x( 31)-prm( 53)
      end select

!& algeq                     ! include reactive current priority
      f( 15)=x( 13) -x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) - (1-x( 37))*(prm( 29)*prm(  1)*0.707 + (1-prm( 29))*prm(  1))

!& algeq
      f( 16)=x( 14) + x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) + (1-x( 37))*prm(  1)

!& algeq
      f( 17)=-x( 24) + prm( 48) - x( 30)

!& limvb
      select case (z(  6))
         case(0)
            f( 18)=x( 12)-x( 30)
         case(-1)
            f( 18)=x( 12)-x( 14)
         case(1)
            f( 18)=x( 12)-x( 13)
      end select

!& algeq
      f( 19)=x( 32)*x( 74) - x( 10)

!& tf1p
      f( 20)=(-x( 32)+1.*x( 12))

!& algeq			! active current limit, maximum current with reactive current priority
      f( 21)=x( 15) - (x( 37)*prm(  2) +  (1-x( 37))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2)))*(1-x( 85))

!& algeq         ! active current minimum limit
      f( 22)=x( 16) + (x( 37)*prm(  2) +  (1-x( 37))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2)))*(1-x( 85))

!& db                    ! Voltage support        	
      select case (z(  7))
         case(0)
            f( 23)=x( 24)
         case(-1)
            f( 23)=x( 24)-(-prm( 23)*prm(  1)*(prm( 20) + prm( 29)))-(prm( 21)*prm(  1)*(prm( 20) + prm( 29) ))*(x(  7)-prm( 25))
         case(1)
            f( 23)=x( 24)-prm( 24)*prm(  1)-prm( 22)*prm(  1)*prm( 27)*(x(  7)-prm( 26))
      end select

!& algeq               !LVRT
      f( 24)=x(  7) + x( 33)

!& timer5
      select case (z(  8))
         case (-1)
            f( 25)=x( 35)
            f( 26)=x( 88)
         case (0)
            f( 25)=x( 35)
            f( 26)= 1.
         case (1)
            f( 25)=x( 35)-1.
            f( 26)= 0.
      end select

!& algeq
      f( 27)=x( 26) -1 + x( 35)

!& hyst
      if(z(  9) == 1)then
         f( 28)=x( 25)-1.-(1.-1.)*(x( 26)-1.1)/(1.1-0.9)
      else
         f( 28)=x( 25)-0.-(0.-0.)*(x( 26)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 29)=x( 54) - 1 + x( 25)

!& inlim
      if (1>= 0.005)then
         select case (z( 10))
            case(0)
               f( 30)=x( 54)
            case(1)
               f( 30)=x( 55)-5
            case(-1)
               f( 30)=x( 55)-0.
         end select
      else
         select case (z( 10))
            case(0)
               f( 30)=x( 54)-x( 55)
            case(1)
               f( 30)=x( 55)-5
            case(-1)
               f( 30)=x( 55)-0.
         end select
      endif

!& algeq
      f( 31)=x( 58) - 1 + x( 54)

!& algeq
      f( 32)=x( 59) + prm( 17) - x( 55)

!& swsign
      select case (z( 11))
         case(1)
            f( 33)=x( 57)-x( 81)
         case(2)
            f( 33)=x( 57)-x( 58)
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            f( 34)=x( 89)-1*x( 57)+x( 56)
         case(1)
            f( 34)=x( 89)-prm( 58)*prm( 60)
         case(-1)
            f( 34)=x( 89)-prm( 53)*prm( 60)
      end select
      select case (z( 13))
         case(0)
            f( 35)=x( 89)
         case(1)
            f( 35)=x( 56)-prm( 52)
         case(-1)
            f( 35)=x( 56)-prm( 54)
      end select

!& algeq             ! overvoltage protection
      f( 36)=x( 34) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 14))
         case (  1)
            f( 37)=0.+ ( (0.-0.)*(x( 34)-(-999))/(0.-(-999)) ) -x( 29)
         case (  2)
            f( 37)=0.+ ( (1.-0.)*(x( 34)-0.)/(0.-0.) ) -x( 29)
         case (  3)
            f( 37)=1.+ ( (1.-1.)*(x( 34)-0.)/(999-0.) ) -x( 29)
      end select

!& algeq
      f( 38)=x( 27) -1 + x( 29)

!& hyst
      if(z( 15) == 1)then
         f( 39)=x( 28)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 39)=x( 28)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq                     ! reactive current priority during undervoltage
      f( 40)=x( 36) - x(  7) + prm( 25)

!& swsign
      select case (z( 16))
         case(1)
            f( 41)=x( 38)-x( 81)
         case(2)
            f( 41)=x( 38)-x( 82)
      end select

!& algeq             ! switch support on and off
      f( 42)=x( 78) - prm( 42)

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            f( 43)=x( 37)-x( 38)
         case(2)
            f( 43)=x( 37)-x( 81)
      end select

!& algeq	!PLL
      f( 44)=x( 52) - x(  7) + prm( 11)

!& swsign
      select case (z( 18))
         case(1)
            f( 45)=x( 51)-x( 81)
         case(2)
            f( 45)=x( 51)-x( 82)
      end select

!& int
      if (1.< 0.005)then
         f( 46)=x( 19)-x(  6)
      else
         f( 46)=x( 19)
      endif

!& pictl
      f( 47)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 20)
      f( 48)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 20)+x( 90)-x( 53)

!& algeq
      f( 49)=x( 18) - x( 53) + omega*2*pi*50

!& algeq
      f( 50)=x( 19) - x( 18)*x( 51)

!& tf1p
      f( 51)=(-x( 39)+1.*x(  3))

!& tf1p
      f( 52)=(-x( 40)+1.*x(  4))

!& algeq             ! frequency measurement
      f( 53)=x( 41) - x( 53)/(2*pi*50)

!& algeq
      f( 54)=x( 42) - 50*x( 41)

!& tf1p
      f( 55)=(-x( 43)+1.*x( 42))

!& algeq     	! frequency protection
      f( 56)=x( 49) - x( 43) + prm( 15)

!& swsign
      select case (z( 19))
         case(1)
            f( 57)=x( 44)-x( 81)
         case(2)
            f( 57)=x( 44)-x( 82)
      end select

!& algeq
      f( 58)=x( 50) - prm( 16) + x( 43)

!& swsign
      select case (z( 20))
         case(1)
            f( 59)=x( 46)-x( 81)
         case(2)
            f( 59)=x( 46)-x( 82)
      end select

!& hyst
      if(z( 21) == 1)then
         f( 60)=x( 45)-1.-(1.-1.)*(x( 44)-1.1)/(1.1-0.9)
      else
         f( 60)=x( 45)-0.-(0.-0.)*(x( 44)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 22) == 1)then
         f( 61)=x( 47)-1.-(1.-1.)*(x( 46)-1.1)/(1.1-0.9)
      else
         f( 61)=x( 47)-0.-(0.-0.)*(x( 46)-0.9)/(1.1-0.9)
      endif

!& algeq                 ! frequency droop control
      f( 62)=x( 60) + (x( 43)/50) - prm( 59)

!& db
      select case (z( 23))
         case(0)
            f( 63)=x( 61)
         case(-1)
            f( 63)=x( 61)-0.-1.*(x( 60)-prm( 31))
         case(1)
            f( 63)=x( 61)-0.-1.*(x( 60)-prm( 32))
      end select

!& algeq
      f( 64)=x( 62) - x( 61)*prm( 34)

!& algeq
      f( 65)=x( 63) - x( 61)*prm( 33)

!& lim
      select case (z( 24))
         case(0)
            f( 66)=x( 64)-x( 62)
         case(-1)
            f( 66)=x( 64)-(-99999.)
         case(1)
            f( 66)=x( 64)-(-0.00001)
      end select

!& lim
      select case (z( 25))
         case(0)
            f( 67)=x( 65)-x( 63)
         case(-1)
            f( 67)=x( 65)-0.00001
         case(1)
            f( 67)=x( 65)-99999.
      end select

!& algeq
      f( 68)=x( 66)-x( 65)-x( 64)

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            f( 69)=x( 67)-x( 66)
         case(2)
            f( 69)=x( 67)-x( 82)
      end select

!& algeq
      f( 70)=x( 48)+prm( 46)-x( 67)

!& algeq             ! alignment
      f( 71)=x( 21) - x( 39)*cos(x(  6)) - x( 40)*sin(x(  6))

!& algeq
      f( 72)=x( 20) + x( 39)*sin(x(  6)) - x( 40)*cos(x(  6))

!& algeq
      f( 73)=x( 22) - x( 21)*x(  9)

!& algeq
      f( 74)=x( 23) - x( 21)*x( 10)

!& algeq
      f( 75)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f( 76)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!& algeq                ! frequency deviation in Hz
      f( 77)=-x( 68) + x( 43)-prm( 59)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 78)=-x( 91)+x( 68)
      if (prm( 35)< 0.005)then
         f( 79)=1/prm( 35)*x( 68)-x( 69)
      else
         f( 79)=1/prm( 35)*(x( 68)-x( 91))-x( 69)
      endif

!& abs
      if(z( 27) == 1 )then
         f( 80)=x( 70)-x( 69)
      else
         f( 80)=x( 70)+x( 69)
      endif

!& algeq 		 ! Rocof protection
      f( 81)=-x( 71) +prm( 36) -x( 70)

!& swsign
      select case (z( 28))
         case(1)
            f( 82)=x( 72)-x( 81)
         case(2)
            f( 82)=x( 72)-x( 82)
      end select

!& hyst
      if(z( 29) == 1)then
         f( 83)=x( 73)-1.-(1.-1.)*(x( 72)-1.1)/(1.1-0.9)
      else
         f( 83)=x( 73)-0.-(0.-0.)*(x( 72)-0.9)/(1.1-0.9)
      endif

!& int		! Change of Energy in Battery
      if (3600< 0.005)then
         f( 84)=x( 22)-x( 80)
      else
         f( 84)=x( 22)
      endif

!& algeq		! SOC
      f( 85)=-x( 79) + prm( 37) - x( 80)/(prm( 40))

!& algeq
      f( 86)=x( 83) + x( 79) - prm( 38)

!& swsign
      select case (z( 30))
         case(1)
            f( 87)=x( 85)-x( 81)
         case(2)
            f( 87)=x( 85)-x( 82)
      end select

!& algeq
      f( 88)=x( 84) + prm( 39) - x( 79)

!& swsign
      select case (z( 31))
         case(1)
            f( 89)=x( 86)-x( 81)
         case(2)
            f( 89)=x( 86)-x( 82)
      end select

!& algeq
      f( 90)=x( 81)-1

!& algeq
      f( 91)=x( 82)

!........................................................................................
   case (update_disc)

!& algeq				! voltage drop over line that connects PV, vxl is after impedance

!& algeq

!& algeq				! voltage magnitude at PV

!& tf1p                          ! voltage measurement

!& max1v1c			! maximum between voltage and 0.01
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

!& algeq                         ! current computation

!& limvb				! limit current Ipcmd
      select case (z(  2))
         case(0)
            if(x( 17)>x( 15))then
               z(  2)=1
            elseif(x( 17)<x( 16))then
               z(  2)=-1
            endif
         case(-1)
            if(x( 17)>x( 16))then
               z(  2)=0
            endif
         case(1)
            if(x( 17)<x( 15))then
               z(  2)=0
            endif
      end select

!& algeq             ! compute status	

!& algeq

!& algeq

!& swsign
      select case (z(  3))
         case(1)
            if(x( 75)<0.)then
               z(  3)=2
            endif
         case(2)
            if(x( 75)>=0.)then
               z(  3)=1
            endif
      end select

!& algeq                     ! current computation

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            if(x( 87)>prm( 57)*prm(  4))then
               z(  4)=1
            elseif(x( 87)<prm( 53)*prm(  4))then
               z(  4)=-1
            endif
         case(1)
            if(1*x( 11)-x( 31)<prm( 57)*prm(  4))then
               z(  4)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 31)>prm( 53)*prm(  4))then
               z(  4)= 0
            endif
      end select
      select case (z(  5))
         case(0)
            if(x( 31)>prm( 52))then
               z(  5)=1
               eqtyp( 14)=0
            elseif(x( 31)<prm( 53))then
               z(  5)=-1
               eqtyp( 14)=0
            endif
         case(1)
            if (x( 87)<0.)then
               z(  5)= 0
               eqtyp( 14)= 31
            endif
         case(-1)
            if(x( 87)>0.)then
               z(  5)= 0
               eqtyp( 14)= 31
            endif
      end select

!& algeq                     ! include reactive current priority

!& algeq

!& algeq

!& limvb
      select case (z(  6))
         case(0)
            if(x( 30)>x( 13))then
               z(  6)=1
            elseif(x( 30)<x( 14))then
               z(  6)=-1
            endif
         case(-1)
            if(x( 30)>x( 14))then
               z(  6)=0
            endif
         case(1)
            if(x( 30)<x( 13))then
               z(  6)=0
            endif
      end select

!& algeq

!& tf1p

!& algeq			! active current limit, maximum current with reactive current priority

!& algeq         ! active current minimum limit

!& db                    ! Voltage support        	
      select case (z(  7))
         case(0)
            if(x(  7)>prm( 26))then
               z(  7)=1
            elseif(x(  7)<prm( 25))then
               z(  7)=-1
            endif
         case(-1)
            if(x(  7)>prm( 25))then
               z(  7)=0
            endif
         case(1)
            if(x(  7)<prm( 26))then
               z(  7)=0
            endif
      end select

!& algeq               !LVRT

!& timer5
      if(z(  8) == -1)then
         if(x( 33) >= (-prm( 12)))then
            z(  8)=0
            eqtyp( 26)= 88
         endif
      else
         if(x( 33) < (-prm( 12)))then
            z(  8)=-1
            eqtyp( 26)=0
         endif
      endif
      if(z(  8) == 0)then
         if(x( 33) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 88) > 0.)then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 88) > prm(  6)+(0.-prm(  6))*(x( 33)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 88) > prm(  6)+(prm(  6)-prm(  6))*(x( 33)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 88) > prm(  8)+(prm(  6)-prm(  8))*(x( 33)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-prm( 12)))then
            if(x( 88) > prm(  7)+(prm(  8)-prm(  7))*(x( 33)-(-prm( 12)))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-prm( 12))))then
               z(  8)=1
            endif
         endif
      endif

!& algeq

!& hyst
      if (z(  9) == -1)then
         if(x( 26)>1.1)then
            z(  9)=1
         endif
      else
         if(x( 26)<0.9)then
            z(  9)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 10))
            case(0)
               if(x( 55)<0.)then
                  z( 10)=-1
                  eqtyp( 30)=0
               elseif(x( 55)>5)then
                  z( 10)= 1
                  eqtyp( 30)=0
               endif
            case(1)
               if(x( 54)<0.)then
                  z( 10)=0
                  eqtyp( 30)= 55
               endif
            case(-1)
               if(x( 54)>0.)then
                  z( 10)=0
                  eqtyp( 30)= 55
               endif
         end select
      else
         select case (z( 10))
            case(0)
               if(x( 55)<0.)then
                  z( 10)=-1
               elseif(x( 55)>5)then
                  z( 10)= 1
               endif
            case(1)
               if(x( 54)<5)then
                  z( 10)=0
               endif
            case(-1)
               if(x( 54)>0.)then
                  z( 10)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 11))
         case(1)
            if(x( 59)<0.)then
               z( 11)=2
            endif
         case(2)
            if(x( 59)>=0.)then
               z( 11)=1
            endif
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            if(x( 89)>prm( 58)*prm( 60))then
               z( 12)=1
            elseif(x( 89)<prm( 53)*prm( 60))then
               z( 12)=-1
            endif
         case(1)
            if(1*x( 57)-x( 56)<prm( 58)*prm( 60))then
               z( 12)= 0
            endif
         case(-1)
            if(1*x( 57)-x( 56)>prm( 53)*prm( 60))then
               z( 12)= 0
            endif
      end select
      select case (z( 13))
         case(0)
            if(x( 56)>prm( 52))then
               z( 13)=1
               eqtyp( 35)=0
            elseif(x( 56)<prm( 54))then
               z( 13)=-1
               eqtyp( 35)=0
            endif
         case(1)
            if (x( 89)<0.)then
               z( 13)= 0
               eqtyp( 35)= 56
            endif
         case(-1)
            if(x( 89)>0.)then
               z( 13)= 0
               eqtyp( 35)= 56
            endif
      end select

!& algeq             ! overvoltage protection

!& pwlin4
      if(x( 34)<(-999))then
         z( 14)=1
      elseif(x( 34)>=999)then
         z( 14)=  3
      elseif((-999)<=x( 34) .and. x( 34)<0.)then
         z( 14)=  1
      elseif(0.<=x( 34) .and. x( 34)<0.)then
         z( 14)=  2
      elseif(0.<=x( 34) .and. x( 34)<999)then
         z( 14)=  3
      endif

!& algeq

!& hyst
      if (z( 15) == -1)then
         if(x( 27)>1.1)then
            z( 15)=1
         endif
      else
         if(x( 27)<0.9)then
            z( 15)=-1
         endif
      endif

!& algeq                     ! reactive current priority during undervoltage

!& swsign
      select case (z( 16))
         case(1)
            if(x( 36)<0.)then
               z( 16)=2
            endif
         case(2)
            if(x( 36)>=0.)then
               z( 16)=1
            endif
      end select

!& algeq             ! switch support on and off

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            if(x( 78)<0.)then
               z( 17)=2
            endif
         case(2)
            if(x( 78)>=0.)then
               z( 17)=1
            endif
      end select

!& algeq	!PLL

!& swsign
      select case (z( 18))
         case(1)
            if(x( 52)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 52)>=0.)then
               z( 18)=1
            endif
      end select

!& int

!& pictl

!& algeq

!& algeq

!& tf1p

!& tf1p

!& algeq             ! frequency measurement

!& algeq

!& tf1p

!& algeq     	! frequency protection

!& swsign
      select case (z( 19))
         case(1)
            if(x( 49)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 49)>=0.)then
               z( 19)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 20))
         case(1)
            if(x( 50)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 50)>=0.)then
               z( 20)=1
            endif
      end select

!& hyst
      if (z( 21) == -1)then
         if(x( 44)>1.1)then
            z( 21)=1
         endif
      else
         if(x( 44)<0.9)then
            z( 21)=-1
         endif
      endif

!& hyst
      if (z( 22) == -1)then
         if(x( 46)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 46)<0.9)then
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control

!& db
      select case (z( 23))
         case(0)
            if(x( 60)>prm( 32))then
               z( 23)=1
            elseif(x( 60)<prm( 31))then
               z( 23)=-1
            endif
         case(-1)
            if(x( 60)>prm( 31))then
               z( 23)=0
            endif
         case(1)
            if(x( 60)<prm( 32))then
               z( 23)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 24))
         case(0)
            if(x( 62)>(-0.00001))then
               z( 24)=1
            elseif(x( 62)<(-99999.))then
               z( 24)=-1
            endif
         case(-1)
            if(x( 62)>(-99999.))then
               z( 24)=0
            endif
         case(1)
            if(x( 62)<(-0.00001))then
               z( 24)=0
            endif
      end select

!& lim
      select case (z( 25))
         case(0)
            if(x( 63)>99999.)then
               z( 25)=1
            elseif(x( 63)<0.00001)then
               z( 25)=-1
            endif
         case(-1)
            if(x( 63)>0.00001)then
               z( 25)=0
            endif
         case(1)
            if(x( 63)<99999.)then
               z( 25)=0
            endif
      end select

!& algeq

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            if(x( 78)<0.)then
               z( 26)=2
            endif
         case(2)
            if(x( 78)>=0.)then
               z( 26)=1
            endif
      end select

!& algeq

!& algeq             ! alignment

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 27) == -1 )then
         if(x( 69)> blocktol1 )then
            z( 27)=1
         endif
      else
         if(x( 69)< - blocktol1 )then
            z( 27)=-1
         endif
      endif

!& algeq 		 ! Rocof protection

!& swsign
      select case (z( 28))
         case(1)
            if(x( 71)<0.)then
               z( 28)=2
            endif
         case(2)
            if(x( 71)>=0.)then
               z( 28)=1
            endif
      end select

!& hyst
      if (z( 29) == -1)then
         if(x( 72)>1.1)then
            z( 29)=1
         endif
      else
         if(x( 72)<0.9)then
            z( 29)=-1
         endif
      endif

!& int		! Change of Energy in Battery

!& algeq		! SOC

!& algeq

!& swsign
      select case (z( 30))
         case(1)
            if(x( 83)<0.)then
               z( 30)=2
            endif
         case(2)
            if(x( 83)>=0.)then
               z( 30)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 31))
         case(1)
            if(x( 84)<0.)then
               z( 31)=2
            endif
         case(2)
            if(x( 84)>=0.)then
               z( 31)=1
            endif
      end select

!& algeq

!& algeq
   end select

end subroutine inj_BESS2
