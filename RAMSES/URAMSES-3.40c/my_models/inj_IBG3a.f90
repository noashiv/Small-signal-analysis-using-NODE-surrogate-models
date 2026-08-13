!  MODEL NAME : inj_IBG3a               
!  MODEL DESCRIPTION FILE : IBG3a.txt
!  Data :
!       prm(  1)=  PMPP
!       prm(  2)=  PN
!       prm(  3)=  Iprate
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
!       prm( 34)=  Trocof
!       prm( 35)=  dfmax
!  Parameters :
!       prm( 36)=  IN  
!       prm( 37)=  vxlv  
!       prm( 38)=  vylv  
!       prm( 39)=  Vref  
!       prm( 40)=  Pext  
!       prm( 41)=  Qext  
!       prm( 42)=  Iqref  
!       prm( 43)=  Ipref  
!       prm( 44)=  kpll  
!       prm( 45)=  theta_PLL  
!       prm( 46)=  Uplim  
!       prm( 47)=  Downlim  
!       prm( 48)=  Downlimdisc  
!       prm( 49)=  UplimdeltaP  
!       prm( 50)=  DownlimdeltaP  
!       prm( 51)=  Tlim  
!       prm( 52)=  Uplimdis  
!       prm( 53)=  downlimdis  
!       prm( 54)=  ratemax  
!       prm( 55)=  rate  
!       prm( 56)=  rateh  
!       prm( 57)=  fref  
!       prm( 58)=  Snom  
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
!       x( 37)=  vxlm                  
!       x( 38)=  vylm                  
!       x( 39)=  omegam                
!       x( 40)=  fm                    
!       x( 41)=  fmfilt                
!       x( 42)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 43)=  Ffl                   
!       x( 44)=  Ffhi                  
!       x( 45)=  Ffh                   
!       x( 46)=  Ptot                  
!       x( 47)=  deltafl               
!       x( 48)=  deltafh               
!       x( 49)=  mult                  
!       x( 50)=  deltaVPLL             
!       x( 51)=  wpll                  
!       x( 52)=  g                     
!       x( 53)=  tr                    
!       x( 54)=  Fr                    
!       x( 55)=  Frtemp                
!       x( 56)=  fvlb                  
!       x( 57)=  deltafvl              
!       x( 58)=  g1                    
!       x( 59)=  tr1                   
!       x( 60)=  Frvh                  
!       x( 61)=  Frvhtemp              
!       x( 62)=  fvhb                  
!       x( 63)=  deltafvh              
!       x( 64)=  g2                    
!       x( 65)=  tr2                   
!       x( 66)=  Frfl                  
!       x( 67)=  Frfltemp              
!       x( 68)=  fflb                  
!       x( 69)=  deltaffl              
!       x( 70)=  g3                    
!       x( 71)=  tr3                   
!       x( 72)=  Frfh                  
!       x( 73)=  Frfhtemp              
!       x( 74)=  ffhb                  
!       x( 75)=  deltaffh              
!       x( 76)=  w1                    
!       x( 77)=  w2                    
!       x( 78)=  Frvhtemp1             
!       x( 79)=  one                   
!       x( 80)=  zero                  
!       x( 81)=  status                
!       x( 82)=  deltaf                
!       x( 83)=  rocof                 
!       x( 84)=  abrocof               
!       x( 85)=  deltarocof            
!       x( 86)=  Ffri                  
!       x( 87)=  Ffr                   
!       x( 88)=  g4                    
!       x( 89)=  tr4                   
!       x( 90)=  deltaffr              
!       x( 91)=  dPupi                 
!       x( 92)=  dPup                  
!       x( 93)=  dPdni                 
!       x( 94)=  dPdn                  
!       x( 95)=  dP                    

!.........................................................................................................

subroutine inj_IBG3a(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 35
      nbaddpar= 23
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
      parname( 34)='Trocof'
      parname( 35)='dfmax'
      parname( 36)='IN'
      parname( 37)='vxlv'
      parname( 38)='vylv'
      parname( 39)='Vref'
      parname( 40)='Pext'
      parname( 41)='Qext'
      parname( 42)='Iqref'
      parname( 43)='Ipref'
      parname( 44)='kpll'
      parname( 45)='theta_PLL'
      parname( 46)='Uplim'
      parname( 47)='Downlim'
      parname( 48)='Downlimdisc'
      parname( 49)='UplimdeltaP'
      parname( 50)='DownlimdeltaP'
      parname( 51)='Tlim'
      parname( 52)='Uplimdis'
      parname( 53)='downlimdis'
      parname( 54)='ratemax'
      parname( 55)='rate'
      parname( 56)='rateh'
      parname( 57)='fref'
      parname( 58)='Snom'
      adix=  1
      adiy=  2
      nbxvar=103
      nbzvar= 38

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
      obs(  7)=x( 40)              
      obs(  8)=x( 41)              
      obs(  9)=x( 54)              
      obs( 10)=x( 81)              
      obs( 11)=x( 72)              
      obs( 12)=x( 66)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 51)              
      obs( 16)=x( 21)              
      obs( 17)=x( 83)              
      obs( 18)=x( 87)              
      obs( 19)=x( 43)              
      obs( 20)=x( 45)              
      obs( 21)=x( 36)              

!........................................................................................
   case (initialize)

!IN = {PN}
      prm( 36)= prm(  2)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 37)= vx + prm( 19)*ix - prm( 20)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 38)= vy + prm( 19)*iy + prm( 20)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 39)= dsqrt(prm( 37)**2 + prm( 38)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 40)= -prm( 37)*ix-prm( 38)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 41)= +prm( 37)*iy-prm( 38)*ix

!Iqref = -{Qext}/{Vref}
      prm( 42)= -prm( 41)/prm( 39)

!Ipref = -{Pext}/{Vref}
      prm( 43)= -prm( 40)/prm( 39)

!kpll = 10/({tau}*0.001)
      prm( 44)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 45)= atan(prm( 38)/prm( 37))

!Uplim = 9999
      prm( 46)= 9999

!Downlim = -9999
      prm( 47)= -9999

!Downlimdisc = 0
      prm( 48)= 0

!UplimdeltaP = 9999
      prm( 49)= 9999

!DownlimdeltaP = 0
      prm( 50)= 0

!Tlim = 0.01
      prm( 51)= 0.01

!Uplimdis = 0
      prm( 52)= 0

!downlimdis = -9999
      prm( 53)= -9999

!ratemax = {Iprate}*{IN}
      prm( 54)= prm(  3)*prm( 36)

!rate = 0.5
      prm( 55)= 0.5

!rateh = 0.5
      prm( 56)= 0.5

!fref = 1
      prm( 57)= 1

!Snom = {IN}*sbase
      prm( 58)= prm( 36)*sbase

!vxl =  {vxlv}
      x(  3)= prm( 37)

!vyl =  {vylv}
      x(  4)= prm( 38)

!Vt =  {Vref}
      x(  5)= prm( 39)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 45)

!Vm =  {Vref}
      x(  7)= prm( 39)

!x2 =  {Vref}
      x(  8)= prm( 39)

!Ip =  {Ipref}
      x(  9)= prm( 43)

!Iq =  {Iqref}
      x( 10)= prm( 42)

!Ipcmd =  {Ipref}
      x( 11)= prm( 43)

!Iqcmd =  {Iqref}
      x( 12)= prm( 42)

!Iqmax =  dsqrt({IN}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm( 36)**2 - prm( 43)**2 )

!Iqmin =  - dsqrt({IN}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm( 36)**2 - prm( 43)**2 )

!Ipmaxi =  {IN}
      x( 15)= prm( 36)

!Ipmax =  min({IN},{PMPP}/{Vref})
      x( 16)= min(prm( 36),prm(  1)/prm( 39))

!Ipmin =  -0.001
      x( 17)= -0.001

!x4 =  {Ipref}
      x( 18)= prm( 43)

!DeltaW =  0
      x( 19)= 0

!DeltaWf =   0
      x( 20)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 21)= -prm( 37)*sin(prm( 45)) + prm( 38)*cos(prm( 45))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 22)= prm( 37)*cos(prm( 45)) + prm( 38)*sin(prm( 45))

!Pgen =  -{Pext}
      x( 23)= -prm( 40)

!Qgen =  -{Qext}
      x( 24)= -prm( 41)

!Iqext =  0
      x( 25)= 0

!Fvl =  1
      x( 26)= 1

!Fvli =  1
      x( 27)= 1

!z1 =  0.
      x( 28)= 0.

!x5 =  {Iqref}
      x( 29)= prm( 42)

!Iptemp =  {Ipref}
      x( 30)= prm( 43)

!Iqtemp =  {Iqref}
      x( 31)= prm( 42)

!x10 =  -{Vref}
      x( 32)= -prm( 39)

!x11 =  {Vref} - {Vmax}
      x( 33)= prm( 39) - prm(  9)

!z =  0.
      x( 34)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 35)= prm( 39) - prm( 26)

!Pflag =  1
      x( 36)= 1

!vxlm =  {vxlv}
      x( 37)= prm( 37)

!vylm =  {vylv}
      x( 38)= prm( 38)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 39)= -0.5*(prm( 37)*sin(prm( 45)) - prm( 38)*cos(prm( 45))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 40)= 50*(-0.5*(prm( 37)*sin(prm( 45)) - prm( 38)*cos(prm( 45))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 41)= 50*(-0.5*(prm( 37)*sin(prm( 45)) - prm( 38)*cos(prm( 45))) + 1)

!Ffli =  1.
      x( 42)= 1.

!Ffl =  1.
      x( 43)= 1.

!Ffhi =  1.
      x( 44)= 1.

!Ffh =  1.
      x( 45)= 1.

!Ptot =  -{Pext}
      x( 46)= -prm( 40)

!deltafl =  50*[omega] - {fmin}
      x( 47)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 48)= prm( 16) - 50*omega

!mult =  1
      x( 49)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 50)= prm( 39) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 51)= -(prm( 37)*sin(prm( 45)) - prm( 38)*cos(prm( 45)))*prm( 44) + 2*pi*50

!g =  0
      x( 52)= 0

!tr =  0
      x( 53)= 0

!Fr =  1
      x( 54)= 1

!Frtemp =  1
      x( 55)= 1

!fvlb =  1
      x( 56)= 1

!deltafvl =  -{Trv}
      x( 57)= -prm( 17)

!g1 =  1
      x( 58)= 1

!tr1 = 0
      x( 59)=0

!Frvh =  1
      x( 60)= 1

!Frvhtemp =  1
      x( 61)= 1

!fvhb =  1
      x( 62)= 1

!deltafvh =  -{Trv}
      x( 63)= -prm( 17)

!g2 =  0
      x( 64)= 0

!tr2 =  0
      x( 65)= 0

!Frfl =  1
      x( 66)= 1

!Frfltemp =  1
      x( 67)= 1

!fflb =  1
      x( 68)= 1

!deltaffl =  -{Trf}
      x( 69)= -prm( 18)

!g3 =  0
      x( 70)= 0

!tr3 =  0
      x( 71)= 0

!Frfh =  1
      x( 72)= 1

!Frfhtemp =  1
      x( 73)= 1

!ffhb =  1
      x( 74)= 1

!deltaffh =  -{Trf}
      x( 75)= -prm( 18)

!w1 =  0
      x( 76)= 0

!w2 =  0
      x( 77)= 0

!Frvhtemp1 = 1
      x( 78)=1

!one =  1
      x( 79)= 1

!zero =  0
      x( 80)= 0

!status =  1
      x( 81)= 1

!deltaf =  0
      x( 82)= 0

!rocof =  0
      x( 83)= 0

!abrocof =  0
      x( 84)= 0

!deltarocof =  {dfmax} - 0
      x( 85)= prm( 35) - 0

!Ffri =  1
      x( 86)= 1

!Ffr =  1
      x( 87)= 1

!g4 =  0
      x( 88)= 0

!tr4 =  0
      x( 89)= 0

!deltaffr =  0.25
      x( 90)= 0.25

!dPupi =  0
      x( 91)= 0

!dPup =  0
      x( 92)= 0

!dPdni =  0
      x( 93)= 0

!dPdn =  0
      x( 94)= 0

!dP =  0
      x( 95)= 0

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
      tc(  7)=prm(  5)

!& max1v1c
      eqtyp(  8)=0
      if(x(  7)<0.01)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq         ! maximum active current computation
      eqtyp(  9)=0

!& algeq         ! minimum current
      eqtyp( 10)=0

!& limvb         ! limit current Ipcmd
      eqtyp( 11)=0
      if(x( 18)>x( 16))then
         z(  2)=1
      elseif(x( 18)<x( 17))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq         ! output current computation, consider protection status
      eqtyp( 12)=0

!& tf1p2lim
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 47)=-huge(0.d0)
         prm( 46)= huge(0.d0)
         prm( 47)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 11)-x( 30)>prm( 54)*prm(  4))then
         z(  3)=1
      elseif(1*x( 11)-x( 30)<prm( 47)*prm(  4))then
         z(  3)=-1
      else
         z(  3)=0
      endif
      eqtyp( 13)=0
      if(x( 30)>prm( 46))then
         z(  4)=1
         eqtyp( 14)=0
      elseif(x( 30)<prm( 47))then
         z(  4)=-1
         eqtyp( 14)=0
      else
         z(  4)=0
         eqtyp( 14)= 30
      endif
      tc( 14)=prm(  4)

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      eqtyp( 15)=0

!& algeq
      eqtyp( 16)=0

!& algeq                 ! reactive current computation limit and update
      eqtyp( 17)=0

!& limvb
      eqtyp( 18)=0
      if(x( 29)>x( 13))then
         z(  5)=1
      elseif(x( 29)<x( 14))then
         z(  5)=-1
      else
         z(  5)=0
      endif

!& algeq						!
      eqtyp( 19)=0

!& tf1p
      eqtyp( 20)= 31
      tc( 20)=prm(  4)

!& algeq 				  ! Active - reactive power priority, max active current, converter limit
      eqtyp( 21)=0

!& algeq 				  ! MPP limit
      eqtyp( 22)=0

!& db 						! Reactive current injection, voltage support
      eqtyp( 23)=0
      if(x(  7)>prm( 27))then
         z(  6)=1
      elseif(x(  7)<prm( 26))then
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
      x( 97)=0.

!& algeq 		
      eqtyp( 27)=0

!& hyst
      eqtyp( 28)=0
      if(x( 27)>1.1)then
         z(  8)=1
      elseif(x( 27)<0.9)then
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
      if (x( 53)>5)then
         z(  9)=1
         eqtyp( 30)=0
      elseif (x( 53)<0.) then
         z(  9)=-1
         eqtyp( 30)=0
      else
         z(  9)=0
         if (1>= 0.005)then
            eqtyp( 30)= 53
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
      if(x( 57)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& tf1p2lim
      if(prm( 51)< 0.001)then
         prm( 51)=0.d0
         prm( 48)=-huge(0.d0)
         prm( 46)= huge(0.d0)
         prm( 47)=-huge(0.d0)
         prm( 55)= huge(0.d0)
      endif
      if(1*x( 55)-x( 54)>prm( 55)*prm( 51))then
         z( 11)=1
      elseif(1*x( 55)-x( 54)<prm( 47)*prm( 51))then
         z( 11)=-1
      else
         z( 11)=0
      endif
      eqtyp( 34)=0
      if(x( 54)>prm( 46))then
         z( 12)=1
         eqtyp( 35)=0
      elseif(x( 54)<prm( 48))then
         z( 12)=-1
         eqtyp( 35)=0
      else
         z( 12)=0
         eqtyp( 35)= 54
      endif
      tc( 35)=prm( 51)

!& algeq								! High voltage ride-through and HV protection flag
      eqtyp( 36)=0

!& pwlin4
      eqtyp( 37)=0
      if(x( 33)<(-999))then
         z( 13)=1
      elseif(x( 33)>=999)then
         z( 13)=   3
      elseif((-999)<=x( 33) .and. x( 33)<0.)then
         z( 13)=  1
      elseif(0.<=x( 33) .and. x( 33)<0.)then
         z( 13)=  2
      elseif(0.<=x( 33) .and. x( 33)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         tc( 38)=1
      endif
      if (x( 59)>5)then
         z( 14)=1
         eqtyp( 38)=0
      elseif (x( 59)<0.) then
         z( 14)=-1
         eqtyp( 38)=0
      else
         z( 14)=0
         if (1>= 0.005)then
            eqtyp( 38)= 59
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
      if(x( 63)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& algeq
      eqtyp( 43)=0

!& tf1p2lim
      if(prm( 51)< 0.001)then
         prm( 51)=0.d0
         prm( 48)=-huge(0.d0)
         prm( 46)= huge(0.d0)
         prm( 47)=-huge(0.d0)
         prm( 56)= huge(0.d0)
      endif
      if(1*x( 78)-x( 60)>prm( 56)*prm( 51))then
         z( 16)=1
      elseif(1*x( 78)-x( 60)<prm( 47)*prm( 51))then
         z( 16)=-1
      else
         z( 16)=0
      endif
      eqtyp( 44)=0
      if(x( 60)>prm( 46))then
         z( 17)=1
         eqtyp( 45)=0
      elseif(x( 60)<prm( 48))then
         z( 17)=-1
         eqtyp( 45)=0
      else
         z( 17)=0
         eqtyp( 45)= 60
      endif
      tc( 45)=prm( 51)

!& algeq 						! reactive current priority flag
      eqtyp( 46)=0

!& swsign
      eqtyp( 47)=0
      if(x( 35)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& algeq                     ! PLL
      eqtyp( 48)=0

!& swsign
      eqtyp( 49)=0
      if(x( 50)>=0.)then
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
      eqtyp( 51)=100
      x(100)=x( 51)
      eqtyp( 52)=0

!& algeq
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& tf1p              ! voltage measurement
      eqtyp( 55)= 37
      tc( 55)=prm(  5)

!& tf1p
      eqtyp( 56)= 38
      tc( 56)=prm(  5)

!& algeq                     ! filter PLL frequency , convert to Hz
      eqtyp( 57)=0

!& algeq
      eqtyp( 58)=0

!& tf1p
      eqtyp( 59)= 41
      tc( 59)=0.1

!& algeq                         ! frequency protection flag FFl, and FFh
      eqtyp( 60)=0

!& swsign
      eqtyp( 61)=0
      if(x( 47)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& algeq
      eqtyp( 62)=0

!& swsign
      eqtyp( 63)=0
      if(x( 48)>=0.)then
         z( 21)=1
      else
         z( 21)=2
      endif

!& hyst
      eqtyp( 64)=0
      if(x( 42)>1.1)then
         z( 22)=1
      elseif(x( 42)<0.9)then
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
      if(x( 44)>1.1)then
         z( 23)=1
      elseif(x( 44)<0.9)then
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
      if (x( 65)>5)then
         z( 24)=1
         eqtyp( 67)=0
      elseif (x( 65)<0.) then
         z( 24)=-1
         eqtyp( 67)=0
      else
         z( 24)=0
         if (1>= 0.005)then
            eqtyp( 67)= 65
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
      if(x( 69)>=0.)then
         z( 25)=1
      else
         z( 25)=2
      endif

!& tf1p2lim
      if(prm( 51)< 0.001)then
         prm( 51)=0.d0
         prm( 48)=-huge(0.d0)
         prm( 46)= huge(0.d0)
         prm( 47)=-huge(0.d0)
         prm( 56)= huge(0.d0)
      endif
      if(1*x( 67)-x( 66)>prm( 56)*prm( 51))then
         z( 26)=1
      elseif(1*x( 67)-x( 66)<prm( 47)*prm( 51))then
         z( 26)=-1
      else
         z( 26)=0
      endif
      eqtyp( 71)=0
      if(x( 66)>prm( 46))then
         z( 27)=1
         eqtyp( 72)=0
      elseif(x( 66)<prm( 48))then
         z( 27)=-1
         eqtyp( 72)=0
      else
         z( 27)=0
         eqtyp( 72)= 66
      endif
      tc( 72)=prm( 51)

!& algeq								! High frequency protection and reconnection
      eqtyp( 73)=0

!& inlim
      if (1>= 0.005)then
         tc( 74)=1
      endif
      if (x( 71)>5)then
         z( 28)=1
         eqtyp( 74)=0
      elseif (x( 71)<0.) then
         z( 28)=-1
         eqtyp( 74)=0
      else
         z( 28)=0
         if (1>= 0.005)then
            eqtyp( 74)= 71
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
      if(x( 75)>=0.)then
         z( 29)=1
      else
         z( 29)=2
      endif

!& tf1p2lim
      if(prm( 51)< 0.001)then
         prm( 51)=0.d0
         prm( 48)=-huge(0.d0)
         prm( 46)= huge(0.d0)
         prm( 47)=-huge(0.d0)
         prm( 56)= huge(0.d0)
      endif
      if(1*x( 73)-x( 72)>prm( 56)*prm( 51))then
         z( 30)=1
      elseif(1*x( 73)-x( 72)<prm( 47)*prm( 51))then
         z( 30)=-1
      else
         z( 30)=0
      endif
      eqtyp( 78)=0
      if(x( 72)>prm( 46))then
         z( 31)=1
         eqtyp( 79)=0
      elseif(x( 72)<prm( 48))then
         z( 31)=-1
         eqtyp( 79)=0
      else
         z( 31)=0
         eqtyp( 79)= 72
      endif
      tc( 79)=prm( 51)

!& algeq				! Frequency droop control
      eqtyp( 80)=0

!& db                ! frequency deadband
      eqtyp( 81)=0
      if(x( 76)>prm( 33))then
         z( 32)=1
      elseif(x( 76)<prm( 32))then
         z( 32)=-1
      else
         z( 32)=0
      endif

!& algeq       ! compute unlimited power change during underfrequencies
      eqtyp( 82)=0

!& lim           ! limit power change during underfrequencies
      eqtyp( 83)=0
      if(x( 91)>(prm( 58)+prm( 40)))then
         z( 33)=1
      elseif(x( 91)<0.0000000001)then
         z( 33)=-1
      else
         z( 33)=0
      endif

!& algeq       ! compute unlimited power change during overfrequency
      eqtyp( 84)=0

!& lim           ! limit power change during overfrequencies
      eqtyp( 85)=0
      if(x( 93)>(-0.0000000001))then
         z( 34)=1
      elseif(x( 93)<prm( 40))then
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
      x(103)=x( 82)
      eqtyp( 89)=103
      tc( 89)=prm( 34)
      eqtyp( 90)=0

!& abs
      eqtyp( 91)=0
      if(x( 83)>0. )then
         z( 35)=1
      else
         z( 35)=-1
      endif

!& algeq               ! rocof protection and timer
      eqtyp( 92)=0

!& swsign
      eqtyp( 93)=0
      if(x( 85)>=0.)then
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
      if (x( 89)>5)then
         z( 37)=1
         eqtyp( 95)=0
      elseif (x( 89)<0) then
         z( 37)=-1
         eqtyp( 95)=0
      else
         z( 37)=0
         if (1>= 0.005)then
            eqtyp( 95)= 89
         else
            eqtyp( 95)=0
         endif
      endif

!& algeq
      eqtyp( 96)=0

!& swsign
      eqtyp( 97)=0
      if(x( 90)>=0.)then
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

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=-x( 81) + x( 54)*x( 60)*x( 66)*x( 72)*x( 87)

!& algeq
      f(  2)=x( 79)-1

!& algeq
      f(  3)=x( 80)

!& algeq             ! voltage drop over line that connects PV, vxl is after impedance
      f(  4)=vx + prm( 19)*x(  1) - prm( 20)*x(  2) - x(  3)

!& algeq
      f(  5)=vy + prm( 19)*x(  2) + prm( 20)*x(  1) - x(  4)

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
      f(  9)=x( 46)/x(  8) - x( 18)

!& algeq         ! minimum current
      f( 10)=x( 17) + 0.001

!& limvb         ! limit current Ipcmd
      select case (z(  2))
         case(0)
            f( 11)=x( 11)-x( 18)
         case(-1)
            f( 11)=x( 11)-x( 17)
         case(1)
            f( 11)=x( 11)-x( 16)
      end select

!& algeq         ! output current computation, consider protection status
      f( 12)=x( 30)*x( 81) - x(  9)

!& tf1p2lim
      select case (z(  3))
         case(0)
            f( 13)=x( 96)-1*x( 11)+x( 30)
         case(1)
            f( 13)=x( 96)-prm( 54)*prm(  4)
         case(-1)
            f( 13)=x( 96)-prm( 47)*prm(  4)
      end select
      select case (z(  4))
         case(0)
            f( 14)=x( 96)
         case(1)
            f( 14)=x( 30)-prm( 46)
         case(-1)
            f( 14)=x( 30)-prm( 47)
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      f( 15)=x( 13) -x( 36)*dsqrt(max(0.d0,prm( 36)**2 - x( 11)**2)) - (1-x( 36))*(prm( 30)*prm( 36)*0.707 + (1-prm( 30))*prm( 36))

!& algeq
      f( 16)=x( 14) + x( 36)*dsqrt(max(0.d0,prm( 36)**2 - x( 11)**2)) + (1-x( 36))*prm( 36)

!& algeq                 ! reactive current computation limit and update
      f( 17)=-x( 25) + prm( 42) - x( 29)

!& limvb
      select case (z(  5))
         case(0)
            f( 18)=x( 12)-x( 29)
         case(-1)
            f( 18)=x( 12)-x( 14)
         case(1)
            f( 18)=x( 12)-x( 13)
      end select

!& algeq						!
      f( 19)=x( 31)*x( 81) - x( 10)

!& tf1p
      f( 20)=(-x( 31)+1.*x( 12))

!& algeq 				  ! Active - reactive power priority, max active current, converter limit
      f( 21)=x( 15) - x( 36)*prm( 36) -  (1-x( 36))*dsqrt(max(0.d0,prm( 36)**2 - x( 12)**2))

!& algeq 				  ! MPP limit
      f( 22)=- x( 16) + min(x( 15), prm(  1)/x(  7))

!& db 						! Reactive current injection, voltage support
      select case (z(  6))
         case(0)
            f( 23)=x( 25)
         case(-1)
            f( 23)=x( 25)-(-prm( 24)*prm( 36)*(prm( 21) + prm( 30)))-(prm( 22)*prm( 36)*(prm( 21) + prm( 30) ))*(x(  7)-prm( 26))
         case(1)
            f( 23)=x( 25)-prm( 25)*prm( 36)-prm( 23)*prm( 36)*prm( 28)*(x(  7)-prm( 27))
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag
      f( 24)=x(  7) + x( 32)

!& timer5
      select case (z(  7))
         case (-1)
            f( 25)=x( 34)
            f( 26)=x( 97)
         case (0)
            f( 25)=x( 34)
            f( 26)= 1.
         case (1)
            f( 25)=x( 34)-1.
            f( 26)= 0.
      end select

!& algeq 		
      f( 27)=x( 27) -1 + x( 34)

!& hyst
      if(z(  8) == 1)then
         f( 28)=x( 26)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 28)=x( 26)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 29)=x( 52) - 1 + x( 26)

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               f( 30)=x( 52)
            case(1)
               f( 30)=x( 53)-5
            case(-1)
               f( 30)=x( 53)-0.
         end select
      else
         select case (z(  9))
            case(0)
               f( 30)=x( 52)-x( 53)
            case(1)
               f( 30)=x( 53)-5
            case(-1)
               f( 30)=x( 53)-0.
         end select
      endif

!& algeq
      f( 31)=x( 56) - 1 + x( 52)

!& algeq
      f( 32)=x( 57) + prm( 17) - x( 53)

!& swsign
      select case (z( 10))
         case(1)
            f( 33)=x( 55)-x( 79)
         case(2)
            f( 33)=x( 55)-x( 56)
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            f( 34)=x( 98)-1*x( 55)+x( 54)
         case(1)
            f( 34)=x( 98)-prm( 55)*prm( 51)
         case(-1)
            f( 34)=x( 98)-prm( 47)*prm( 51)
      end select
      select case (z( 12))
         case(0)
            f( 35)=x( 98)
         case(1)
            f( 35)=x( 54)-prm( 46)
         case(-1)
            f( 35)=x( 54)-prm( 48)
      end select

!& algeq								! High voltage ride-through and HV protection flag
      f( 36)=x( 33) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 13))
         case (  1)
            f( 37)=0.+ ( (0.-0.)*(x( 33)-(-999))/(0.-(-999)) ) -x( 28)
         case (  2)
            f( 37)=0.+ ( (1.-0.)*(x( 33)-0.)/(0.-0.) ) -x( 28)
         case (  3)
            f( 37)=1.+ ( (1.-1.)*(x( 33)-0.)/(999-0.) ) -x( 28)
      end select

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               f( 38)=x( 28)
            case(1)
               f( 38)=x( 59)-5
            case(-1)
               f( 38)=x( 59)-0.
         end select
      else
         select case (z( 14))
            case(0)
               f( 38)=x( 28)-x( 59)
            case(1)
               f( 38)=x( 59)-5
            case(-1)
               f( 38)=x( 59)-0.
         end select
      endif

!& algeq
      f( 39)=x( 58) - 1 + x( 28)

!& algeq
      f( 40)=x( 62) - 1 + x( 28)

!& algeq
      f( 41)=x( 63) + prm( 17) - x( 59)

!& swsign
      select case (z( 15))
         case(1)
            f( 42)=x( 61)-x( 79)
         case(2)
            f( 42)=x( 61)-x( 62)
      end select

!& algeq
      f( 43)=x( 78) - x( 61)*x( 58)

!& tf1p2lim
      select case (z( 16))
         case(0)
            f( 44)=x( 99)-1*x( 78)+x( 60)
         case(1)
            f( 44)=x( 99)-prm( 56)*prm( 51)
         case(-1)
            f( 44)=x( 99)-prm( 47)*prm( 51)
      end select
      select case (z( 17))
         case(0)
            f( 45)=x( 99)
         case(1)
            f( 45)=x( 60)-prm( 46)
         case(-1)
            f( 45)=x( 60)-prm( 48)
      end select

!& algeq 						! reactive current priority flag
      f( 46)=x( 35) - x(  7) + prm( 26)

!& swsign
      select case (z( 18))
         case(1)
            f( 47)=x( 36)-x( 79)
         case(2)
            f( 47)=x( 36)-x( 80)
      end select

!& algeq                     ! PLL
      f( 48)=x( 50) - x(  7) + prm( 11)

!& swsign
      select case (z( 19))
         case(1)
            f( 49)=x( 49)-x( 79)
         case(2)
            f( 49)=x( 49)-x( 80)
      end select

!& int
      if (1.< 0.005)then
         f( 50)=x( 20)-x(  6)
      else
         f( 50)=x( 20)
      endif

!& pictl
      f( 51)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 21)
      f( 52)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 21)+x(100)-x( 51)

!& algeq
      f( 53)=x( 19) - x( 51) + omega*2*pi*50

!& algeq
      f( 54)=x( 20) - x( 19)*x( 49)

!& tf1p              ! voltage measurement
      f( 55)=(-x( 37)+1.*x(  3))

!& tf1p
      f( 56)=(-x( 38)+1.*x(  4))

!& algeq                     ! filter PLL frequency , convert to Hz
      f( 57)=x( 39) - x( 51)/(2*pi*50)

!& algeq
      f( 58)=x( 40) - 50*x( 39)

!& tf1p
      f( 59)=(-x( 41)+1*x( 40))

!& algeq                         ! frequency protection flag FFl, and FFh
      f( 60)=x( 47) - x( 41) + prm( 15)

!& swsign
      select case (z( 20))
         case(1)
            f( 61)=x( 42)-x( 79)
         case(2)
            f( 61)=x( 42)-x( 80)
      end select

!& algeq
      f( 62)=x( 48) - prm( 16) + x( 41)

!& swsign
      select case (z( 21))
         case(1)
            f( 63)=x( 44)-x( 79)
         case(2)
            f( 63)=x( 44)-x( 80)
      end select

!& hyst
      if(z( 22) == 1)then
         f( 64)=x( 43)-1.-(1.-1.)*(x( 42)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 43)-0.-(0.-0.)*(x( 42)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 23) == 1)then
         f( 65)=x( 45)-1.-(1.-1.)*(x( 44)-1.1)/(1.1-0.9)
      else
         f( 65)=x( 45)-0.-(0.-0.)*(x( 44)-0.9)/(1.1-0.9)
      endif

!& algeq						       ! Low frequency protection and reconnection
      f( 66)=x( 64) - 1 + x( 43)

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               f( 67)=x( 64)
            case(1)
               f( 67)=x( 65)-5
            case(-1)
               f( 67)=x( 65)-0.
         end select
      else
         select case (z( 24))
            case(0)
               f( 67)=x( 64)-x( 65)
            case(1)
               f( 67)=x( 65)-5
            case(-1)
               f( 67)=x( 65)-0.
         end select
      endif

!& algeq
      f( 68)=x( 68) - 1 + x( 64)

!& algeq
      f( 69)=x( 69) + prm( 18) - x( 65)

!& swsign
      select case (z( 25))
         case(1)
            f( 70)=x( 67)-x( 79)
         case(2)
            f( 70)=x( 67)-x( 68)
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            f( 71)=x(101)-1*x( 67)+x( 66)
         case(1)
            f( 71)=x(101)-prm( 56)*prm( 51)
         case(-1)
            f( 71)=x(101)-prm( 47)*prm( 51)
      end select
      select case (z( 27))
         case(0)
            f( 72)=x(101)
         case(1)
            f( 72)=x( 66)-prm( 46)
         case(-1)
            f( 72)=x( 66)-prm( 48)
      end select

!& algeq								! High frequency protection and reconnection
      f( 73)=x( 70) - 1 + x( 45)

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               f( 74)=x( 70)
            case(1)
               f( 74)=x( 71)-5
            case(-1)
               f( 74)=x( 71)-0.
         end select
      else
         select case (z( 28))
            case(0)
               f( 74)=x( 70)-x( 71)
            case(1)
               f( 74)=x( 71)-5
            case(-1)
               f( 74)=x( 71)-0.
         end select
      endif

!& algeq
      f( 75)=x( 74) - 1 + x( 70)

!& algeq
      f( 76)=x( 75) + prm( 18) - x( 71)

!& swsign
      select case (z( 29))
         case(1)
            f( 77)=x( 73)-x( 79)
         case(2)
            f( 77)=x( 73)-x( 74)
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            f( 78)=x(102)-1*x( 73)+x( 72)
         case(1)
            f( 78)=x(102)-prm( 56)*prm( 51)
         case(-1)
            f( 78)=x(102)-prm( 47)*prm( 51)
      end select
      select case (z( 31))
         case(0)
            f( 79)=x(102)
         case(1)
            f( 79)=x( 72)-prm( 46)
         case(-1)
            f( 79)=x( 72)-prm( 48)
      end select

!& algeq				! Frequency droop control
      f( 80)=x( 76) + (x( 41)/50) - prm( 57)

!& db                ! frequency deadband
      select case (z( 32))
         case(0)
            f( 81)=x( 77)
         case(-1)
            f( 81)=x( 77)-0.-1.*(x( 76)-prm( 32))
         case(1)
            f( 81)=x( 77)-0.-1.*(x( 76)-prm( 33))
      end select

!& algeq       ! compute unlimited power change during underfrequencies
      f( 82)=-x( 91) + (x( 77)*50)/2 * (prm( 58) + prm( 40))

!& lim           ! limit power change during underfrequencies
      select case (z( 33))
         case(0)
            f( 83)=x( 92)-x( 91)
         case(-1)
            f( 83)=x( 92)-0.0000000001
         case(1)
            f( 83)=x( 92)-(prm( 58)+prm( 40))
      end select

!& algeq       ! compute unlimited power change during overfrequency
      f( 84)=-x( 93) - (x( 77)*50)/2 * prm( 40)

!& lim           ! limit power change during overfrequencies
      select case (z( 34))
         case(0)
            f( 85)=x( 94)-x( 93)
         case(-1)
            f( 85)=x( 94)-prm( 40)
         case(1)
            f( 85)=x( 94)-(-0.0000000001)
      end select

!& algeq
      f( 86)=x( 95)-x( 92)-x( 94)

!& algeq
      f( 87)=x( 46)+prm( 40)-x( 95)

!& algeq                ! frequency deviation in Hz
      f( 88)=-x( 82) + x( 41)-prm( 57)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 89)=-x(103)+x( 82)
      if (prm( 34)< 0.005)then
         f( 90)=1/prm( 34)*x( 82)-x( 83)
      else
         f( 90)=1/prm( 34)*(x( 82)-x(103))-x( 83)
      endif

!& abs
      if(z( 35) == 1 )then
         f( 91)=x( 84)-x( 83)
      else
         f( 91)=x( 84)+x( 83)
      endif

!& algeq               ! rocof protection and timer
      f( 92)=-x( 85) +prm( 35) -x( 84)

!& swsign
      select case (z( 36))
         case(1)
            f( 93)=x( 86)-x( 79)
         case(2)
            f( 93)=x( 86)-x( 80)
      end select

!& algeq
      f( 94)=x( 88) - 1 + x( 86)

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               f( 95)=x( 88)
            case(1)
               f( 95)=x( 89)-5
            case(-1)
               f( 95)=x( 89)-0
         end select
      else
         select case (z( 37))
            case(0)
               f( 95)=x( 88)-x( 89)
            case(1)
               f( 95)=x( 89)-5
            case(-1)
               f( 95)=x( 89)-0
         end select
      endif

!& algeq
      f( 96)=-x( 90) + 0.25 - x( 89)

!& swsign
      select case (z( 38))
         case(1)
            f( 97)=x( 87)-x( 79)
         case(2)
            f( 97)=x( 87)-x( 80)
      end select

!& algeq                 ! alignment equations
      f( 98)=x( 22) - x( 37)*cos(x(  6)) - x( 38)*sin(x(  6))

!& algeq
      f( 99)=x( 21) + x( 37)*sin(x(  6)) - x( 38)*cos(x(  6))

!& algeq
      f(100)=x( 23) - x( 22)*x(  9)

!& algeq
      f(101)=x( 24) - x( 22)*x( 10)

!& algeq
      f(102)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f(103)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

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

!& algeq         ! minimum current

!& limvb         ! limit current Ipcmd
      select case (z(  2))
         case(0)
            if(x( 18)>x( 16))then
               z(  2)=1
            elseif(x( 18)<x( 17))then
               z(  2)=-1
            endif
         case(-1)
            if(x( 18)>x( 17))then
               z(  2)=0
            endif
         case(1)
            if(x( 18)<x( 16))then
               z(  2)=0
            endif
      end select

!& algeq         ! output current computation, consider protection status

!& tf1p2lim
      select case (z(  3))
         case(0)
            if(x( 96)>prm( 54)*prm(  4))then
               z(  3)=1
            elseif(x( 96)<prm( 47)*prm(  4))then
               z(  3)=-1
            endif
         case(1)
            if(1*x( 11)-x( 30)<prm( 54)*prm(  4))then
               z(  3)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 30)>prm( 47)*prm(  4))then
               z(  3)= 0
            endif
      end select
      select case (z(  4))
         case(0)
            if(x( 30)>prm( 46))then
               z(  4)=1
               eqtyp( 14)=0
            elseif(x( 30)<prm( 47))then
               z(  4)=-1
               eqtyp( 14)=0
            endif
         case(1)
            if (x( 96)<0.)then
               z(  4)= 0
               eqtyp( 14)= 30
            endif
         case(-1)
            if(x( 96)>0.)then
               z(  4)= 0
               eqtyp( 14)= 30
            endif
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current

!& algeq

!& algeq                 ! reactive current computation limit and update

!& limvb
      select case (z(  5))
         case(0)
            if(x( 29)>x( 13))then
               z(  5)=1
            elseif(x( 29)<x( 14))then
               z(  5)=-1
            endif
         case(-1)
            if(x( 29)>x( 14))then
               z(  5)=0
            endif
         case(1)
            if(x( 29)<x( 13))then
               z(  5)=0
            endif
      end select

!& algeq						!

!& tf1p

!& algeq 				  ! Active - reactive power priority, max active current, converter limit

!& algeq 				  ! MPP limit

!& db 						! Reactive current injection, voltage support
      select case (z(  6))
         case(0)
            if(x(  7)>prm( 27))then
               z(  6)=1
            elseif(x(  7)<prm( 26))then
               z(  6)=-1
            endif
         case(-1)
            if(x(  7)>prm( 26))then
               z(  6)=0
            endif
         case(1)
            if(x(  7)<prm( 27))then
               z(  6)=0
            endif
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag

!& timer5
      if(z(  7) == -1)then
         if(x( 32) >= (-prm( 12)))then
            z(  7)=0
            eqtyp( 26)= 97
         endif
      else
         if(x( 32) < (-prm( 12)))then
            z(  7)=-1
            eqtyp( 26)=0
         endif
      endif
      if(z(  7) == 0)then
         if(x( 32) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x( 97) > 0.)then
               z(  7)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x( 97) > prm(  6)+(0.-prm(  6))*(x( 32)-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x( 97) > prm(  6)+(prm(  6)-prm(  6))*(x( 32)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 32) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x( 97) > prm(  8)+(prm(  6)-prm(  8))*(x( 32)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 32) > (-prm( 12)))then
            if(x( 97) > prm(  7)+(prm(  8)-prm(  7))*(x( 32)-(-prm( 12)))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-prm( 12))))then
               z(  7)=1
            endif
         endif
      endif

!& algeq 		

!& hyst
      if (z(  8) == -1)then
         if(x( 27)>1.1)then
            z(  8)=1
         endif
      else
         if(x( 27)<0.9)then
            z(  8)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               if(x( 53)<0.)then
                  z(  9)=-1
                  eqtyp( 30)=0
               elseif(x( 53)>5)then
                  z(  9)= 1
                  eqtyp( 30)=0
               endif
            case(1)
               if(x( 52)<0.)then
                  z(  9)=0
                  eqtyp( 30)= 53
               endif
            case(-1)
               if(x( 52)>0.)then
                  z(  9)=0
                  eqtyp( 30)= 53
               endif
         end select
      else
         select case (z(  9))
            case(0)
               if(x( 53)<0.)then
                  z(  9)=-1
               elseif(x( 53)>5)then
                  z(  9)= 1
               endif
            case(1)
               if(x( 52)<5)then
                  z(  9)=0
               endif
            case(-1)
               if(x( 52)>0.)then
                  z(  9)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 10))
         case(1)
            if(x( 57)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 57)>=0.)then
               z( 10)=1
            endif
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            if(x( 98)>prm( 55)*prm( 51))then
               z( 11)=1
            elseif(x( 98)<prm( 47)*prm( 51))then
               z( 11)=-1
            endif
         case(1)
            if(1*x( 55)-x( 54)<prm( 55)*prm( 51))then
               z( 11)= 0
            endif
         case(-1)
            if(1*x( 55)-x( 54)>prm( 47)*prm( 51))then
               z( 11)= 0
            endif
      end select
      select case (z( 12))
         case(0)
            if(x( 54)>prm( 46))then
               z( 12)=1
               eqtyp( 35)=0
            elseif(x( 54)<prm( 48))then
               z( 12)=-1
               eqtyp( 35)=0
            endif
         case(1)
            if (x( 98)<0.)then
               z( 12)= 0
               eqtyp( 35)= 54
            endif
         case(-1)
            if(x( 98)>0.)then
               z( 12)= 0
               eqtyp( 35)= 54
            endif
      end select

!& algeq								! High voltage ride-through and HV protection flag

!& pwlin4
      if(x( 33)<(-999))then
         z( 13)=1
      elseif(x( 33)>=999)then
         z( 13)=  3
      elseif((-999)<=x( 33) .and. x( 33)<0.)then
         z( 13)=  1
      elseif(0.<=x( 33) .and. x( 33)<0.)then
         z( 13)=  2
      elseif(0.<=x( 33) .and. x( 33)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               if(x( 59)<0.)then
                  z( 14)=-1
                  eqtyp( 38)=0
               elseif(x( 59)>5)then
                  z( 14)= 1
                  eqtyp( 38)=0
               endif
            case(1)
               if(x( 28)<0.)then
                  z( 14)=0
                  eqtyp( 38)= 59
               endif
            case(-1)
               if(x( 28)>0.)then
                  z( 14)=0
                  eqtyp( 38)= 59
               endif
         end select
      else
         select case (z( 14))
            case(0)
               if(x( 59)<0.)then
                  z( 14)=-1
               elseif(x( 59)>5)then
                  z( 14)= 1
               endif
            case(1)
               if(x( 28)<5)then
                  z( 14)=0
               endif
            case(-1)
               if(x( 28)>0.)then
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
            if(x( 63)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 63)>=0.)then
               z( 15)=1
            endif
      end select

!& algeq

!& tf1p2lim
      select case (z( 16))
         case(0)
            if(x( 99)>prm( 56)*prm( 51))then
               z( 16)=1
            elseif(x( 99)<prm( 47)*prm( 51))then
               z( 16)=-1
            endif
         case(1)
            if(1*x( 78)-x( 60)<prm( 56)*prm( 51))then
               z( 16)= 0
            endif
         case(-1)
            if(1*x( 78)-x( 60)>prm( 47)*prm( 51))then
               z( 16)= 0
            endif
      end select
      select case (z( 17))
         case(0)
            if(x( 60)>prm( 46))then
               z( 17)=1
               eqtyp( 45)=0
            elseif(x( 60)<prm( 48))then
               z( 17)=-1
               eqtyp( 45)=0
            endif
         case(1)
            if (x( 99)<0.)then
               z( 17)= 0
               eqtyp( 45)= 60
            endif
         case(-1)
            if(x( 99)>0.)then
               z( 17)= 0
               eqtyp( 45)= 60
            endif
      end select

!& algeq 						! reactive current priority flag

!& swsign
      select case (z( 18))
         case(1)
            if(x( 35)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 35)>=0.)then
               z( 18)=1
            endif
      end select

!& algeq                     ! PLL

!& swsign
      select case (z( 19))
         case(1)
            if(x( 50)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 50)>=0.)then
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
            if(x( 47)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 47)>=0.)then
               z( 20)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 21))
         case(1)
            if(x( 48)<0.)then
               z( 21)=2
            endif
         case(2)
            if(x( 48)>=0.)then
               z( 21)=1
            endif
      end select

!& hyst
      if (z( 22) == -1)then
         if(x( 42)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 42)<0.9)then
            z( 22)=-1
         endif
      endif

!& hyst
      if (z( 23) == -1)then
         if(x( 44)>1.1)then
            z( 23)=1
         endif
      else
         if(x( 44)<0.9)then
            z( 23)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               if(x( 65)<0.)then
                  z( 24)=-1
                  eqtyp( 67)=0
               elseif(x( 65)>5)then
                  z( 24)= 1
                  eqtyp( 67)=0
               endif
            case(1)
               if(x( 64)<0.)then
                  z( 24)=0
                  eqtyp( 67)= 65
               endif
            case(-1)
               if(x( 64)>0.)then
                  z( 24)=0
                  eqtyp( 67)= 65
               endif
         end select
      else
         select case (z( 24))
            case(0)
               if(x( 65)<0.)then
                  z( 24)=-1
               elseif(x( 65)>5)then
                  z( 24)= 1
               endif
            case(1)
               if(x( 64)<5)then
                  z( 24)=0
               endif
            case(-1)
               if(x( 64)>0.)then
                  z( 24)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 25))
         case(1)
            if(x( 69)<0.)then
               z( 25)=2
            endif
         case(2)
            if(x( 69)>=0.)then
               z( 25)=1
            endif
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            if(x(101)>prm( 56)*prm( 51))then
               z( 26)=1
            elseif(x(101)<prm( 47)*prm( 51))then
               z( 26)=-1
            endif
         case(1)
            if(1*x( 67)-x( 66)<prm( 56)*prm( 51))then
               z( 26)= 0
            endif
         case(-1)
            if(1*x( 67)-x( 66)>prm( 47)*prm( 51))then
               z( 26)= 0
            endif
      end select
      select case (z( 27))
         case(0)
            if(x( 66)>prm( 46))then
               z( 27)=1
               eqtyp( 72)=0
            elseif(x( 66)<prm( 48))then
               z( 27)=-1
               eqtyp( 72)=0
            endif
         case(1)
            if (x(101)<0.)then
               z( 27)= 0
               eqtyp( 72)= 66
            endif
         case(-1)
            if(x(101)>0.)then
               z( 27)= 0
               eqtyp( 72)= 66
            endif
      end select

!& algeq								! High frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               if(x( 71)<0.)then
                  z( 28)=-1
                  eqtyp( 74)=0
               elseif(x( 71)>5)then
                  z( 28)= 1
                  eqtyp( 74)=0
               endif
            case(1)
               if(x( 70)<0.)then
                  z( 28)=0
                  eqtyp( 74)= 71
               endif
            case(-1)
               if(x( 70)>0.)then
                  z( 28)=0
                  eqtyp( 74)= 71
               endif
         end select
      else
         select case (z( 28))
            case(0)
               if(x( 71)<0.)then
                  z( 28)=-1
               elseif(x( 71)>5)then
                  z( 28)= 1
               endif
            case(1)
               if(x( 70)<5)then
                  z( 28)=0
               endif
            case(-1)
               if(x( 70)>0.)then
                  z( 28)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 29))
         case(1)
            if(x( 75)<0.)then
               z( 29)=2
            endif
         case(2)
            if(x( 75)>=0.)then
               z( 29)=1
            endif
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            if(x(102)>prm( 56)*prm( 51))then
               z( 30)=1
            elseif(x(102)<prm( 47)*prm( 51))then
               z( 30)=-1
            endif
         case(1)
            if(1*x( 73)-x( 72)<prm( 56)*prm( 51))then
               z( 30)= 0
            endif
         case(-1)
            if(1*x( 73)-x( 72)>prm( 47)*prm( 51))then
               z( 30)= 0
            endif
      end select
      select case (z( 31))
         case(0)
            if(x( 72)>prm( 46))then
               z( 31)=1
               eqtyp( 79)=0
            elseif(x( 72)<prm( 48))then
               z( 31)=-1
               eqtyp( 79)=0
            endif
         case(1)
            if (x(102)<0.)then
               z( 31)= 0
               eqtyp( 79)= 72
            endif
         case(-1)
            if(x(102)>0.)then
               z( 31)= 0
               eqtyp( 79)= 72
            endif
      end select

!& algeq				! Frequency droop control

!& db                ! frequency deadband
      select case (z( 32))
         case(0)
            if(x( 76)>prm( 33))then
               z( 32)=1
            elseif(x( 76)<prm( 32))then
               z( 32)=-1
            endif
         case(-1)
            if(x( 76)>prm( 32))then
               z( 32)=0
            endif
         case(1)
            if(x( 76)<prm( 33))then
               z( 32)=0
            endif
      end select

!& algeq       ! compute unlimited power change during underfrequencies

!& lim           ! limit power change during underfrequencies
      select case (z( 33))
         case(0)
            if(x( 91)>(prm( 58)+prm( 40)))then
               z( 33)=1
            elseif(x( 91)<0.0000000001)then
               z( 33)=-1
            endif
         case(-1)
            if(x( 91)>0.0000000001)then
               z( 33)=0
            endif
         case(1)
            if(x( 91)<(prm( 58)+prm( 40)))then
               z( 33)=0
            endif
      end select

!& algeq       ! compute unlimited power change during overfrequency

!& lim           ! limit power change during overfrequencies
      select case (z( 34))
         case(0)
            if(x( 93)>(-0.0000000001))then
               z( 34)=1
            elseif(x( 93)<prm( 40))then
               z( 34)=-1
            endif
         case(-1)
            if(x( 93)>prm( 40))then
               z( 34)=0
            endif
         case(1)
            if(x( 93)<(-0.0000000001))then
               z( 34)=0
            endif
      end select

!& algeq

!& algeq

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 35) == -1 )then
         if(x( 83)> blocktol1 )then
            z( 35)=1
         endif
      else
         if(x( 83)< - blocktol1 )then
            z( 35)=-1
         endif
      endif

!& algeq               ! rocof protection and timer

!& swsign
      select case (z( 36))
         case(1)
            if(x( 85)<0.)then
               z( 36)=2
            endif
         case(2)
            if(x( 85)>=0.)then
               z( 36)=1
            endif
      end select

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               if(x( 89)<0)then
                  z( 37)=-1
                  eqtyp( 95)=0
               elseif(x( 89)>5)then
                  z( 37)= 1
                  eqtyp( 95)=0
               endif
            case(1)
               if(x( 88)<0.)then
                  z( 37)=0
                  eqtyp( 95)= 89
               endif
            case(-1)
               if(x( 88)>0.)then
                  z( 37)=0
                  eqtyp( 95)= 89
               endif
         end select
      else
         select case (z( 37))
            case(0)
               if(x( 89)<0)then
                  z( 37)=-1
               elseif(x( 89)>5)then
                  z( 37)= 1
               endif
            case(1)
               if(x( 88)<5)then
                  z( 37)=0
               endif
            case(-1)
               if(x( 88)>0)then
                  z( 37)=0
               endif
         end select
      endif

!& algeq

!& swsign
      select case (z( 38))
         case(1)
            if(x( 90)<0.)then
               z( 38)=2
            endif
         case(2)
            if(x( 90)>=0.)then
               z( 38)=1
            endif
      end select

!& algeq                 ! alignment equations

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq
   end select

end subroutine inj_IBG3a
