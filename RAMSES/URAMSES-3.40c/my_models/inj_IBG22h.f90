!  MODEL NAME : inj_IBG22h              
!  MODEL DESCRIPTION FILE : IBG22head.txt
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
!       prm( 37)=  protection                      -1 to switch off, 1 to switch on
!       prm( 38)=  support
!  Parameters :
!       prm( 39)=  IN  
!       prm( 40)=  vxlv  
!       prm( 41)=  vylv  
!       prm( 42)=  Vref  
!       prm( 43)=  Pext  
!       prm( 44)=  Qext  
!       prm( 45)=  Iqref  
!       prm( 46)=  Ipref  
!       prm( 47)=  kpll  
!       prm( 48)=  theta_PLL  
!       prm( 49)=  Uplim  
!       prm( 50)=  Downlim  
!       prm( 51)=  Downlimdisc  
!       prm( 52)=  Uplimdis  
!       prm( 53)=  downlimdis  
!       prm( 54)=  ratemax  
!       prm( 55)=  rate  
!       prm( 56)=  fref  
!       prm( 57)=  Tlim  
!       prm( 58)=  Snom  
!       prm( 59)=  df_up  
!       prm( 60)=  df_dn  
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
!       x( 28)=  Fvhi                  
!       x( 29)=  Fvh                   
!       x( 30)=  z1                    
!       x( 31)=  x5                    
!       x( 32)=  Iptemp                
!       x( 33)=  Iqtemp                
!       x( 34)=  x10                   
!       x( 35)=  x11                   
!       x( 36)=  z                     
!       x( 37)=  deltaV                
!       x( 38)=  Pflag                 
!       x( 39)=  Pflagi                
!       x( 40)=  one                   
!       x( 41)=  zero                  
!       x( 42)=  vxlm                  
!       x( 43)=  vylm                  
!       x( 44)=  omegam                
!       x( 45)=  fm                    
!       x( 46)=  fmfilt                
!       x( 47)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 48)=  Ffl                   
!       x( 49)=  Ffhi                  
!       x( 50)=  Ffh                   
!       x( 51)=  Ptot                  
!       x( 52)=  deltafl               
!       x( 53)=  deltafh               
!       x( 54)=  mult                  
!       x( 55)=  deltaVPLL             
!       x( 56)=  wpll                  
!       x( 57)=  g                     
!       x( 58)=  tr                    
!       x( 59)=  Fr                    
!       x( 60)=  Frtemp                
!       x( 61)=  fvla                  
!       x( 62)=  fvlb                  
!       x( 63)=  deltafvl              
!       x( 64)=  w1                    
!       x( 65)=  w2                    
!       x( 66)=  w3                    
!       x( 67)=  w4                    
!       x( 68)=  w5                    
!       x( 69)=  w6                    
!       x( 70)=  w7                    
!       x( 71)=  w8                    
!       x( 72)=  deltaf                
!       x( 73)=  rocof                 
!       x( 74)=  abrocof               
!       x( 75)=  deltarocof            
!       x( 76)=  Ffri                  
!       x( 77)=  Ffr                   
!       x( 78)=  status                
!       x( 79)=  p1                    
!       x( 80)=  p2                    
!       x( 81)=  p3                    
!       x( 82)=  s1                    
!       x( 83)=  s2                    
!       x( 84)=  s3                    

!.........................................................................................................

subroutine inj_IBG22h(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 38
      nbaddpar= 22
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
      parname( 37)='protection'
      parname( 38)='support'
      parname( 39)='IN'
      parname( 40)='vxlv'
      parname( 41)='vylv'
      parname( 42)='Vref'
      parname( 43)='Pext'
      parname( 44)='Qext'
      parname( 45)='Iqref'
      parname( 46)='Ipref'
      parname( 47)='kpll'
      parname( 48)='theta_PLL'
      parname( 49)='Uplim'
      parname( 50)='Downlim'
      parname( 51)='Downlimdisc'
      parname( 52)='Uplimdis'
      parname( 53)='downlimdis'
      parname( 54)='ratemax'
      parname( 55)='rate'
      parname( 56)='fref'
      parname( 57)='Tlim'
      parname( 58)='Snom'
      parname( 59)='df_up'
      parname( 60)='df_dn'
      adix=  1
      adiy=  2
      nbxvar= 89
      nbzvar= 29

!........................................................................................
   case (define_obs)
      nbobs= 20
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

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 23)              
      obs(  4)=x( 24)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 46)              
      obs(  8)=x( 59)              
      obs(  9)=x( 29)              
      obs( 10)=x( 48)              
      obs( 11)=x( 50)              
      obs( 12)=x( 60)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 56)              
      obs( 16)=x( 21)              
      obs( 17)=x( 73)              
      obs( 18)=x( 78)              
      obs( 19)=x( 26)              
      obs( 20)=x( 77)              

!........................................................................................
   case (initialize)

!IN = {PN}
      prm( 39)= prm(  2)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 40)= vx + prm( 18)*ix - prm( 19)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 41)= vy + prm( 18)*iy + prm( 19)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 42)= dsqrt(prm( 40)**2 + prm( 41)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 43)= -prm( 40)*ix-prm( 41)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 44)= +prm( 40)*iy-prm( 41)*ix

!Iqref = -{Qext}/max(0.00001,{Vref})
      prm( 45)= -prm( 44)/max(0.00001,prm( 42))

!Ipref = -{Pext}/max(0.00001,{Vref})
      prm( 46)= -prm( 43)/max(0.00001,prm( 42))

!kpll = 10/({tau}*0.001)
      prm( 47)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/max(0.00001,{vxlv}))
      prm( 48)= atan(prm( 41)/max(0.00001,prm( 40)))

!Uplim = 9999
      prm( 49)= 9999

!Downlim = -9999
      prm( 50)= -9999

!Downlimdisc = 0
      prm( 51)= 0

!Uplimdis = 0
      prm( 52)= 0

!downlimdis = -9999
      prm( 53)= -9999

!ratemax = {Iprate}*{IN}
      prm( 54)= prm(  3)*prm( 39)

!rate = 0.1
      prm( 55)= 0.1

!fref = 1
      prm( 56)= 1

!Tlim = 0.01
      prm( 57)= 0.01

!Snom = {IN}*sbase
      prm( 58)= prm( 39)*sbase

!df_up = 1/{Rup}*{Snom}
      prm( 59)= 1/prm( 33)*prm( 58)

!df_dn = 1/{Rdn}*{Snom}
      prm( 60)= 1/prm( 34)*prm( 58)

!vxl =  {vxlv}
      x(  3)= prm( 40)

!vyl =  {vylv}
      x(  4)= prm( 41)

!Vt =  {Vref}
      x(  5)= prm( 42)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 48)

!Vm =  {Vref}
      x(  7)= prm( 42)

!x2 =  {Vref}
      x(  8)= prm( 42)

!Ip =  {Ipref}
      x(  9)= prm( 46)

!Iq =  {Iqref}
      x( 10)= prm( 45)

!Ipcmd =  {Ipref}
      x( 11)= prm( 46)

!Iqcmd =  {Iqref}
      x( 12)= prm( 45)

!Iqmax =  dsqrt({IN}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm( 39)**2 - prm( 46)**2 )

!Iqmin =  - dsqrt({IN}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm( 39)**2 - prm( 46)**2 )

!Ipmaxi =  {IN}
      x( 15)= prm( 39)

!Ipmax =  min({IN},{PMPP}/max(0.00001,{Vref}))
      x( 16)= min(prm( 39),prm(  1)/max(0.00001,prm( 42)))

!Ipmin =  -0.001
      x( 17)= -0.001

!x4 =  {Ipref}
      x( 18)= prm( 46)

!DeltaW =  0
      x( 19)= 0

!DeltaWf =   0
      x( 20)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 21)= -prm( 40)*sin(prm( 48)) + prm( 41)*cos(prm( 48))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 22)= prm( 40)*cos(prm( 48)) + prm( 41)*sin(prm( 48))

!Pgen =  -{Pext}
      x( 23)= -prm( 43)

!Qgen =  -{Qext}
      x( 24)= -prm( 44)

!Iqext =  0
      x( 25)= 0

!Fvl =  1
      x( 26)= 1

!Fvli =  1
      x( 27)= 1

!Fvhi =  1
      x( 28)= 1

!Fvh =  1
      x( 29)= 1

!z1 =  0.
      x( 30)= 0.

!x5 =  {Iqref}
      x( 31)= prm( 45)

!Iptemp =  {Ipref}
      x( 32)= prm( 46)

!Iqtemp =  {Iqref}
      x( 33)= prm( 45)

!x10 =  -{Vref}
      x( 34)= -prm( 42)

!x11 =  {Vref} - {Vmax}
      x( 35)= prm( 42) - prm(  9)

!z =  0.
      x( 36)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 37)= prm( 42) - prm( 25)

!Pflag =  1
      x( 38)= 1

!Pflagi =  1
      x( 39)= 1

!one =  1
      x( 40)= 1

!zero =  0
      x( 41)= 0

!vxlm =  {vxlv}
      x( 42)= prm( 40)

!vylm =  {vylv}
      x( 43)= prm( 41)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 44)= -0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 45)= 50*(-0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 46)= 50*(-0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1)

!Ffli =  1.
      x( 47)= 1.

!Ffl =  1.
      x( 48)= 1.

!Ffhi =  1.
      x( 49)= 1.

!Ffh =  1.
      x( 50)= 1.

!Ptot =  -{Pext}
      x( 51)= -prm( 43)

!deltafl =  50*[omega] - {fmin}
      x( 52)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 53)= prm( 16) - 50*omega

!mult =  1
      x( 54)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 55)= prm( 42) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 56)= -(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48)))*prm( 47) + 2*pi*50

!g =  0
      x( 57)= 0

!tr =  0
      x( 58)= 0

!Fr =  1
      x( 59)= 1

!Frtemp =  1
      x( 60)= 1

!fvla =  1
      x( 61)= 1

!fvlb =  1
      x( 62)= 1

!deltafvl =  -{Tr}
      x( 63)= -prm( 17)

!w1 =  0
      x( 64)= 0

!w2 =  0
      x( 65)= 0

!w3 =  0
      x( 66)= 0

!w4 =  0
      x( 67)= 0

!w5 =  0
      x( 68)= 0

!w6 =  0
      x( 69)= 0

!w7 =  0
      x( 70)= 0

!w8 =  0
      x( 71)= 0

!deltaf =  0
      x( 72)= 0

!rocof =  0
      x( 73)= 0

!abrocof =  0
      x( 74)= 0

!deltarocof =  {dfmax} - 0
      x( 75)= prm( 36) - 0

!Ffri =  1
      x( 76)= 1

!Ffr =  1
      x( 77)= 1

!status =  1
      x( 78)= 1

!p1 =  {protection}
      x( 79)= prm( 37)

!p2 =  1
      x( 80)= 1

!p3 =  1
      x( 81)= 1

!s1 = {support}
      x( 82)=prm( 38)

!s2 =  1
      x( 83)= 1

!s3 =  0
      x( 84)= 0

!& algeq				! voltage drop over line that connects PV, vxl is after impedance
      eqtyp(  1)=0

!& algeq
      eqtyp(  2)=0

!& algeq				! voltage magnitude at PV
      eqtyp(  3)=0

!& tf1p                          ! voltage magnitude
      eqtyp(  4)=  7
      tc(  4)=prm(  5)

!& max1v1c			! maximum between voltage and 0.01
      eqtyp(  5)=0
      if(x(  7)<0.01)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq                         ! maximum current computation
      eqtyp(  6)=0

!& algeq				! minimum current limit to -0.001
      eqtyp(  7)=0

!& limvb				! limit current Ipcmd
      eqtyp(  8)=0
      if(x( 18)>x( 16))then
         z(  2)=1
      elseif(x( 18)<x( 17))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq             ! compute status
      eqtyp(  9)=0

!& algeq
      eqtyp( 10)=0

!& algeq
      eqtyp( 11)=0

!& swsign
      eqtyp( 12)=0
      if(x( 79)>=0.)then
         z(  3)=1
      else
         z(  3)=2
      endif

!& algeq                     ! current computation
      eqtyp( 13)=0

!& tf1p2lim			! temporary current is
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 50)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 11)-x( 32)>prm( 54)*prm(  4))then
         z(  4)=1
      elseif(1*x( 11)-x( 32)<prm( 50)*prm(  4))then
         z(  4)=-1
      else
         z(  4)=0
      endif
      eqtyp( 14)=0
      if(x( 32)>prm( 49))then
         z(  5)=1
         eqtyp( 15)=0
      elseif(x( 32)<prm( 50))then
         z(  5)=-1
         eqtyp( 15)=0
      else
         z(  5)=0
         eqtyp( 15)= 32
      endif
      tc( 15)=prm(  4)

!& algeq                     ! include reactive current priority
      eqtyp( 16)=0

!& algeq
      eqtyp( 17)=0

!& algeq
      eqtyp( 18)=0

!& limvb
      eqtyp( 19)=0
      if(x( 31)>x( 13))then
         z(  6)=1
      elseif(x( 31)<x( 14))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq
      eqtyp( 20)=0

!& tf1p
      eqtyp( 21)= 33
      tc( 21)=prm(  4)

!& algeq			! active current limit
      eqtyp( 22)=0

!& algeq 				  ! MPP limit
      eqtyp( 23)=0

!& db                    ! Voltage support
      eqtyp( 24)=0
      if(x(  7)>prm( 26))then
         z(  7)=1
      elseif(x(  7)<prm( 25))then
         z(  7)=-1
      else
         z(  7)=0
      endif

!& algeq               !LVRT
      eqtyp( 25)=0

!& timer5
      eqtyp( 26)=0
      eqtyp( 27)=0
      z(  8)=-1
      x( 86)=0.

!& algeq
      eqtyp( 28)=0

!& hyst
      eqtyp( 29)=0
      if(x( 27)>1.1)then
         z(  9)=1
      elseif(x( 27)<0.9)then
         z(  9)=-1
      else
         if(1.>= 0.)then
            z(  9)=1
         else
            z(  9)=-1
         endif
      endif

!& algeq
      eqtyp( 30)=0

!& inlim
      if (1>= 0.005)then
         tc( 31)=1
      endif
      if (x( 58)>5)then
         z( 10)=1
         eqtyp( 31)=0
      elseif (x( 58)<0.) then
         z( 10)=-1
         eqtyp( 31)=0
      else
         z( 10)=0
         if (1>= 0.005)then
            eqtyp( 31)= 58
         else
            eqtyp( 31)=0
         endif
      endif

!& algeq
      eqtyp( 32)=0

!& algeq
      eqtyp( 33)=0

!& algeq
      eqtyp( 34)=0

!& swsign
      eqtyp( 35)=0
      if(x( 63)>=0.)then
         z( 11)=1
      else
         z( 11)=2
      endif

!& tf1p2lim
      if(prm( 57)< 0.001)then
         prm( 57)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 55)= huge(0.d0)
      endif
      if(1*x( 60)-x( 59)>prm( 55)*prm( 57))then
         z( 12)=1
      elseif(1*x( 60)-x( 59)<prm( 50)*prm( 57))then
         z( 12)=-1
      else
         z( 12)=0
      endif
      eqtyp( 36)=0
      if(x( 59)>prm( 49))then
         z( 13)=1
         eqtyp( 37)=0
      elseif(x( 59)<prm( 51))then
         z( 13)=-1
         eqtyp( 37)=0
      else
         z( 13)=0
         eqtyp( 37)= 59
      endif
      tc( 37)=prm( 57)

!& algeq             ! overvoltage protection
      eqtyp( 38)=0

!& pwlin4
      eqtyp( 39)=0
      if(x( 35)<(-999))then
         z( 14)=1
      elseif(x( 35)>=999)then
         z( 14)=   3
      elseif((-999)<=x( 35) .and. x( 35)<0.)then
         z( 14)=  1
      elseif(0.<=x( 35) .and. x( 35)<0.)then
         z( 14)=  2
      elseif(0.<=x( 35) .and. x( 35)<999)then
         z( 14)=  3
      endif

!& algeq
      eqtyp( 40)=0

!& hyst
      eqtyp( 41)=0
      if(x( 28)>1.1)then
         z( 15)=1
      elseif(x( 28)<0.9)then
         z( 15)=-1
      else
         if(1.>= 0.)then
            z( 15)=1
         else
            z( 15)=-1
         endif
      endif

!& algeq                     ! reactive current priority during undervoltage
      eqtyp( 42)=0

!& algeq
      eqtyp( 43)=0

!& algeq
      eqtyp( 44)=0

!& swsign
      eqtyp( 45)=0
      if(x( 37)>=0.)then
         z( 16)=1
      else
         z( 16)=2
      endif

!& algeq             ! switch support on and off
      eqtyp( 46)=0

!& algeq
      eqtyp( 47)=0

!& swsign            ! switch support off
      eqtyp( 48)=0
      if(x( 82)>=0.)then
         z( 17)=1
      else
         z( 17)=2
      endif

!& algeq         ! PLL
      eqtyp( 49)=0

!& swsign
      eqtyp( 50)=0
      if(x( 55)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 51)=0
      else
         eqtyp( 51)=  6
         tc( 51)=1.
      endif

!& pictl
      eqtyp( 52)= 88
      x( 88)=x( 56)
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& algeq
      eqtyp( 55)=0

!& tf1p
      eqtyp( 56)= 42
      tc( 56)=prm(  5)

!& tf1p
      eqtyp( 57)= 43
      tc( 57)=prm(  5)

!& algeq             ! frequency measurement
      eqtyp( 58)=0

!& algeq
      eqtyp( 59)=0

!& tf1p
      eqtyp( 60)= 46
      tc( 60)=0.1                 ! USED TO BE 1, 0.1 IN IBG3

!& algeq           ! frequency protection
      eqtyp( 61)=0

!& swsign
      eqtyp( 62)=0
      if(x( 52)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& algeq
      eqtyp( 63)=0

!& swsign
      eqtyp( 64)=0
      if(x( 53)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& hyst
      eqtyp( 65)=0
      if(x( 47)>1.1)then
         z( 21)=1
      elseif(x( 47)<0.9)then
         z( 21)=-1
      else
         if(1.>= 0.)then
            z( 21)=1
         else
            z( 21)=-1
         endif
      endif

!& hyst
      eqtyp( 66)=0
      if(x( 49)>1.1)then
         z( 22)=1
      elseif(x( 49)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control
      eqtyp( 67)=0

!& db
      eqtyp( 68)=0
      if(x( 64)>prm( 32))then
         z( 23)=1
      elseif(x( 64)<prm( 31))then
         z( 23)=-1
      else
         z( 23)=0
      endif

!& algeq
      eqtyp( 69)=0

!& algeq
      eqtyp( 70)=0

!& lim
      eqtyp( 71)=0
      if(x( 66)>(-0.00001))then
         z( 24)=1
      elseif(x( 66)<prm( 43))then
         z( 24)=-1
      else
         z( 24)=0
      endif

!& lim
      eqtyp( 72)=0
      if(x( 67)>(prm( 58)+prm( 43)))then
         z( 25)=1
      elseif(x( 67)<0.00001)then
         z( 25)=-1
      else
         z( 25)=0
      endif

!& algeq
      eqtyp( 73)=0

!& algeq
      eqtyp( 74)=0

!& swsign            ! switch support off
      eqtyp( 75)=0
      if(x( 82)>=0.)then
         z( 26)=1
      else
         z( 26)=2
      endif

!& algeq
      eqtyp( 76)=0

!& algeq             ! alignment
      eqtyp( 77)=0

!& algeq
      eqtyp( 78)=0

!& algeq
      eqtyp( 79)=0

!& algeq
      eqtyp( 80)=0

!& algeq
      eqtyp( 81)=0

!& algeq
      eqtyp( 82)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 83)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x( 89)=x( 72)
      eqtyp( 84)= 89
      tc( 84)=prm( 35)
      eqtyp( 85)=0

!& abs
      eqtyp( 86)=0
      if(x( 73)>0. )then
         z( 27)=1
      else
         z( 27)=-1
      endif

!& algeq               ! rocof protection
      eqtyp( 87)=0

!& swsign
      eqtyp( 88)=0
      if(x( 75)>=0.)then
         z( 28)=1
      else
         z( 28)=2
      endif

!& hyst
      eqtyp( 89)=0
      if(x( 76)>1.1)then
         z( 29)=1
      elseif(x( 76)<0.9)then
         z( 29)=-1
      else
         if(1.>= 0.)then
            z( 29)=1
         else
            z( 29)=-1
         endif
      endif

!........................................................................................
   case (evaluate_eqs)

!& algeq				! voltage drop over line that connects PV, vxl is after impedance
      f(  1)=vx + prm( 18)*x(  1) - prm( 19)*x(  2) - x(  3)

!& algeq
      f(  2)=vy + prm( 18)*x(  2) + prm( 19)*x(  1) - x(  4)

!& algeq				! voltage magnitude at PV
      f(  3)=x(  5) - dsqrt(x(  3)**2 + x(  4)**2)

!& tf1p                          ! voltage magnitude
      f(  4)=(-x(  7)+1.*x(  5))

!& max1v1c			! maximum between voltage and 0.01
      select case (z(  1))
         case(1)
            f(  5)=0.01-x(  8)
         case(2)
            f(  5)=x(  7)-x(  8)
      end select

!& algeq                         ! maximum current computation
      f(  6)=x( 51)/max(0.00001,x(  8)) - x( 18)

!& algeq				! minimum current limit to -0.001
      f(  7)=x( 17) + 0.001

!& limvb				! limit current Ipcmd
      select case (z(  2))
         case(0)
            f(  8)=x( 11)-x( 18)
         case(-1)
            f(  8)=x( 11)-x( 17)
         case(1)
            f(  8)=x( 11)-x( 16)
      end select

!& algeq             ! compute status
      f(  9)=x( 80) - x( 29)*x( 48)*x( 50)*x( 77)*x( 59)

!& algeq
      f( 10)=x( 79) - prm( 37)

!& algeq
      f( 11)=x( 81) - 1

!& swsign
      select case (z(  3))
         case(1)
            f( 12)=x( 78)-x( 80)
         case(2)
            f( 12)=x( 78)-x( 81)
      end select

!& algeq                     ! current computation
      f( 13)=x( 32)*x( 78) - x(  9)

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            f( 14)=x( 85)-1*x( 11)+x( 32)
         case(1)
            f( 14)=x( 85)-prm( 54)*prm(  4)
         case(-1)
            f( 14)=x( 85)-prm( 50)*prm(  4)
      end select
      select case (z(  5))
         case(0)
            f( 15)=x( 85)
         case(1)
            f( 15)=x( 32)-prm( 49)
         case(-1)
            f( 15)=x( 32)-prm( 50)
      end select

!& algeq                     ! include reactive current priority
      f( 16)=x( 13) -x( 38)*dsqrt(max(0.00001,prm( 39)**2 - x( 11)**2))

!& algeq
      f( 17)=x( 14) + x( 38)*dsqrt(max(0.00001,prm( 39)**2 - x( 11)**2))

!& algeq
      f( 18)=-x( 25) + prm( 45) - x( 31)

!& limvb
      select case (z(  6))
         case(0)
            f( 19)=x( 12)-x( 31)
         case(-1)
            f( 19)=x( 12)-x( 14)
         case(1)
            f( 19)=x( 12)-x( 13)
      end select

!& algeq
      f( 20)=x( 33)*x( 78) - x( 10)

!& tf1p
      f( 21)=(-x( 33)+1.*x( 12))

!& algeq			! active current limit
      f( 22)=x( 15) - x( 38)*prm( 39) -  (1-x( 38))*dsqrt(max(0.d0,prm( 39)**2 - x( 12)**2))

!& algeq 				  ! MPP limit
      f( 23)=- x( 16) + min(x( 15), prm(  1)/max(0.0001,x(  8)))

!& db                    ! Voltage support
      select case (z(  7))
         case(0)
            f( 24)=x( 25)
         case(-1)
            f( 24)=x( 25)-(-prm( 23)*prm( 39)*(prm( 20) + prm( 29)))-(prm( 21)*prm( 39)*(prm( 20) + prm( 29) ))*(x(  7)-prm( 25))
         case(1)
            f( 24)=x( 25)-prm( 24)*prm( 39)-prm( 22)*prm( 39)*prm( 27)*(x(  7)-prm( 26))
      end select

!& algeq               !LVRT
      f( 25)=x(  7) + x( 34)

!& timer5
      select case (z(  8))
         case (-1)
            f( 26)=x( 36)
            f( 27)=x( 86)
         case (0)
            f( 26)=x( 36)
            f( 27)= 1.
         case (1)
            f( 26)=x( 36)-1.
            f( 27)= 0.
      end select

!& algeq
      f( 28)=x( 27) -1 + x( 36)

!& hyst
      if(z(  9) == 1)then
         f( 29)=x( 26)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 29)=x( 26)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 30)=x( 57) - 1 + x( 26)

!& inlim
      if (1>= 0.005)then
         select case (z( 10))
            case(0)
               f( 31)=x( 57)
            case(1)
               f( 31)=x( 58)-5
            case(-1)
               f( 31)=x( 58)-0.
         end select
      else
         select case (z( 10))
            case(0)
               f( 31)=x( 57)-x( 58)
            case(1)
               f( 31)=x( 58)-5
            case(-1)
               f( 31)=x( 58)-0.
         end select
      endif

!& algeq
      f( 32)=x( 61) - 1

!& algeq
      f( 33)=x( 62) - 1 + x( 57)

!& algeq
      f( 34)=x( 63) + prm( 17) - x( 58)

!& swsign
      select case (z( 11))
         case(1)
            f( 35)=x( 60)-x( 61)
         case(2)
            f( 35)=x( 60)-x( 62)
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            f( 36)=x( 87)-1*x( 60)+x( 59)
         case(1)
            f( 36)=x( 87)-prm( 55)*prm( 57)
         case(-1)
            f( 36)=x( 87)-prm( 50)*prm( 57)
      end select
      select case (z( 13))
         case(0)
            f( 37)=x( 87)
         case(1)
            f( 37)=x( 59)-prm( 49)
         case(-1)
            f( 37)=x( 59)-prm( 51)
      end select

!& algeq             ! overvoltage protection
      f( 38)=x( 35) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 14))
         case (  1)
            f( 39)=0.+ ( (0.-0.)*(x( 35)-(-999))/(0.-(-999)) ) -x( 30)
         case (  2)
            f( 39)=0.+ ( (1.-0.)*(x( 35)-0.)/(0.-0.) ) -x( 30)
         case (  3)
            f( 39)=1.+ ( (1.-1.)*(x( 35)-0.)/(999-0.) ) -x( 30)
      end select

!& algeq
      f( 40)=x( 28) -1 + x( 30)

!& hyst
      if(z( 15) == 1)then
         f( 41)=x( 29)-1.-(1.-1.)*(x( 28)-1.1)/(1.1-0.9)
      else
         f( 41)=x( 29)-0.-(0.-0.)*(x( 28)-0.9)/(1.1-0.9)
      endif

!& algeq                     ! reactive current priority during undervoltage
      f( 42)=x( 37) - x(  7) + prm( 25)

!& algeq
      f( 43)=x( 40) - 1

!& algeq
      f( 44)=x( 41)

!& swsign
      select case (z( 16))
         case(1)
            f( 45)=x( 39)-x( 40)
         case(2)
            f( 45)=x( 39)-x( 41)
      end select

!& algeq             ! switch support on and off
      f( 46)=x( 82) - prm( 38)

!& algeq
      f( 47)=x( 83) - 1

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            f( 48)=x( 38)-x( 39)
         case(2)
            f( 48)=x( 38)-x( 83)
      end select

!& algeq         ! PLL
      f( 49)=x( 55) - x(  7) + prm( 11)

!& swsign
      select case (z( 18))
         case(1)
            f( 50)=x( 54)-x( 40)
         case(2)
            f( 50)=x( 54)-x( 41)
      end select

!& int
      if (1.< 0.005)then
         f( 51)=x( 20)-x(  6)
      else
         f( 51)=x( 20)
      endif

!& pictl
      f( 52)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 21)
      f( 53)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 21)+x( 88)-x( 56)

!& algeq
      f( 54)=x( 19) - x( 56) + omega*2*pi*50

!& algeq
      f( 55)=x( 20) - x( 19)*x( 54)

!& tf1p
      f( 56)=(-x( 42)+1.*x(  3))

!& tf1p
      f( 57)=(-x( 43)+1.*x(  4))

!& algeq             ! frequency measurement
      f( 58)=x( 44) - x( 56)/(2*pi*50)

!& algeq
      f( 59)=x( 45) - 50*x( 44)

!& tf1p
      f( 60)=(-x( 46)+1.*x( 45))

!& algeq           ! frequency protection
      f( 61)=x( 52) - x( 46) + prm( 15)

!& swsign
      select case (z( 19))
         case(1)
            f( 62)=x( 47)-x( 40)
         case(2)
            f( 62)=x( 47)-x( 41)
      end select

!& algeq
      f( 63)=x( 53) - prm( 16) + x( 46)

!& swsign
      select case (z( 20))
         case(1)
            f( 64)=x( 49)-x( 40)
         case(2)
            f( 64)=x( 49)-x( 41)
      end select

!& hyst
      if(z( 21) == 1)then
         f( 65)=x( 48)-1.-(1.-1.)*(x( 47)-1.1)/(1.1-0.9)
      else
         f( 65)=x( 48)-0.-(0.-0.)*(x( 47)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 22) == 1)then
         f( 66)=x( 50)-1.-(1.-1.)*(x( 49)-1.1)/(1.1-0.9)
      else
         f( 66)=x( 50)-0.-(0.-0.)*(x( 49)-0.9)/(1.1-0.9)
      endif

!& algeq                 ! frequency droop control
      f( 67)=x( 64) + (x( 46)/50) - prm( 56)

!& db
      select case (z( 23))
         case(0)
            f( 68)=x( 65)
         case(-1)
            f( 68)=x( 65)-0.-1.*(x( 64)-prm( 31))
         case(1)
            f( 68)=x( 65)-0.-1.*(x( 64)-prm( 32))
      end select

!& algeq
      f( 69)=x( 66) - x( 65)*prm( 60)

!& algeq
      f( 70)=x( 67) - x( 65)*prm( 59)

!& lim
      select case (z( 24))
         case(0)
            f( 71)=x( 68)-x( 66)
         case(-1)
            f( 71)=x( 68)-prm( 43)
         case(1)
            f( 71)=x( 68)-(-0.00001)
      end select

!& lim
      select case (z( 25))
         case(0)
            f( 72)=x( 69)-x( 67)
         case(-1)
            f( 72)=x( 69)-0.00001
         case(1)
            f( 72)=x( 69)-(prm( 58)+prm( 43))
      end select

!& algeq
      f( 73)=x( 70)-x( 69)-x( 68)

!& algeq
      f( 74)=x( 84)

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            f( 75)=x( 71)-x( 70)
         case(2)
            f( 75)=x( 71)-x( 84)
      end select

!& algeq
      f( 76)=x( 51)+prm( 43)-x( 71)

!& algeq             ! alignment
      f( 77)=x( 22) - x( 42)*cos(x(  6)) - x( 43)*sin(x(  6))

!& algeq
      f( 78)=x( 21) + x( 42)*sin(x(  6)) - x( 43)*cos(x(  6))

!& algeq
      f( 79)=x( 23) - x( 22)*x(  9)

!& algeq
      f( 80)=x( 24) - x( 22)*x( 10)

!& algeq
      f( 81)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f( 82)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!& algeq                ! frequency deviation in Hz
      f( 83)=-x( 72) + x( 46)-prm( 56)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 84)=-x( 89)+x( 72)
      if (prm( 35)< 0.005)then
         f( 85)=1/prm( 35)*x( 72)-x( 73)
      else
         f( 85)=1/prm( 35)*(x( 72)-x( 89))-x( 73)
      endif

!& abs
      if(z( 27) == 1 )then
         f( 86)=x( 74)-x( 73)
      else
         f( 86)=x( 74)+x( 73)
      endif

!& algeq               ! rocof protection
      f( 87)=-x( 75) +prm( 36) -x( 74)

!& swsign
      select case (z( 28))
         case(1)
            f( 88)=x( 76)-x( 40)
         case(2)
            f( 88)=x( 76)-x( 41)
      end select

!& hyst
      if(z( 29) == 1)then
         f( 89)=x( 77)-1.-(1.-1.)*(x( 76)-1.1)/(1.1-0.9)
      else
         f( 89)=x( 77)-0.-(0.-0.)*(x( 76)-0.9)/(1.1-0.9)
      endif

!........................................................................................
   case (update_disc)

!& algeq				! voltage drop over line that connects PV, vxl is after impedance

!& algeq

!& algeq				! voltage magnitude at PV

!& tf1p                          ! voltage magnitude

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

!& algeq                         ! maximum current computation

!& algeq				! minimum current limit to -0.001

!& limvb				! limit current Ipcmd
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

!& algeq             ! compute status

!& algeq

!& algeq

!& swsign
      select case (z(  3))
         case(1)
            if(x( 79)<0.)then
               z(  3)=2
            endif
         case(2)
            if(x( 79)>=0.)then
               z(  3)=1
            endif
      end select

!& algeq                     ! current computation

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            if(x( 85)>prm( 54)*prm(  4))then
               z(  4)=1
            elseif(x( 85)<prm( 50)*prm(  4))then
               z(  4)=-1
            endif
         case(1)
            if(1*x( 11)-x( 32)<prm( 54)*prm(  4))then
               z(  4)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 32)>prm( 50)*prm(  4))then
               z(  4)= 0
            endif
      end select
      select case (z(  5))
         case(0)
            if(x( 32)>prm( 49))then
               z(  5)=1
               eqtyp( 15)=0
            elseif(x( 32)<prm( 50))then
               z(  5)=-1
               eqtyp( 15)=0
            endif
         case(1)
            if (x( 85)<0.)then
               z(  5)= 0
               eqtyp( 15)= 32
            endif
         case(-1)
            if(x( 85)>0.)then
               z(  5)= 0
               eqtyp( 15)= 32
            endif
      end select

!& algeq                     ! include reactive current priority

!& algeq

!& algeq

!& limvb
      select case (z(  6))
         case(0)
            if(x( 31)>x( 13))then
               z(  6)=1
            elseif(x( 31)<x( 14))then
               z(  6)=-1
            endif
         case(-1)
            if(x( 31)>x( 14))then
               z(  6)=0
            endif
         case(1)
            if(x( 31)<x( 13))then
               z(  6)=0
            endif
      end select

!& algeq

!& tf1p

!& algeq			! active current limit

!& algeq 				  ! MPP limit

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
         if(x( 34) >= (-prm( 12)))then
            z(  8)=0
            eqtyp( 27)= 86
         endif
      else
         if(x( 34) < (-prm( 12)))then
            z(  8)=-1
            eqtyp( 27)=0
         endif
      endif
      if(z(  8) == 0)then
         if(x( 34) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 86) > 0.)then
               z(  8)=1
            endif
         elseif(x( 34) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 86) > prm(  6)+(0.-prm(  6))*(x( 34)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 34) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 86) > prm(  6)+(prm(  6)-prm(  6))*(x( 34)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 34) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 86) > prm(  8)+(prm(  6)-prm(  8))*(x( 34)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 34) > (-prm( 12)))then
            if(x( 86) > prm(  7)+(prm(  8)-prm(  7))*(x( 34)-(-prm( 12)))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-prm( 12))))then
               z(  8)=1
            endif
         endif
      endif

!& algeq

!& hyst
      if (z(  9) == -1)then
         if(x( 27)>1.1)then
            z(  9)=1
         endif
      else
         if(x( 27)<0.9)then
            z(  9)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 10))
            case(0)
               if(x( 58)<0.)then
                  z( 10)=-1
                  eqtyp( 31)=0
               elseif(x( 58)>5)then
                  z( 10)= 1
                  eqtyp( 31)=0
               endif
            case(1)
               if(x( 57)<0.)then
                  z( 10)=0
                  eqtyp( 31)= 58
               endif
            case(-1)
               if(x( 57)>0.)then
                  z( 10)=0
                  eqtyp( 31)= 58
               endif
         end select
      else
         select case (z( 10))
            case(0)
               if(x( 58)<0.)then
                  z( 10)=-1
               elseif(x( 58)>5)then
                  z( 10)= 1
               endif
            case(1)
               if(x( 57)<5)then
                  z( 10)=0
               endif
            case(-1)
               if(x( 57)>0.)then
                  z( 10)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 11))
         case(1)
            if(x( 63)<0.)then
               z( 11)=2
            endif
         case(2)
            if(x( 63)>=0.)then
               z( 11)=1
            endif
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            if(x( 87)>prm( 55)*prm( 57))then
               z( 12)=1
            elseif(x( 87)<prm( 50)*prm( 57))then
               z( 12)=-1
            endif
         case(1)
            if(1*x( 60)-x( 59)<prm( 55)*prm( 57))then
               z( 12)= 0
            endif
         case(-1)
            if(1*x( 60)-x( 59)>prm( 50)*prm( 57))then
               z( 12)= 0
            endif
      end select
      select case (z( 13))
         case(0)
            if(x( 59)>prm( 49))then
               z( 13)=1
               eqtyp( 37)=0
            elseif(x( 59)<prm( 51))then
               z( 13)=-1
               eqtyp( 37)=0
            endif
         case(1)
            if (x( 87)<0.)then
               z( 13)= 0
               eqtyp( 37)= 59
            endif
         case(-1)
            if(x( 87)>0.)then
               z( 13)= 0
               eqtyp( 37)= 59
            endif
      end select

!& algeq             ! overvoltage protection

!& pwlin4
      if(x( 35)<(-999))then
         z( 14)=1
      elseif(x( 35)>=999)then
         z( 14)=  3
      elseif((-999)<=x( 35) .and. x( 35)<0.)then
         z( 14)=  1
      elseif(0.<=x( 35) .and. x( 35)<0.)then
         z( 14)=  2
      elseif(0.<=x( 35) .and. x( 35)<999)then
         z( 14)=  3
      endif

!& algeq

!& hyst
      if (z( 15) == -1)then
         if(x( 28)>1.1)then
            z( 15)=1
         endif
      else
         if(x( 28)<0.9)then
            z( 15)=-1
         endif
      endif

!& algeq                     ! reactive current priority during undervoltage

!& algeq

!& algeq

!& swsign
      select case (z( 16))
         case(1)
            if(x( 37)<0.)then
               z( 16)=2
            endif
         case(2)
            if(x( 37)>=0.)then
               z( 16)=1
            endif
      end select

!& algeq             ! switch support on and off

!& algeq

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            if(x( 82)<0.)then
               z( 17)=2
            endif
         case(2)
            if(x( 82)>=0.)then
               z( 17)=1
            endif
      end select

!& algeq         ! PLL

!& swsign
      select case (z( 18))
         case(1)
            if(x( 55)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 55)>=0.)then
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

!& algeq           ! frequency protection

!& swsign
      select case (z( 19))
         case(1)
            if(x( 52)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 52)>=0.)then
               z( 19)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 20))
         case(1)
            if(x( 53)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 53)>=0.)then
               z( 20)=1
            endif
      end select

!& hyst
      if (z( 21) == -1)then
         if(x( 47)>1.1)then
            z( 21)=1
         endif
      else
         if(x( 47)<0.9)then
            z( 21)=-1
         endif
      endif

!& hyst
      if (z( 22) == -1)then
         if(x( 49)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 49)<0.9)then
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control

!& db
      select case (z( 23))
         case(0)
            if(x( 64)>prm( 32))then
               z( 23)=1
            elseif(x( 64)<prm( 31))then
               z( 23)=-1
            endif
         case(-1)
            if(x( 64)>prm( 31))then
               z( 23)=0
            endif
         case(1)
            if(x( 64)<prm( 32))then
               z( 23)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 24))
         case(0)
            if(x( 66)>(-0.00001))then
               z( 24)=1
            elseif(x( 66)<prm( 43))then
               z( 24)=-1
            endif
         case(-1)
            if(x( 66)>prm( 43))then
               z( 24)=0
            endif
         case(1)
            if(x( 66)<(-0.00001))then
               z( 24)=0
            endif
      end select

!& lim
      select case (z( 25))
         case(0)
            if(x( 67)>(prm( 58)+prm( 43)))then
               z( 25)=1
            elseif(x( 67)<0.00001)then
               z( 25)=-1
            endif
         case(-1)
            if(x( 67)>0.00001)then
               z( 25)=0
            endif
         case(1)
            if(x( 67)<(prm( 58)+prm( 43)))then
               z( 25)=0
            endif
      end select

!& algeq

!& algeq

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            if(x( 82)<0.)then
               z( 26)=2
            endif
         case(2)
            if(x( 82)>=0.)then
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
         if(x( 73)> blocktol1 )then
            z( 27)=1
         endif
      else
         if(x( 73)< - blocktol1 )then
            z( 27)=-1
         endif
      endif

!& algeq               ! rocof protection

!& swsign
      select case (z( 28))
         case(1)
            if(x( 75)<0.)then
               z( 28)=2
            endif
         case(2)
            if(x( 75)>=0.)then
               z( 28)=1
            endif
      end select

!& hyst
      if (z( 29) == -1)then
         if(x( 76)>1.1)then
            z( 29)=1
         endif
      else
         if(x( 76)<0.9)then
            z( 29)=-1
         endif
      endif
   end select

end subroutine inj_IBG22h
