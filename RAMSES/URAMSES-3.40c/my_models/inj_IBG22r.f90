!  MODEL NAME : inj_IBG22r              
!  MODEL DESCRIPTION FILE : IBG22r.txt
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
!       prm( 37)=  protection                      -1 to switch off, 1 to switch on
!       prm( 38)=  support
!  Parameters :
!       prm( 39)=  vxlv  
!       prm( 40)=  vylv  
!       prm( 41)=  Vref  
!       prm( 42)=  Pext  
!       prm( 43)=  Qext  
!       prm( 44)=  Iqref  
!       prm( 45)=  Ipref  
!       prm( 46)=  kpll  
!       prm( 47)=  theta_PLL  
!       prm( 48)=  Uplim  
!       prm( 49)=  Downlim  
!       prm( 50)=  Downlimdisc  
!       prm( 51)=  Uplimdis  
!       prm( 52)=  downlimdis  
!       prm( 53)=  ratemax  
!       prm( 54)=  rate  
!       prm( 55)=  fref  
!       prm( 56)=  Tlim  
!       prm( 57)=  df_up  
!       prm( 58)=  df_dn  
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
!       x( 39)=  one                   
!       x( 40)=  zero                  
!       x( 41)=  vxlm                  
!       x( 42)=  vylm                  
!       x( 43)=  omegam                
!       x( 44)=  fm                    
!       x( 45)=  fmfilt                
!       x( 46)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 47)=  Ffl                   
!       x( 48)=  Ffhi                  
!       x( 49)=  Ffh                   
!       x( 50)=  Ptot                  
!       x( 51)=  deltafl               
!       x( 52)=  deltafh               
!       x( 53)=  mult                  
!       x( 54)=  deltaVPLL             
!       x( 55)=  wpll                  
!       x( 56)=  g                     
!       x( 57)=  tr                    
!       x( 58)=  Fr                    
!       x( 59)=  Frtemp                
!       x( 60)=  fvla                  
!       x( 61)=  fvlb                  
!       x( 62)=  deltafvl              
!       x( 63)=  w1                    
!       x( 64)=  w2                    
!       x( 65)=  w3                    
!       x( 66)=  w4                    
!       x( 67)=  w5                    
!       x( 68)=  w6                    
!       x( 69)=  w7                    
!       x( 70)=  w8                    
!       x( 71)=  deltaf                
!       x( 72)=  rocof                 
!       x( 73)=  abrocof               
!       x( 74)=  deltarocof            
!       x( 75)=  Ffri                  
!       x( 76)=  Ffr                   
!       x( 77)=  status                
!       x( 78)=  p1                    
!       x( 79)=  p2                    
!       x( 80)=  p3                    
!       x( 81)=  s1                    
!       x( 82)=  s2                    
!       x( 83)=  s3                    

!.........................................................................................................

subroutine inj_IBG22r(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbaddpar= 20
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
      parname( 37)='protection'
      parname( 38)='support'
      parname( 39)='vxlv'
      parname( 40)='vylv'
      parname( 41)='Vref'
      parname( 42)='Pext'
      parname( 43)='Qext'
      parname( 44)='Iqref'
      parname( 45)='Ipref'
      parname( 46)='kpll'
      parname( 47)='theta_PLL'
      parname( 48)='Uplim'
      parname( 49)='Downlim'
      parname( 50)='Downlimdisc'
      parname( 51)='Uplimdis'
      parname( 52)='downlimdis'
      parname( 53)='ratemax'
      parname( 54)='rate'
      parname( 55)='fref'
      parname( 56)='Tlim'
      parname( 57)='df_up'
      parname( 58)='df_dn'
      adix=  1
      adiy=  2
      nbxvar= 88
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
      obs(  3)=x( 22)              
      obs(  4)=x( 23)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 45)              
      obs(  8)=x( 58)              
      obs(  9)=x( 28)              
      obs( 10)=x( 47)              
      obs( 11)=x( 49)              
      obs( 12)=x( 59)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 55)              
      obs( 16)=x( 20)              
      obs( 17)=x( 72)              
      obs( 18)=x( 77)              
      obs( 19)=x( 25)              
      obs( 20)=x( 76)              

!........................................................................................
   case (initialize)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 39)= vx + prm( 18)*ix - prm( 19)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 40)= vy + prm( 18)*iy + prm( 19)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 41)= dsqrt(prm( 39)**2 + prm( 40)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 42)= -prm( 39)*ix-prm( 40)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 43)= +prm( 39)*iy-prm( 40)*ix

!Iqref = -{Qext}/{Vref}
      prm( 44)= -prm( 43)/prm( 41)

!Ipref = -{Pext}/{Vref}
      prm( 45)= -prm( 42)/prm( 41)

!kpll = 10/({tau}*0.001)
      prm( 46)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 47)= atan(prm( 40)/prm( 39))

!Uplim = 9999
      prm( 48)= 9999

!Downlim = -9999
      prm( 49)= -9999

!Downlimdisc = 0
      prm( 50)= 0

!Uplimdis = 0
      prm( 51)= 0

!downlimdis = -9999
      prm( 52)= -9999

!ratemax = {Iprate}*{IN}
      prm( 53)= prm(  3)*prm(  2)

!rate = 0.1
      prm( 54)= 0.1

!fref = 1
      prm( 55)= 1

!Tlim = 0.01
      prm( 56)= 0.01

!df_up = 1/{Rup}
      prm( 57)= 1/prm( 33)

!df_dn = 1/{Rdn}
      prm( 58)= 1/prm( 34)

!vxl =  {vxlv}
      x(  3)= prm( 39)

!vyl =  {vylv}
      x(  4)= prm( 40)

!Vt =  {Vref}
      x(  5)= prm( 41)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 47)

!Vm =  {Vref}
      x(  7)= prm( 41)

!x2 =  {Vref}
      x(  8)= prm( 41)

!Ip =  {Ipref}
      x(  9)= prm( 45)

!Iq =  {Iqref}
      x( 10)= prm( 44)

!Ipcmd =  {Ipref}
      x( 11)= prm( 45)

!Iqcmd =  {Iqref}
      x( 12)= prm( 44)

!Iqmax =  dsqrt({Imax}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm(  1)**2 - prm( 45)**2 )

!Iqmin =  - dsqrt({Imax}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm(  1)**2 - prm( 45)**2 )

!Ipmax =  {IN}
      x( 15)= prm(  2)

!Ipmin =  -0.001
      x( 16)= -0.001

!x4 =  {Ipref}
      x( 17)= prm( 45)

!DeltaW =  0
      x( 18)= 0

!DeltaWf =   0
      x( 19)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 20)= -prm( 39)*sin(prm( 47)) + prm( 40)*cos(prm( 47))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 21)= prm( 39)*cos(prm( 47)) + prm( 40)*sin(prm( 47))

!Pgen =  -{Pext}
      x( 22)= -prm( 42)

!Qgen =  -{Qext}
      x( 23)= -prm( 43)

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
      x( 30)= prm( 44)

!Iptemp =  {Ipref}
      x( 31)= prm( 45)

!Iqtemp =  {Iqref}
      x( 32)= prm( 44)

!x10 =  -{Vref}
      x( 33)= -prm( 41)

!x11 =  {Vref} - {Vmax}
      x( 34)= prm( 41) - prm(  9)

!z =  0.
      x( 35)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 36)= prm( 41) - prm( 25)

!Pflag =  1
      x( 37)= 1

!Pflagi =  1
      x( 38)= 1

!one =  1
      x( 39)= 1

!zero =  0
      x( 40)= 0

!vxlm =  {vxlv}
      x( 41)= prm( 39)

!vylm =  {vylv}
      x( 42)= prm( 40)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 43)= -0.5*(prm( 39)*sin(prm( 47)) - prm( 40)*cos(prm( 47))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 44)= 50*(-0.5*(prm( 39)*sin(prm( 47)) - prm( 40)*cos(prm( 47))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 45)= 50*(-0.5*(prm( 39)*sin(prm( 47)) - prm( 40)*cos(prm( 47))) + 1)

!Ffli =  1.
      x( 46)= 1.

!Ffl =  1.
      x( 47)= 1.

!Ffhi =  1.
      x( 48)= 1.

!Ffh =  1.
      x( 49)= 1.

!Ptot =  -{Pext}
      x( 50)= -prm( 42)

!deltafl =  50*[omega] - {fmin}
      x( 51)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 52)= prm( 16) - 50*omega

!mult =  1
      x( 53)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 54)= prm( 41) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 55)= -(prm( 39)*sin(prm( 47)) - prm( 40)*cos(prm( 47)))*prm( 46) + 2*pi*50

!g =  0
      x( 56)= 0

!tr =  0
      x( 57)= 0

!Fr =  1
      x( 58)= 1

!Frtemp =  1
      x( 59)= 1

!fvla =  1
      x( 60)= 1

!fvlb =  1
      x( 61)= 1

!deltafvl =  -{Tr}
      x( 62)= -prm( 17)

!w1 =  0
      x( 63)= 0

!w2 =  0
      x( 64)= 0

!w3 =  0
      x( 65)= 0

!w4 =  0
      x( 66)= 0

!w5 =  0
      x( 67)= 0

!w6 =  0
      x( 68)= 0

!w7 =  0
      x( 69)= 0

!w8 =  0
      x( 70)= 0

!deltaf =  0
      x( 71)= 0

!rocof =  0
      x( 72)= 0

!abrocof =  0
      x( 73)= 0

!deltarocof =  {dfmax} - 0
      x( 74)= prm( 36) - 0

!Ffri =  1
      x( 75)= 1

!Ffr =  1
      x( 76)= 1

!status =  1
      x( 77)= 1

!p1 =  {protection}
      x( 78)= prm( 37)

!p2 =  1
      x( 79)= 1

!p3 =  1
      x( 80)= 1

!s1 = {support}
      x( 81)=prm( 38)

!s2 =  1
      x( 82)= 1

!s3 =  0
      x( 83)= 0

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
      if(x( 17)>x( 15))then
         z(  2)=1
      elseif(x( 17)<x( 16))then
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
      if(x( 78)>=0.)then
         z(  3)=1
      else
         z(  3)=2
      endif

!& algeq                     ! current computation
      eqtyp( 13)=0

!& tf1p2lim			! temporary current is
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 49)=-huge(0.d0)
         prm( 48)= huge(0.d0)
         prm( 49)=-huge(0.d0)
         prm( 53)= huge(0.d0)
      endif
      if(1*x( 11)-x( 31)>prm( 53)*prm(  4))then
         z(  4)=1
      elseif(1*x( 11)-x( 31)<prm( 49)*prm(  4))then
         z(  4)=-1
      else
         z(  4)=0
      endif
      eqtyp( 14)=0
      if(x( 31)>prm( 48))then
         z(  5)=1
         eqtyp( 15)=0
      elseif(x( 31)<prm( 49))then
         z(  5)=-1
         eqtyp( 15)=0
      else
         z(  5)=0
         eqtyp( 15)= 31
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
      if(x( 30)>x( 13))then
         z(  6)=1
      elseif(x( 30)<x( 14))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq
      eqtyp( 20)=0

!& tf1p
      eqtyp( 21)= 32
      tc( 21)=prm(  4)

!& algeq			! active current limit
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
      x( 85)=0.

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
      if (x( 57)>5)then
         z( 10)=1
         eqtyp( 30)=0
      elseif (x( 57)<0.) then
         z( 10)=-1
         eqtyp( 30)=0
      else
         z( 10)=0
         if (1>= 0.005)then
            eqtyp( 30)= 57
         else
            eqtyp( 30)=0
         endif
      endif

!& algeq
      eqtyp( 31)=0

!& algeq
      eqtyp( 32)=0

!& algeq
      eqtyp( 33)=0

!& swsign
      eqtyp( 34)=0
      if(x( 62)>=0.)then
         z( 11)=1
      else
         z( 11)=2
      endif

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 50)=-huge(0.d0)
         prm( 48)= huge(0.d0)
         prm( 49)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 59)-x( 58)>prm( 54)*prm( 56))then
         z( 12)=1
      elseif(1*x( 59)-x( 58)<prm( 49)*prm( 56))then
         z( 12)=-1
      else
         z( 12)=0
      endif
      eqtyp( 35)=0
      if(x( 58)>prm( 48))then
         z( 13)=1
         eqtyp( 36)=0
      elseif(x( 58)<prm( 50))then
         z( 13)=-1
         eqtyp( 36)=0
      else
         z( 13)=0
         eqtyp( 36)= 58
      endif
      tc( 36)=prm( 56)

!& algeq             ! overvoltage protection
      eqtyp( 37)=0

!& pwlin4
      eqtyp( 38)=0
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
      eqtyp( 39)=0

!& hyst
      eqtyp( 40)=0
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
      eqtyp( 41)=0

!& algeq
      eqtyp( 42)=0

!& algeq
      eqtyp( 43)=0

!& swsign
      eqtyp( 44)=0
      if(x( 36)>=0.)then
         z( 16)=1
      else
         z( 16)=2
      endif

!& algeq             ! switch support on and off
      eqtyp( 45)=0

!& algeq
      eqtyp( 46)=0

!& swsign            ! switch support off
      eqtyp( 47)=0
      if(x( 81)>=0.)then
         z( 17)=1
      else
         z( 17)=2
      endif

!& algeq         ! PLL
      eqtyp( 48)=0

!& swsign
      eqtyp( 49)=0
      if(x( 54)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 50)=0
      else
         eqtyp( 50)=  6
         tc( 50)=1.
      endif

!& pictl
      eqtyp( 51)= 87
      x( 87)=x( 55)
      eqtyp( 52)=0

!& algeq
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& tf1p
      eqtyp( 55)= 41
      tc( 55)=prm(  5)

!& tf1p
      eqtyp( 56)= 42
      tc( 56)=prm(  5)

!& algeq             ! frequency measurement
      eqtyp( 57)=0

!& algeq
      eqtyp( 58)=0

!& tf1p
      eqtyp( 59)= 45
      tc( 59)=0.1                 ! USED TO BE 1, 0.1 IN IBG3

!& algeq           ! frequency protection
      eqtyp( 60)=0

!& swsign
      eqtyp( 61)=0
      if(x( 51)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& algeq
      eqtyp( 62)=0

!& swsign
      eqtyp( 63)=0
      if(x( 52)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& hyst
      eqtyp( 64)=0
      if(x( 46)>1.1)then
         z( 21)=1
      elseif(x( 46)<0.9)then
         z( 21)=-1
      else
         if(1.>= 0.)then
            z( 21)=1
         else
            z( 21)=-1
         endif
      endif

!& hyst
      eqtyp( 65)=0
      if(x( 48)>1.1)then
         z( 22)=1
      elseif(x( 48)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control
      eqtyp( 66)=0

!& db
      eqtyp( 67)=0
      if(x( 63)>prm( 32))then
         z( 23)=1
      elseif(x( 63)<prm( 31))then
         z( 23)=-1
      else
         z( 23)=0
      endif

!& algeq
      eqtyp( 68)=0

!& algeq
      eqtyp( 69)=0

!& lim
      eqtyp( 70)=0
      if(x( 65)>(-0.00001))then
         z( 24)=1
      elseif(x( 65)<(-99999.))then
         z( 24)=-1
      else
         z( 24)=0
      endif

!& lim
      eqtyp( 71)=0
      if(x( 66)>99999.)then
         z( 25)=1
      elseif(x( 66)<0.00001)then
         z( 25)=-1
      else
         z( 25)=0
      endif

!& algeq
      eqtyp( 72)=0

!& algeq
      eqtyp( 73)=0

!& swsign            ! switch support off
      eqtyp( 74)=0
      if(x( 81)>=0.)then
         z( 26)=1
      else
         z( 26)=2
      endif

!& algeq
      eqtyp( 75)=0

!& algeq             ! alignment
      eqtyp( 76)=0

!& algeq
      eqtyp( 77)=0

!& algeq
      eqtyp( 78)=0

!& algeq
      eqtyp( 79)=0

!& algeq
      eqtyp( 80)=0

!& algeq
      eqtyp( 81)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 82)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x( 88)=x( 71)
      eqtyp( 83)= 88
      tc( 83)=prm( 35)
      eqtyp( 84)=0

!& abs
      eqtyp( 85)=0
      if(x( 72)>0. )then
         z( 27)=1
      else
         z( 27)=-1
      endif

!& algeq               ! rocof protection
      eqtyp( 86)=0

!& swsign
      eqtyp( 87)=0
      if(x( 74)>=0.)then
         z( 28)=1
      else
         z( 28)=2
      endif

!& hyst
      eqtyp( 88)=0
      if(x( 75)>1.1)then
         z( 29)=1
      elseif(x( 75)<0.9)then
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
      f(  6)=x( 50)/x(  8) - x( 17)

!& algeq				! minimum current limit to -0.001
      f(  7)=x( 16) + 0.001

!& limvb				! limit current Ipcmd
      select case (z(  2))
         case(0)
            f(  8)=x( 11)-x( 17)
         case(-1)
            f(  8)=x( 11)-x( 16)
         case(1)
            f(  8)=x( 11)-x( 15)
      end select

!& algeq             ! compute status
      f(  9)=x( 79) - x( 28)*x( 47)*x( 49)*x( 76)*x( 58)

!& algeq
      f( 10)=x( 78) - prm( 37)

!& algeq
      f( 11)=x( 80) - 1

!& swsign
      select case (z(  3))
         case(1)
            f( 12)=x( 77)-x( 79)
         case(2)
            f( 12)=x( 77)-x( 80)
      end select

!& algeq                     ! current computation
      f( 13)=x( 31)*x( 77) - x(  9)

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            f( 14)=x( 84)-1*x( 11)+x( 31)
         case(1)
            f( 14)=x( 84)-prm( 53)*prm(  4)
         case(-1)
            f( 14)=x( 84)-prm( 49)*prm(  4)
      end select
      select case (z(  5))
         case(0)
            f( 15)=x( 84)
         case(1)
            f( 15)=x( 31)-prm( 48)
         case(-1)
            f( 15)=x( 31)-prm( 49)
      end select

!& algeq                     ! include reactive current priority
      f( 16)=x( 13) -x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) - (1-x( 37))*(prm( 29)*prm(  1)*0.707 + (1-prm( 29))*prm(  1))

!& algeq
      f( 17)=x( 14) + x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) + (1-x( 37))*prm(  1)

!& algeq
      f( 18)=-x( 24) + prm( 44) - x( 30)

!& limvb
      select case (z(  6))
         case(0)
            f( 19)=x( 12)-x( 30)
         case(-1)
            f( 19)=x( 12)-x( 14)
         case(1)
            f( 19)=x( 12)-x( 13)
      end select

!& algeq
      f( 20)=x( 32)*x( 77) - x( 10)

!& tf1p
      f( 21)=(-x( 32)+1.*x( 12))

!& algeq			! active current limit
      f( 22)=x( 15) - x( 37)*prm(  2) -  (1-x( 37))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2))

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
            f( 26)=x( 85)
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
      f( 29)=x( 56) - 1 + x( 25)

!& inlim
      if (1>= 0.005)then
         select case (z( 10))
            case(0)
               f( 30)=x( 56)
            case(1)
               f( 30)=x( 57)-5
            case(-1)
               f( 30)=x( 57)-0.
         end select
      else
         select case (z( 10))
            case(0)
               f( 30)=x( 56)-x( 57)
            case(1)
               f( 30)=x( 57)-5
            case(-1)
               f( 30)=x( 57)-0.
         end select
      endif

!& algeq
      f( 31)=x( 60) - 1

!& algeq
      f( 32)=x( 61) - 1 + x( 56)

!& algeq
      f( 33)=x( 62) + prm( 17) - x( 57)

!& swsign
      select case (z( 11))
         case(1)
            f( 34)=x( 59)-x( 60)
         case(2)
            f( 34)=x( 59)-x( 61)
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            f( 35)=x( 86)-1*x( 59)+x( 58)
         case(1)
            f( 35)=x( 86)-prm( 54)*prm( 56)
         case(-1)
            f( 35)=x( 86)-prm( 49)*prm( 56)
      end select
      select case (z( 13))
         case(0)
            f( 36)=x( 86)
         case(1)
            f( 36)=x( 58)-prm( 48)
         case(-1)
            f( 36)=x( 58)-prm( 50)
      end select

!& algeq             ! overvoltage protection
      f( 37)=x( 34) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 14))
         case (  1)
            f( 38)=0.+ ( (0.-0.)*(x( 34)-(-999))/(0.-(-999)) ) -x( 29)
         case (  2)
            f( 38)=0.+ ( (1.-0.)*(x( 34)-0.)/(0.-0.) ) -x( 29)
         case (  3)
            f( 38)=1.+ ( (1.-1.)*(x( 34)-0.)/(999-0.) ) -x( 29)
      end select

!& algeq
      f( 39)=x( 27) -1 + x( 29)

!& hyst
      if(z( 15) == 1)then
         f( 40)=x( 28)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 40)=x( 28)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq                     ! reactive current priority during undervoltage
      f( 41)=x( 36) - x(  7) + prm( 25)

!& algeq
      f( 42)=x( 39) - 1

!& algeq
      f( 43)=x( 40)

!& swsign
      select case (z( 16))
         case(1)
            f( 44)=x( 38)-x( 39)
         case(2)
            f( 44)=x( 38)-x( 40)
      end select

!& algeq             ! switch support on and off
      f( 45)=x( 81) - prm( 38)

!& algeq
      f( 46)=x( 82) - 1

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            f( 47)=x( 37)-x( 38)
         case(2)
            f( 47)=x( 37)-x( 82)
      end select

!& algeq         ! PLL
      f( 48)=x( 54) - x(  7) + prm( 11)

!& swsign
      select case (z( 18))
         case(1)
            f( 49)=x( 53)-x( 39)
         case(2)
            f( 49)=x( 53)-x( 40)
      end select

!& int
      if (1.< 0.005)then
         f( 50)=x( 19)-x(  6)
      else
         f( 50)=x( 19)
      endif

!& pictl
      f( 51)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 20)
      f( 52)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 20)+x( 87)-x( 55)

!& algeq
      f( 53)=x( 18) - x( 55) + omega*2*pi*50

!& algeq
      f( 54)=x( 19) - x( 18)*x( 53)

!& tf1p
      f( 55)=(-x( 41)+1.*x(  3))

!& tf1p
      f( 56)=(-x( 42)+1.*x(  4))

!& algeq             ! frequency measurement
      f( 57)=x( 43) - x( 55)/(2*pi*50)

!& algeq
      f( 58)=x( 44) - 50*x( 43)

!& tf1p
      f( 59)=(-x( 45)+1.*x( 44))

!& algeq           ! frequency protection
      f( 60)=x( 51) - x( 45) + prm( 15)

!& swsign
      select case (z( 19))
         case(1)
            f( 61)=x( 46)-x( 39)
         case(2)
            f( 61)=x( 46)-x( 40)
      end select

!& algeq
      f( 62)=x( 52) - prm( 16) + x( 45)

!& swsign
      select case (z( 20))
         case(1)
            f( 63)=x( 48)-x( 39)
         case(2)
            f( 63)=x( 48)-x( 40)
      end select

!& hyst
      if(z( 21) == 1)then
         f( 64)=x( 47)-1.-(1.-1.)*(x( 46)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 47)-0.-(0.-0.)*(x( 46)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 22) == 1)then
         f( 65)=x( 49)-1.-(1.-1.)*(x( 48)-1.1)/(1.1-0.9)
      else
         f( 65)=x( 49)-0.-(0.-0.)*(x( 48)-0.9)/(1.1-0.9)
      endif

!& algeq                 ! frequency droop control
      f( 66)=x( 63) + (x( 45)/50) - prm( 55)

!& db
      select case (z( 23))
         case(0)
            f( 67)=x( 64)
         case(-1)
            f( 67)=x( 64)-0.-1.*(x( 63)-prm( 31))
         case(1)
            f( 67)=x( 64)-0.-1.*(x( 63)-prm( 32))
      end select

!& algeq
      f( 68)=x( 65) - x( 64)*prm( 58)*prm(  2)

!& algeq
      f( 69)=x( 66) - x( 64)*prm( 57)*prm(  2)

!& lim
      select case (z( 24))
         case(0)
            f( 70)=x( 67)-x( 65)
         case(-1)
            f( 70)=x( 67)-(-99999.)
         case(1)
            f( 70)=x( 67)-(-0.00001)
      end select

!& lim
      select case (z( 25))
         case(0)
            f( 71)=x( 68)-x( 66)
         case(-1)
            f( 71)=x( 68)-0.00001
         case(1)
            f( 71)=x( 68)-99999.
      end select

!& algeq
      f( 72)=x( 69)-x( 68)-x( 67)

!& algeq
      f( 73)=x( 83)

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            f( 74)=x( 70)-x( 69)
         case(2)
            f( 74)=x( 70)-x( 83)
      end select

!& algeq
      f( 75)=x( 50)+prm( 42)-x( 70)

!& algeq             ! alignment
      f( 76)=x( 21) - x( 41)*cos(x(  6)) - x( 42)*sin(x(  6))

!& algeq
      f( 77)=x( 20) + x( 41)*sin(x(  6)) - x( 42)*cos(x(  6))

!& algeq
      f( 78)=x( 22) - x( 21)*x(  9)

!& algeq
      f( 79)=x( 23) - x( 21)*x( 10)

!& algeq
      f( 80)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f( 81)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!& algeq                ! frequency deviation in Hz
      f( 82)=-x( 71) + x( 45)-prm( 55)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 83)=-x( 88)+x( 71)
      if (prm( 35)< 0.005)then
         f( 84)=1/prm( 35)*x( 71)-x( 72)
      else
         f( 84)=1/prm( 35)*(x( 71)-x( 88))-x( 72)
      endif

!& abs
      if(z( 27) == 1 )then
         f( 85)=x( 73)-x( 72)
      else
         f( 85)=x( 73)+x( 72)
      endif

!& algeq               ! rocof protection
      f( 86)=-x( 74) +prm( 36) -x( 73)

!& swsign
      select case (z( 28))
         case(1)
            f( 87)=x( 75)-x( 39)
         case(2)
            f( 87)=x( 75)-x( 40)
      end select

!& hyst
      if(z( 29) == 1)then
         f( 88)=x( 76)-1.-(1.-1.)*(x( 75)-1.1)/(1.1-0.9)
      else
         f( 88)=x( 76)-0.-(0.-0.)*(x( 75)-0.9)/(1.1-0.9)
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
            if(x( 78)<0.)then
               z(  3)=2
            endif
         case(2)
            if(x( 78)>=0.)then
               z(  3)=1
            endif
      end select

!& algeq                     ! current computation

!& tf1p2lim			! temporary current is
      select case (z(  4))
         case(0)
            if(x( 84)>prm( 53)*prm(  4))then
               z(  4)=1
            elseif(x( 84)<prm( 49)*prm(  4))then
               z(  4)=-1
            endif
         case(1)
            if(1*x( 11)-x( 31)<prm( 53)*prm(  4))then
               z(  4)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 31)>prm( 49)*prm(  4))then
               z(  4)= 0
            endif
      end select
      select case (z(  5))
         case(0)
            if(x( 31)>prm( 48))then
               z(  5)=1
               eqtyp( 15)=0
            elseif(x( 31)<prm( 49))then
               z(  5)=-1
               eqtyp( 15)=0
            endif
         case(1)
            if (x( 84)<0.)then
               z(  5)= 0
               eqtyp( 15)= 31
            endif
         case(-1)
            if(x( 84)>0.)then
               z(  5)= 0
               eqtyp( 15)= 31
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

!& algeq			! active current limit

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
            eqtyp( 26)= 85
         endif
      else
         if(x( 33) < (-prm( 12)))then
            z(  8)=-1
            eqtyp( 26)=0
         endif
      endif
      if(z(  8) == 0)then
         if(x( 33) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 85) > 0.)then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 85) > prm(  6)+(0.-prm(  6))*(x( 33)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 85) > prm(  6)+(prm(  6)-prm(  6))*(x( 33)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 85) > prm(  8)+(prm(  6)-prm(  8))*(x( 33)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  8)=1
            endif
         elseif(x( 33) > (-prm( 12)))then
            if(x( 85) > prm(  7)+(prm(  8)-prm(  7))*(x( 33)-(-prm( 12)))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-prm( 12))))then
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
               if(x( 57)<0.)then
                  z( 10)=-1
                  eqtyp( 30)=0
               elseif(x( 57)>5)then
                  z( 10)= 1
                  eqtyp( 30)=0
               endif
            case(1)
               if(x( 56)<0.)then
                  z( 10)=0
                  eqtyp( 30)= 57
               endif
            case(-1)
               if(x( 56)>0.)then
                  z( 10)=0
                  eqtyp( 30)= 57
               endif
         end select
      else
         select case (z( 10))
            case(0)
               if(x( 57)<0.)then
                  z( 10)=-1
               elseif(x( 57)>5)then
                  z( 10)= 1
               endif
            case(1)
               if(x( 56)<5)then
                  z( 10)=0
               endif
            case(-1)
               if(x( 56)>0.)then
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
            if(x( 62)<0.)then
               z( 11)=2
            endif
         case(2)
            if(x( 62)>=0.)then
               z( 11)=1
            endif
      end select

!& tf1p2lim
      select case (z( 12))
         case(0)
            if(x( 86)>prm( 54)*prm( 56))then
               z( 12)=1
            elseif(x( 86)<prm( 49)*prm( 56))then
               z( 12)=-1
            endif
         case(1)
            if(1*x( 59)-x( 58)<prm( 54)*prm( 56))then
               z( 12)= 0
            endif
         case(-1)
            if(1*x( 59)-x( 58)>prm( 49)*prm( 56))then
               z( 12)= 0
            endif
      end select
      select case (z( 13))
         case(0)
            if(x( 58)>prm( 48))then
               z( 13)=1
               eqtyp( 36)=0
            elseif(x( 58)<prm( 50))then
               z( 13)=-1
               eqtyp( 36)=0
            endif
         case(1)
            if (x( 86)<0.)then
               z( 13)= 0
               eqtyp( 36)= 58
            endif
         case(-1)
            if(x( 86)>0.)then
               z( 13)= 0
               eqtyp( 36)= 58
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

!& algeq

!& algeq

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

!& algeq

!& swsign            ! switch support off
      select case (z( 17))
         case(1)
            if(x( 81)<0.)then
               z( 17)=2
            endif
         case(2)
            if(x( 81)>=0.)then
               z( 17)=1
            endif
      end select

!& algeq         ! PLL

!& swsign
      select case (z( 18))
         case(1)
            if(x( 54)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 54)>=0.)then
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
            if(x( 51)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 51)>=0.)then
               z( 19)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 20))
         case(1)
            if(x( 52)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 52)>=0.)then
               z( 20)=1
            endif
      end select

!& hyst
      if (z( 21) == -1)then
         if(x( 46)>1.1)then
            z( 21)=1
         endif
      else
         if(x( 46)<0.9)then
            z( 21)=-1
         endif
      endif

!& hyst
      if (z( 22) == -1)then
         if(x( 48)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 48)<0.9)then
            z( 22)=-1
         endif
      endif

!& algeq                 ! frequency droop control

!& db
      select case (z( 23))
         case(0)
            if(x( 63)>prm( 32))then
               z( 23)=1
            elseif(x( 63)<prm( 31))then
               z( 23)=-1
            endif
         case(-1)
            if(x( 63)>prm( 31))then
               z( 23)=0
            endif
         case(1)
            if(x( 63)<prm( 32))then
               z( 23)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 24))
         case(0)
            if(x( 65)>(-0.00001))then
               z( 24)=1
            elseif(x( 65)<(-99999.))then
               z( 24)=-1
            endif
         case(-1)
            if(x( 65)>(-99999.))then
               z( 24)=0
            endif
         case(1)
            if(x( 65)<(-0.00001))then
               z( 24)=0
            endif
      end select

!& lim
      select case (z( 25))
         case(0)
            if(x( 66)>99999.)then
               z( 25)=1
            elseif(x( 66)<0.00001)then
               z( 25)=-1
            endif
         case(-1)
            if(x( 66)>0.00001)then
               z( 25)=0
            endif
         case(1)
            if(x( 66)<99999.)then
               z( 25)=0
            endif
      end select

!& algeq

!& algeq

!& swsign            ! switch support off
      select case (z( 26))
         case(1)
            if(x( 81)<0.)then
               z( 26)=2
            endif
         case(2)
            if(x( 81)>=0.)then
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
         if(x( 72)> blocktol1 )then
            z( 27)=1
         endif
      else
         if(x( 72)< - blocktol1 )then
            z( 27)=-1
         endif
      endif

!& algeq               ! rocof protection

!& swsign
      select case (z( 28))
         case(1)
            if(x( 74)<0.)then
               z( 28)=2
            endif
         case(2)
            if(x( 74)>=0.)then
               z( 28)=1
            endif
      end select

!& hyst
      if (z( 29) == -1)then
         if(x( 75)>1.1)then
            z( 29)=1
         endif
      else
         if(x( 75)<0.9)then
            z( 29)=-1
         endif
      endif
   end select

end subroutine inj_IBG22r
