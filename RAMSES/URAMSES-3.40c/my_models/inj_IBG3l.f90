!  MODEL NAME : inj_IBG3l               
!  MODEL DESCRIPTION FILE : IBG3l.txt
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
!       prm( 36)=  pfup
!       prm( 37)=  pfdn
!       prm( 38)=  Trocof
!       prm( 39)=  dfmax
!  Parameters :
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
!       prm( 52)=  UplimdeltaP  
!       prm( 53)=  DownlimdeltaP  
!       prm( 54)=  Tlim  
!       prm( 55)=  Uplimdis  
!       prm( 56)=  downlimdis  
!       prm( 57)=  ratemax  
!       prm( 58)=  rate  
!       prm( 59)=  rateh  
!       prm( 60)=  fref  
!       prm( 61)=  Pup  
!       prm( 62)=  Pdn  
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
!       x( 27)=  z1                    
!       x( 28)=  x5                    
!       x( 29)=  Iptemp                
!       x( 30)=  Iqtemp                
!       x( 31)=  x10                   
!       x( 32)=  x11                   
!       x( 33)=  z                     
!       x( 34)=  deltaV                
!       x( 35)=  Pflag                 
!       x( 36)=  vxlm                  
!       x( 37)=  vylm                  
!       x( 38)=  omegam                
!       x( 39)=  fm                    
!       x( 40)=  fmfilt                
!       x( 41)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 42)=  Ffl                   
!       x( 43)=  Ffhi                  
!       x( 44)=  Ffh                   
!       x( 45)=  Ptot                  
!       x( 46)=  deltafl               
!       x( 47)=  deltafh               
!       x( 48)=  mult                  
!       x( 49)=  deltaVPLL             
!       x( 50)=  wpll                  
!       x( 51)=  g                     
!       x( 52)=  tr                    
!       x( 53)=  Fr                    
!       x( 54)=  Frtemp                
!       x( 55)=  fvlb                  
!       x( 56)=  deltafvl              
!       x( 57)=  g1                    
!       x( 58)=  tr1                   
!       x( 59)=  Frvh                  
!       x( 60)=  Frvhtemp              
!       x( 61)=  fvhb                  
!       x( 62)=  deltafvh              
!       x( 63)=  g2                    
!       x( 64)=  tr2                   
!       x( 65)=  Frfl                  
!       x( 66)=  Frfltemp              
!       x( 67)=  fflb                  
!       x( 68)=  deltaffl              
!       x( 69)=  g3                    
!       x( 70)=  tr3                   
!       x( 71)=  Frfh                  
!       x( 72)=  Frfhtemp              
!       x( 73)=  ffhb                  
!       x( 74)=  deltaffh              
!       x( 75)=  w1                    
!       x( 76)=  w2                    
!       x( 77)=  w3                    
!       x( 78)=  w4                    
!       x( 79)=  w5                    
!       x( 80)=  w6                    
!       x( 81)=  w7                    
!       x( 82)=  Frvhtemp1             
!       x( 83)=  one                   
!       x( 84)=  zero                  
!       x( 85)=  status                
!       x( 86)=  deltaf                
!       x( 87)=  rocof                 
!       x( 88)=  abrocof               
!       x( 89)=  deltarocof            
!       x( 90)=  Ffri                  
!       x( 91)=  Ffr                   
!       x( 92)=  g4                    
!       x( 93)=  tr4                   
!       x( 94)=  deltaffr              

!.........................................................................................................

subroutine inj_IBG3l(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbaddpar= 23
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
      parname( 36)='pfup'
      parname( 37)='pfdn'
      parname( 38)='Trocof'
      parname( 39)='dfmax'
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
      parname( 52)='UplimdeltaP'
      parname( 53)='DownlimdeltaP'
      parname( 54)='Tlim'
      parname( 55)='Uplimdis'
      parname( 56)='downlimdis'
      parname( 57)='ratemax'
      parname( 58)='rate'
      parname( 59)='rateh'
      parname( 60)='fref'
      parname( 61)='Pup'
      parname( 62)='Pdn'
      adix=  1
      adiy=  2
      nbxvar=102
      nbzvar= 38

!........................................................................................
   case (define_obs)
      nbobs= 20
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

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 22)              
      obs(  4)=x( 23)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 39)              
      obs(  8)=x( 40)              
      obs(  9)=x( 53)              
      obs( 10)=x( 85)              
      obs( 11)=x( 71)              
      obs( 12)=x( 65)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 50)              
      obs( 16)=x( 20)              
      obs( 17)=x( 87)              
      obs( 18)=x( 91)              
      obs( 19)=x( 42)              
      obs( 20)=x( 44)              

!........................................................................................
   case (initialize)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 40)= vx + prm( 19)*ix - prm( 20)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 41)= vy + prm( 19)*iy + prm( 20)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 42)= dsqrt(prm( 40)**2 + prm( 41)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 43)= -prm( 40)*ix-prm( 41)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 44)= +prm( 40)*iy-prm( 41)*ix

!Iqref = -{Qext}/{Vref}
      prm( 45)= -prm( 44)/prm( 42)

!Ipref = -{Pext}/{Vref}
      prm( 46)= -prm( 43)/prm( 42)

!kpll = 10/({tau}*0.001)
      prm( 47)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 48)= atan(prm( 41)/prm( 40))

!Uplim = 9999
      prm( 49)= 9999

!Downlim = -9999
      prm( 50)= -9999

!Downlimdisc = 0
      prm( 51)= 0

!UplimdeltaP = 9999
      prm( 52)= 9999

!DownlimdeltaP = 0
      prm( 53)= 0

!Tlim = 0.01
      prm( 54)= 0.01

!Uplimdis = 0
      prm( 55)= 0

!downlimdis = -9999
      prm( 56)= -9999

!ratemax = {Iprate}*{IN}
      prm( 57)= prm(  3)*prm(  2)

!rate = 0.5
      prm( 58)= 0.5

!rateh = 0.5
      prm( 59)= 0.5

!fref = 1
      prm( 60)= 1

!Pup = -{pfup}*{Pext}
      prm( 61)= -prm( 36)*prm( 43)

!Pdn = -{pfdn}*{Pext}
      prm( 62)= -prm( 37)*prm( 43)

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

!Iqmax =  dsqrt({Imax}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm(  1)**2 - prm( 46)**2 )

!Iqmin =  - dsqrt({Imax}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm(  1)**2 - prm( 46)**2 )

!Ipmax =  {IN}
      x( 15)= prm(  2)

!Ipmin =  -0.001
      x( 16)= -0.001

!x4 =  {Ipref}
      x( 17)= prm( 46)

!DeltaW =  0
      x( 18)= 0

!DeltaWf =   0
      x( 19)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 20)= -prm( 40)*sin(prm( 48)) + prm( 41)*cos(prm( 48))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 21)= prm( 40)*cos(prm( 48)) + prm( 41)*sin(prm( 48))

!Pgen =  -{Pext}
      x( 22)= -prm( 43)

!Qgen =  -{Qext}
      x( 23)= -prm( 44)

!Iqext =  0
      x( 24)= 0

!Fvl =  1
      x( 25)= 1

!Fvli =  1
      x( 26)= 1

!z1 =  0.
      x( 27)= 0.

!x5 =  {Iqref}
      x( 28)= prm( 45)

!Iptemp =  {Ipref}
      x( 29)= prm( 46)

!Iqtemp =  {Iqref}
      x( 30)= prm( 45)

!x10 =  -{Vref}
      x( 31)= -prm( 42)

!x11 =  {Vref} - {Vmax}
      x( 32)= prm( 42) - prm(  9)

!z =  0.
      x( 33)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 34)= prm( 42) - prm( 26)

!Pflag =  1
      x( 35)= 1

!vxlm =  {vxlv}
      x( 36)= prm( 40)

!vylm =  {vylv}
      x( 37)= prm( 41)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 38)= -0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 39)= 50*(-0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 40)= 50*(-0.5*(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48))) + 1)

!Ffli =  1.
      x( 41)= 1.

!Ffl =  1.
      x( 42)= 1.

!Ffhi =  1.
      x( 43)= 1.

!Ffh =  1.
      x( 44)= 1.

!Ptot =  -{Pext}
      x( 45)= -prm( 43)

!deltafl =  50*[omega] - {fmin}
      x( 46)= 50*omega - prm( 15)

!deltafh =  {fmax} - 50*[omega]
      x( 47)= prm( 16) - 50*omega

!mult =  1
      x( 48)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 49)= prm( 42) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 50)= -(prm( 40)*sin(prm( 48)) - prm( 41)*cos(prm( 48)))*prm( 47) + 2*pi*50

!g =  0
      x( 51)= 0

!tr =  0
      x( 52)= 0

!Fr =  1
      x( 53)= 1

!Frtemp =  1
      x( 54)= 1

!fvlb =  1
      x( 55)= 1

!deltafvl =  -{Trv}
      x( 56)= -prm( 17)

!g1 =  1
      x( 57)= 1

!tr1 = 0
      x( 58)=0

!Frvh =  1
      x( 59)= 1

!Frvhtemp =  1
      x( 60)= 1

!fvhb =  1
      x( 61)= 1

!deltafvh =  -{Trv}
      x( 62)= -prm( 17)

!g2 =  0
      x( 63)= 0

!tr2 =  0
      x( 64)= 0

!Frfl =  1
      x( 65)= 1

!Frfltemp =  1
      x( 66)= 1

!fflb =  1
      x( 67)= 1

!deltaffl =  -{Trf}
      x( 68)= -prm( 18)

!g3 =  0
      x( 69)= 0

!tr3 =  0
      x( 70)= 0

!Frfh =  1
      x( 71)= 1

!Frfhtemp =  1
      x( 72)= 1

!ffhb =  1
      x( 73)= 1

!deltaffh =  -{Trf}
      x( 74)= -prm( 18)

!w1 =  0
      x( 75)= 0

!w2 =  0
      x( 76)= 0

!w3 =  0
      x( 77)= 0

!w4 =  0
      x( 78)= 0

!w5 =  0
      x( 79)= 0

!w6 =  0
      x( 80)= 0

!w7 =  0
      x( 81)= 0

!Frvhtemp1 = 1
      x( 82)=1

!one =  1
      x( 83)= 1

!zero =  0
      x( 84)= 0

!status =  1
      x( 85)= 1

!deltaf =  0
      x( 86)= 0

!rocof =  0
      x( 87)= 0

!abrocof =  0
      x( 88)= 0

!deltarocof =  {dfmax} - 0
      x( 89)= prm( 39) - 0

!Ffri =  1
      x( 90)= 1

!Ffr =  1
      x( 91)= 1

!g4 =  0
      x( 92)= 0

!tr4 =  0
      x( 93)= 0

!deltaffr =  0.25
      x( 94)= 0.25

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
      if(x( 17)>x( 15))then
         z(  2)=1
      elseif(x( 17)<x( 16))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq         ! output current computation, consider protection status
      eqtyp( 12)=0

!& tf1p2lim
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 50)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 57)= huge(0.d0)
      endif
      if(1*x( 11)-x( 29)>prm( 57)*prm(  4))then
         z(  3)=1
      elseif(1*x( 11)-x( 29)<prm( 50)*prm(  4))then
         z(  3)=-1
      else
         z(  3)=0
      endif
      eqtyp( 13)=0
      if(x( 29)>prm( 49))then
         z(  4)=1
         eqtyp( 14)=0
      elseif(x( 29)<prm( 50))then
         z(  4)=-1
         eqtyp( 14)=0
      else
         z(  4)=0
         eqtyp( 14)= 29
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
      if(x( 28)>x( 13))then
         z(  5)=1
      elseif(x( 28)<x( 14))then
         z(  5)=-1
      else
         z(  5)=0
      endif

!& algeq						!
      eqtyp( 19)=0

!& tf1p
      eqtyp( 20)= 30
      tc( 20)=prm(  4)

!& algeq 				  ! Active - reactive power priority, max active current
      eqtyp( 21)=0

!& db 						! Reactive current injection, voltage support
      eqtyp( 22)=0
      if(x(  7)>prm( 27))then
         z(  6)=1
      elseif(x(  7)<prm( 26))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq   						!  Low voltage ride-through and LV protection flag
      eqtyp( 23)=0

!& timer5
      eqtyp( 24)=0
      eqtyp( 25)=0
      z(  7)=-1
      x( 96)=0.

!& algeq 		
      eqtyp( 26)=0

!& hyst
      eqtyp( 27)=0
      if(x( 26)>1.1)then
         z(  8)=1
      elseif(x( 26)<0.9)then
         z(  8)=-1
      else
         if(1.>= 0.)then
            z(  8)=1
         else
            z(  8)=-1
         endif
      endif

!& algeq
      eqtyp( 28)=0

!& inlim
      if (1>= 0.005)then
         tc( 29)=1
      endif
      if (x( 52)>5)then
         z(  9)=1
         eqtyp( 29)=0
      elseif (x( 52)<0.) then
         z(  9)=-1
         eqtyp( 29)=0
      else
         z(  9)=0
         if (1>= 0.005)then
            eqtyp( 29)= 52
         else
            eqtyp( 29)=0
         endif
      endif

!& algeq
      eqtyp( 30)=0

!& algeq
      eqtyp( 31)=0

!& swsign
      eqtyp( 32)=0
      if(x( 56)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& tf1p2lim
      if(prm( 54)< 0.001)then
         prm( 54)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 58)= huge(0.d0)
      endif
      if(1*x( 54)-x( 53)>prm( 58)*prm( 54))then
         z( 11)=1
      elseif(1*x( 54)-x( 53)<prm( 50)*prm( 54))then
         z( 11)=-1
      else
         z( 11)=0
      endif
      eqtyp( 33)=0
      if(x( 53)>prm( 49))then
         z( 12)=1
         eqtyp( 34)=0
      elseif(x( 53)<prm( 51))then
         z( 12)=-1
         eqtyp( 34)=0
      else
         z( 12)=0
         eqtyp( 34)= 53
      endif
      tc( 34)=prm( 54)

!& algeq								! High voltage ride-through and HV protection flag
      eqtyp( 35)=0

!& pwlin4
      eqtyp( 36)=0
      if(x( 32)<(-999))then
         z( 13)=1
      elseif(x( 32)>=999)then
         z( 13)=   3
      elseif((-999)<=x( 32) .and. x( 32)<0.)then
         z( 13)=  1
      elseif(0.<=x( 32) .and. x( 32)<0.)then
         z( 13)=  2
      elseif(0.<=x( 32) .and. x( 32)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         tc( 37)=1
      endif
      if (x( 58)>5)then
         z( 14)=1
         eqtyp( 37)=0
      elseif (x( 58)<0.) then
         z( 14)=-1
         eqtyp( 37)=0
      else
         z( 14)=0
         if (1>= 0.005)then
            eqtyp( 37)= 58
         else
            eqtyp( 37)=0
         endif
      endif

!& algeq
      eqtyp( 38)=0

!& algeq
      eqtyp( 39)=0

!& algeq
      eqtyp( 40)=0

!& swsign
      eqtyp( 41)=0
      if(x( 62)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& algeq
      eqtyp( 42)=0

!& tf1p2lim
      if(prm( 54)< 0.001)then
         prm( 54)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 59)= huge(0.d0)
      endif
      if(1*x( 82)-x( 59)>prm( 59)*prm( 54))then
         z( 16)=1
      elseif(1*x( 82)-x( 59)<prm( 50)*prm( 54))then
         z( 16)=-1
      else
         z( 16)=0
      endif
      eqtyp( 43)=0
      if(x( 59)>prm( 49))then
         z( 17)=1
         eqtyp( 44)=0
      elseif(x( 59)<prm( 51))then
         z( 17)=-1
         eqtyp( 44)=0
      else
         z( 17)=0
         eqtyp( 44)= 59
      endif
      tc( 44)=prm( 54)

!& algeq 						! reactive current priority flag
      eqtyp( 45)=0

!& swsign
      eqtyp( 46)=0
      if(x( 34)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& algeq                     ! PLL
      eqtyp( 47)=0

!& swsign
      eqtyp( 48)=0
      if(x( 49)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 49)=0
      else
         eqtyp( 49)=  6
         tc( 49)=1.
      endif

!& pictl
      eqtyp( 50)= 99
      x( 99)=x( 50)
      eqtyp( 51)=0

!& algeq
      eqtyp( 52)=0

!& algeq
      eqtyp( 53)=0

!& tf1p              ! voltage measurement
      eqtyp( 54)= 36
      tc( 54)=prm(  5)

!& tf1p
      eqtyp( 55)= 37
      tc( 55)=prm(  5)

!& algeq                     ! filter PLL frequency , convert to Hz
      eqtyp( 56)=0

!& algeq
      eqtyp( 57)=0

!& tf1p
      eqtyp( 58)= 40
      tc( 58)=0.1

!& algeq                         ! frequency protection flag FFl, and FFh
      eqtyp( 59)=0

!& swsign
      eqtyp( 60)=0
      if(x( 46)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& algeq
      eqtyp( 61)=0

!& swsign
      eqtyp( 62)=0
      if(x( 47)>=0.)then
         z( 21)=1
      else
         z( 21)=2
      endif

!& hyst
      eqtyp( 63)=0
      if(x( 41)>1.1)then
         z( 22)=1
      elseif(x( 41)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& hyst
      eqtyp( 64)=0
      if(x( 43)>1.1)then
         z( 23)=1
      elseif(x( 43)<0.9)then
         z( 23)=-1
      else
         if(1.>= 0.)then
            z( 23)=1
         else
            z( 23)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection
      eqtyp( 65)=0

!& inlim
      if (1>= 0.005)then
         tc( 66)=1
      endif
      if (x( 64)>5)then
         z( 24)=1
         eqtyp( 66)=0
      elseif (x( 64)<0.) then
         z( 24)=-1
         eqtyp( 66)=0
      else
         z( 24)=0
         if (1>= 0.005)then
            eqtyp( 66)= 64
         else
            eqtyp( 66)=0
         endif
      endif

!& algeq
      eqtyp( 67)=0

!& algeq
      eqtyp( 68)=0

!& swsign
      eqtyp( 69)=0
      if(x( 68)>=0.)then
         z( 25)=1
      else
         z( 25)=2
      endif

!& tf1p2lim
      if(prm( 54)< 0.001)then
         prm( 54)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 59)= huge(0.d0)
      endif
      if(1*x( 66)-x( 65)>prm( 59)*prm( 54))then
         z( 26)=1
      elseif(1*x( 66)-x( 65)<prm( 50)*prm( 54))then
         z( 26)=-1
      else
         z( 26)=0
      endif
      eqtyp( 70)=0
      if(x( 65)>prm( 49))then
         z( 27)=1
         eqtyp( 71)=0
      elseif(x( 65)<prm( 51))then
         z( 27)=-1
         eqtyp( 71)=0
      else
         z( 27)=0
         eqtyp( 71)= 65
      endif
      tc( 71)=prm( 54)

!& algeq								! High frequency protection and reconnection
      eqtyp( 72)=0

!& inlim
      if (1>= 0.005)then
         tc( 73)=1
      endif
      if (x( 70)>5)then
         z( 28)=1
         eqtyp( 73)=0
      elseif (x( 70)<0.) then
         z( 28)=-1
         eqtyp( 73)=0
      else
         z( 28)=0
         if (1>= 0.005)then
            eqtyp( 73)= 70
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
      if(x( 74)>=0.)then
         z( 29)=1
      else
         z( 29)=2
      endif

!& tf1p2lim
      if(prm( 54)< 0.001)then
         prm( 54)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 49)= huge(0.d0)
         prm( 50)=-huge(0.d0)
         prm( 59)= huge(0.d0)
      endif
      if(1*x( 72)-x( 71)>prm( 59)*prm( 54))then
         z( 30)=1
      elseif(1*x( 72)-x( 71)<prm( 50)*prm( 54))then
         z( 30)=-1
      else
         z( 30)=0
      endif
      eqtyp( 77)=0
      if(x( 71)>prm( 49))then
         z( 31)=1
         eqtyp( 78)=0
      elseif(x( 71)<prm( 51))then
         z( 31)=-1
         eqtyp( 78)=0
      else
         z( 31)=0
         eqtyp( 78)= 71
      endif
      tc( 78)=prm( 54)

!& algeq				! Frequency droop control
      eqtyp( 79)=0

!& db
      eqtyp( 80)=0
      if(x( 75)>prm( 33))then
         z( 32)=1
      elseif(x( 75)<prm( 32))then
         z( 32)=-1
      else
         z( 32)=0
      endif

!& algeq
      eqtyp( 81)=0

!& algeq
      eqtyp( 82)=0

!& lim
      eqtyp( 83)=0
      if(x( 77)>0.00001)then
         z( 33)=1
      elseif(x( 77)<(-prm( 62)))then
         z( 33)=-1
      else
         z( 33)=0
      endif

!& lim
      eqtyp( 84)=0
      if(x( 78)>prm( 61))then
         z( 34)=1
      elseif(x( 78)<0.0001)then
         z( 34)=-1
      else
         z( 34)=0
      endif

!& algeq
      eqtyp( 85)=0

!& algeq
      eqtyp( 86)=0

!& algeq                ! frequency deviation in Hz
      eqtyp( 87)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x(102)=x( 86)
      eqtyp( 88)=102
      tc( 88)=prm( 38)
      eqtyp( 89)=0

!& abs
      eqtyp( 90)=0
      if(x( 87)>0. )then
         z( 35)=1
      else
         z( 35)=-1
      endif

!& algeq               ! rocof protection and timer
      eqtyp( 91)=0

!& swsign
      eqtyp( 92)=0
      if(x( 89)>=0.)then
         z( 36)=1
      else
         z( 36)=2
      endif

!& algeq
      eqtyp( 93)=0

!& inlim
      if (1>= 0.005)then
         tc( 94)=1
      endif
      if (x( 93)>5)then
         z( 37)=1
         eqtyp( 94)=0
      elseif (x( 93)<0) then
         z( 37)=-1
         eqtyp( 94)=0
      else
         z( 37)=0
         if (1>= 0.005)then
            eqtyp( 94)= 93
         else
            eqtyp( 94)=0
         endif
      endif

!& algeq
      eqtyp( 95)=0

!& swsign
      eqtyp( 96)=0
      if(x( 94)>=0.)then
         z( 38)=1
      else
         z( 38)=2
      endif

!& algeq                 ! alignment equations
      eqtyp( 97)=0

!& algeq
      eqtyp( 98)=0

!& algeq
      eqtyp( 99)=0

!& algeq
      eqtyp(100)=0

!& algeq
      eqtyp(101)=0

!& algeq
      eqtyp(102)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=-x( 85) + x( 53)*x( 59)*x( 65)*x( 71)*x( 91)

!& algeq
      f(  2)=x( 83)-1

!& algeq
      f(  3)=x( 84)

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
      f(  9)=x( 45)/x(  8) - x( 17)

!& algeq         ! minimum current
      f( 10)=x( 16) + 0.001

!& limvb         ! limit current Ipcmd
      select case (z(  2))
         case(0)
            f( 11)=x( 11)-x( 17)
         case(-1)
            f( 11)=x( 11)-x( 16)
         case(1)
            f( 11)=x( 11)-x( 15)
      end select

!& algeq         ! output current computation, consider protection status
      f( 12)=x( 29)*x( 85) - x(  9)

!& tf1p2lim
      select case (z(  3))
         case(0)
            f( 13)=x( 95)-1*x( 11)+x( 29)
         case(1)
            f( 13)=x( 95)-prm( 57)*prm(  4)
         case(-1)
            f( 13)=x( 95)-prm( 50)*prm(  4)
      end select
      select case (z(  4))
         case(0)
            f( 14)=x( 95)
         case(1)
            f( 14)=x( 29)-prm( 49)
         case(-1)
            f( 14)=x( 29)-prm( 50)
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current
      f( 15)=x( 13) -x( 35)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) - (1-x( 35))*(prm( 30)*prm(  1)*0.707 + (1-prm( 30))*prm(  1))

!& algeq
      f( 16)=x( 14) + x( 35)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) + (1-x( 35))*prm(  1)

!& algeq                 ! reactive current computation limit and update
      f( 17)=-x( 24) + prm( 45) - x( 28)

!& limvb
      select case (z(  5))
         case(0)
            f( 18)=x( 12)-x( 28)
         case(-1)
            f( 18)=x( 12)-x( 14)
         case(1)
            f( 18)=x( 12)-x( 13)
      end select

!& algeq						!
      f( 19)=x( 30)*x( 85) - x( 10)

!& tf1p
      f( 20)=(-x( 30)+1.*x( 12))

!& algeq 				  ! Active - reactive power priority, max active current
      f( 21)=x( 15) - x( 35)*prm(  2) -  (1-x( 35))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2))

!& db 						! Reactive current injection, voltage support
      select case (z(  6))
         case(0)
            f( 22)=x( 24)
         case(-1)
            f( 22)=x( 24)-(-prm( 24)*prm(  1)*(prm( 21) + prm( 30)))-(prm( 22)*prm(  1)*(prm( 21) + prm( 30) ))*(x(  7)-prm( 26))
         case(1)
            f( 22)=x( 24)-prm( 25)*prm(  1)-prm( 23)*prm(  1)*prm( 28)*(x(  7)-prm( 27))
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag
      f( 23)=x(  7) + x( 31)

!& timer5
      select case (z(  7))
         case (-1)
            f( 24)=x( 33)
            f( 25)=x( 96)
         case (0)
            f( 24)=x( 33)
            f( 25)= 1.
         case (1)
            f( 24)=x( 33)-1.
            f( 25)= 0.
      end select

!& algeq 		
      f( 26)=x( 26) -1 + x( 33)

!& hyst
      if(z(  8) == 1)then
         f( 27)=x( 25)-1.-(1.-1.)*(x( 26)-1.1)/(1.1-0.9)
      else
         f( 27)=x( 25)-0.-(0.-0.)*(x( 26)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 28)=x( 51) - 1 + x( 25)

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               f( 29)=x( 51)
            case(1)
               f( 29)=x( 52)-5
            case(-1)
               f( 29)=x( 52)-0.
         end select
      else
         select case (z(  9))
            case(0)
               f( 29)=x( 51)-x( 52)
            case(1)
               f( 29)=x( 52)-5
            case(-1)
               f( 29)=x( 52)-0.
         end select
      endif

!& algeq
      f( 30)=x( 55) - 1 + x( 51)

!& algeq
      f( 31)=x( 56) + prm( 17) - x( 52)

!& swsign
      select case (z( 10))
         case(1)
            f( 32)=x( 54)-x( 83)
         case(2)
            f( 32)=x( 54)-x( 55)
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            f( 33)=x( 97)-1*x( 54)+x( 53)
         case(1)
            f( 33)=x( 97)-prm( 58)*prm( 54)
         case(-1)
            f( 33)=x( 97)-prm( 50)*prm( 54)
      end select
      select case (z( 12))
         case(0)
            f( 34)=x( 97)
         case(1)
            f( 34)=x( 53)-prm( 49)
         case(-1)
            f( 34)=x( 53)-prm( 51)
      end select

!& algeq								! High voltage ride-through and HV protection flag
      f( 35)=x( 32) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 13))
         case (  1)
            f( 36)=0.+ ( (0.-0.)*(x( 32)-(-999))/(0.-(-999)) ) -x( 27)
         case (  2)
            f( 36)=0.+ ( (1.-0.)*(x( 32)-0.)/(0.-0.) ) -x( 27)
         case (  3)
            f( 36)=1.+ ( (1.-1.)*(x( 32)-0.)/(999-0.) ) -x( 27)
      end select

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               f( 37)=x( 27)
            case(1)
               f( 37)=x( 58)-5
            case(-1)
               f( 37)=x( 58)-0.
         end select
      else
         select case (z( 14))
            case(0)
               f( 37)=x( 27)-x( 58)
            case(1)
               f( 37)=x( 58)-5
            case(-1)
               f( 37)=x( 58)-0.
         end select
      endif

!& algeq
      f( 38)=x( 57) - 1 + x( 27)

!& algeq
      f( 39)=x( 61) - 1 + x( 27)

!& algeq
      f( 40)=x( 62) + prm( 17) - x( 58)

!& swsign
      select case (z( 15))
         case(1)
            f( 41)=x( 60)-x( 83)
         case(2)
            f( 41)=x( 60)-x( 61)
      end select

!& algeq
      f( 42)=x( 82) - x( 60)*x( 57)

!& tf1p2lim
      select case (z( 16))
         case(0)
            f( 43)=x( 98)-1*x( 82)+x( 59)
         case(1)
            f( 43)=x( 98)-prm( 59)*prm( 54)
         case(-1)
            f( 43)=x( 98)-prm( 50)*prm( 54)
      end select
      select case (z( 17))
         case(0)
            f( 44)=x( 98)
         case(1)
            f( 44)=x( 59)-prm( 49)
         case(-1)
            f( 44)=x( 59)-prm( 51)
      end select

!& algeq 						! reactive current priority flag
      f( 45)=x( 34) - x(  7) + prm( 26)

!& swsign
      select case (z( 18))
         case(1)
            f( 46)=x( 35)-x( 83)
         case(2)
            f( 46)=x( 35)-x( 84)
      end select

!& algeq                     ! PLL
      f( 47)=x( 49) - x(  7) + prm( 11)

!& swsign
      select case (z( 19))
         case(1)
            f( 48)=x( 48)-x( 83)
         case(2)
            f( 48)=x( 48)-x( 84)
      end select

!& int
      if (1.< 0.005)then
         f( 49)=x( 19)-x(  6)
      else
         f( 49)=x( 19)
      endif

!& pictl
      f( 50)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 20)
      f( 51)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 20)+x( 99)-x( 50)

!& algeq
      f( 52)=x( 18) - x( 50) + omega*2*pi*50

!& algeq
      f( 53)=x( 19) - x( 18)*x( 48)

!& tf1p              ! voltage measurement
      f( 54)=(-x( 36)+1.*x(  3))

!& tf1p
      f( 55)=(-x( 37)+1.*x(  4))

!& algeq                     ! filter PLL frequency , convert to Hz
      f( 56)=x( 38) - x( 50)/(2*pi*50)

!& algeq
      f( 57)=x( 39) - 50*x( 38)

!& tf1p
      f( 58)=(-x( 40)+1*x( 39))

!& algeq                         ! frequency protection flag FFl, and FFh
      f( 59)=x( 46) - x( 40) + prm( 15)

!& swsign
      select case (z( 20))
         case(1)
            f( 60)=x( 41)-x( 83)
         case(2)
            f( 60)=x( 41)-x( 84)
      end select

!& algeq
      f( 61)=x( 47) - prm( 16) + x( 40)

!& swsign
      select case (z( 21))
         case(1)
            f( 62)=x( 43)-x( 83)
         case(2)
            f( 62)=x( 43)-x( 84)
      end select

!& hyst
      if(z( 22) == 1)then
         f( 63)=x( 42)-1.-(1.-1.)*(x( 41)-1.1)/(1.1-0.9)
      else
         f( 63)=x( 42)-0.-(0.-0.)*(x( 41)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 23) == 1)then
         f( 64)=x( 44)-1.-(1.-1.)*(x( 43)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 44)-0.-(0.-0.)*(x( 43)-0.9)/(1.1-0.9)
      endif

!& algeq						       ! Low frequency protection and reconnection
      f( 65)=x( 63) - 1 + x( 42)

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               f( 66)=x( 63)
            case(1)
               f( 66)=x( 64)-5
            case(-1)
               f( 66)=x( 64)-0.
         end select
      else
         select case (z( 24))
            case(0)
               f( 66)=x( 63)-x( 64)
            case(1)
               f( 66)=x( 64)-5
            case(-1)
               f( 66)=x( 64)-0.
         end select
      endif

!& algeq
      f( 67)=x( 67) - 1 + x( 63)

!& algeq
      f( 68)=x( 68) + prm( 18) - x( 64)

!& swsign
      select case (z( 25))
         case(1)
            f( 69)=x( 66)-x( 83)
         case(2)
            f( 69)=x( 66)-x( 67)
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            f( 70)=x(100)-1*x( 66)+x( 65)
         case(1)
            f( 70)=x(100)-prm( 59)*prm( 54)
         case(-1)
            f( 70)=x(100)-prm( 50)*prm( 54)
      end select
      select case (z( 27))
         case(0)
            f( 71)=x(100)
         case(1)
            f( 71)=x( 65)-prm( 49)
         case(-1)
            f( 71)=x( 65)-prm( 51)
      end select

!& algeq								! High frequency protection and reconnection
      f( 72)=x( 69) - 1 + x( 44)

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               f( 73)=x( 69)
            case(1)
               f( 73)=x( 70)-5
            case(-1)
               f( 73)=x( 70)-0.
         end select
      else
         select case (z( 28))
            case(0)
               f( 73)=x( 69)-x( 70)
            case(1)
               f( 73)=x( 70)-5
            case(-1)
               f( 73)=x( 70)-0.
         end select
      endif

!& algeq
      f( 74)=x( 73) - 1 + x( 69)

!& algeq
      f( 75)=x( 74) + prm( 18) - x( 70)

!& swsign
      select case (z( 29))
         case(1)
            f( 76)=x( 72)-x( 83)
         case(2)
            f( 76)=x( 72)-x( 73)
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            f( 77)=x(101)-1*x( 72)+x( 71)
         case(1)
            f( 77)=x(101)-prm( 59)*prm( 54)
         case(-1)
            f( 77)=x(101)-prm( 50)*prm( 54)
      end select
      select case (z( 31))
         case(0)
            f( 78)=x(101)
         case(1)
            f( 78)=x( 71)-prm( 49)
         case(-1)
            f( 78)=x( 71)-prm( 51)
      end select

!& algeq				! Frequency droop control
      f( 79)=x( 75) + (x( 40)/50) - prm( 60)

!& db
      select case (z( 32))
         case(0)
            f( 80)=x( 76)
         case(-1)
            f( 80)=x( 76)-0.-1.*(x( 75)-prm( 32))
         case(1)
            f( 80)=x( 76)-0.-1.*(x( 75)-prm( 33))
      end select

!& algeq
      f( 81)=x( 77) - x( 76)*prm( 35)

!& algeq
      f( 82)=x( 78) - x( 76)*prm( 34)

!& lim
      select case (z( 33))
         case(0)
            f( 83)=x( 79)-x( 77)
         case(-1)
            f( 83)=x( 79)-(-prm( 62))
         case(1)
            f( 83)=x( 79)-0.00001
      end select

!& lim
      select case (z( 34))
         case(0)
            f( 84)=x( 80)-x( 78)
         case(-1)
            f( 84)=x( 80)-0.0001
         case(1)
            f( 84)=x( 80)-prm( 61)
      end select

!& algeq
      f( 85)=x( 81)-x( 80)-x( 79)

!& algeq
      f( 86)=x( 45)+prm( 43)-x( 81)

!& algeq                ! frequency deviation in Hz
      f( 87)=-x( 86) + x( 40)-prm( 60)*50

!& tfder1p               ! Rocof measurement in Hz/s
      f( 88)=-x(102)+x( 86)
      if (prm( 38)< 0.005)then
         f( 89)=1/prm( 38)*x( 86)-x( 87)
      else
         f( 89)=1/prm( 38)*(x( 86)-x(102))-x( 87)
      endif

!& abs
      if(z( 35) == 1 )then
         f( 90)=x( 88)-x( 87)
      else
         f( 90)=x( 88)+x( 87)
      endif

!& algeq               ! rocof protection and timer
      f( 91)=-x( 89) +prm( 39) -x( 88)

!& swsign
      select case (z( 36))
         case(1)
            f( 92)=x( 90)-x( 83)
         case(2)
            f( 92)=x( 90)-x( 84)
      end select

!& algeq
      f( 93)=x( 92) - 1 + x( 90)

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               f( 94)=x( 92)
            case(1)
               f( 94)=x( 93)-5
            case(-1)
               f( 94)=x( 93)-0
         end select
      else
         select case (z( 37))
            case(0)
               f( 94)=x( 92)-x( 93)
            case(1)
               f( 94)=x( 93)-5
            case(-1)
               f( 94)=x( 93)-0
         end select
      endif

!& algeq
      f( 95)=-x( 94) + 0.25 - x( 93)

!& swsign
      select case (z( 38))
         case(1)
            f( 96)=x( 91)-x( 83)
         case(2)
            f( 96)=x( 91)-x( 84)
      end select

!& algeq                 ! alignment equations
      f( 97)=x( 21) - x( 36)*cos(x(  6)) - x( 37)*sin(x(  6))

!& algeq
      f( 98)=x( 20) + x( 36)*sin(x(  6)) - x( 37)*cos(x(  6))

!& algeq
      f( 99)=x( 22) - x( 21)*x(  9)

!& algeq
      f(100)=x( 23) - x( 21)*x( 10)

!& algeq
      f(101)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f(102)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

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

!& algeq         ! output current computation, consider protection status

!& tf1p2lim
      select case (z(  3))
         case(0)
            if(x( 95)>prm( 57)*prm(  4))then
               z(  3)=1
            elseif(x( 95)<prm( 50)*prm(  4))then
               z(  3)=-1
            endif
         case(1)
            if(1*x( 11)-x( 29)<prm( 57)*prm(  4))then
               z(  3)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 29)>prm( 50)*prm(  4))then
               z(  3)= 0
            endif
      end select
      select case (z(  4))
         case(0)
            if(x( 29)>prm( 49))then
               z(  4)=1
               eqtyp( 14)=0
            elseif(x( 29)<prm( 50))then
               z(  4)=-1
               eqtyp( 14)=0
            endif
         case(1)
            if (x( 95)<0.)then
               z(  4)= 0
               eqtyp( 14)= 29
            endif
         case(-1)
            if(x( 95)>0.)then
               z(  4)= 0
               eqtyp( 14)= 29
            endif
      end select

!& algeq 				  ! Active - reactive power priority, compute max and min reactive current

!& algeq

!& algeq                 ! reactive current computation limit and update

!& limvb
      select case (z(  5))
         case(0)
            if(x( 28)>x( 13))then
               z(  5)=1
            elseif(x( 28)<x( 14))then
               z(  5)=-1
            endif
         case(-1)
            if(x( 28)>x( 14))then
               z(  5)=0
            endif
         case(1)
            if(x( 28)<x( 13))then
               z(  5)=0
            endif
      end select

!& algeq						!

!& tf1p

!& algeq 				  ! Active - reactive power priority, max active current

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
         if(x( 31) >= (-prm( 12)))then
            z(  7)=0
            eqtyp( 25)= 96
         endif
      else
         if(x( 31) < (-prm( 12)))then
            z(  7)=-1
            eqtyp( 25)=0
         endif
      endif
      if(z(  7) == 0)then
         if(x( 31) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x( 96) > 0.)then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))then
            if(x( 96) > prm(  6)+(0.-prm(  6))*(x( 31)-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x( 96) > prm(  6)+(prm(  6)-prm(  6))*(x( 31)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 13) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))then
            if(x( 96) > prm(  8)+(prm(  6)-prm(  8))*(x( 31)-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31))))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-prm( 12)))then
            if(x( 96) > prm(  7)+(prm(  8)-prm(  7))*(x( 31)-(-prm( 12)))/((-(prm( 29)*prm( 14) + (1-prm( 29))*prm( 31)))-(-prm( 12))))then
               z(  7)=1
            endif
         endif
      endif

!& algeq 		

!& hyst
      if (z(  8) == -1)then
         if(x( 26)>1.1)then
            z(  8)=1
         endif
      else
         if(x( 26)<0.9)then
            z(  8)=-1
         endif
      endif

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               if(x( 52)<0.)then
                  z(  9)=-1
                  eqtyp( 29)=0
               elseif(x( 52)>5)then
                  z(  9)= 1
                  eqtyp( 29)=0
               endif
            case(1)
               if(x( 51)<0.)then
                  z(  9)=0
                  eqtyp( 29)= 52
               endif
            case(-1)
               if(x( 51)>0.)then
                  z(  9)=0
                  eqtyp( 29)= 52
               endif
         end select
      else
         select case (z(  9))
            case(0)
               if(x( 52)<0.)then
                  z(  9)=-1
               elseif(x( 52)>5)then
                  z(  9)= 1
               endif
            case(1)
               if(x( 51)<5)then
                  z(  9)=0
               endif
            case(-1)
               if(x( 51)>0.)then
                  z(  9)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 10))
         case(1)
            if(x( 56)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 56)>=0.)then
               z( 10)=1
            endif
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            if(x( 97)>prm( 58)*prm( 54))then
               z( 11)=1
            elseif(x( 97)<prm( 50)*prm( 54))then
               z( 11)=-1
            endif
         case(1)
            if(1*x( 54)-x( 53)<prm( 58)*prm( 54))then
               z( 11)= 0
            endif
         case(-1)
            if(1*x( 54)-x( 53)>prm( 50)*prm( 54))then
               z( 11)= 0
            endif
      end select
      select case (z( 12))
         case(0)
            if(x( 53)>prm( 49))then
               z( 12)=1
               eqtyp( 34)=0
            elseif(x( 53)<prm( 51))then
               z( 12)=-1
               eqtyp( 34)=0
            endif
         case(1)
            if (x( 97)<0.)then
               z( 12)= 0
               eqtyp( 34)= 53
            endif
         case(-1)
            if(x( 97)>0.)then
               z( 12)= 0
               eqtyp( 34)= 53
            endif
      end select

!& algeq								! High voltage ride-through and HV protection flag

!& pwlin4
      if(x( 32)<(-999))then
         z( 13)=1
      elseif(x( 32)>=999)then
         z( 13)=  3
      elseif((-999)<=x( 32) .and. x( 32)<0.)then
         z( 13)=  1
      elseif(0.<=x( 32) .and. x( 32)<0.)then
         z( 13)=  2
      elseif(0.<=x( 32) .and. x( 32)<999)then
         z( 13)=  3
      endif

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               if(x( 58)<0.)then
                  z( 14)=-1
                  eqtyp( 37)=0
               elseif(x( 58)>5)then
                  z( 14)= 1
                  eqtyp( 37)=0
               endif
            case(1)
               if(x( 27)<0.)then
                  z( 14)=0
                  eqtyp( 37)= 58
               endif
            case(-1)
               if(x( 27)>0.)then
                  z( 14)=0
                  eqtyp( 37)= 58
               endif
         end select
      else
         select case (z( 14))
            case(0)
               if(x( 58)<0.)then
                  z( 14)=-1
               elseif(x( 58)>5)then
                  z( 14)= 1
               endif
            case(1)
               if(x( 27)<5)then
                  z( 14)=0
               endif
            case(-1)
               if(x( 27)>0.)then
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
            if(x( 62)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 62)>=0.)then
               z( 15)=1
            endif
      end select

!& algeq

!& tf1p2lim
      select case (z( 16))
         case(0)
            if(x( 98)>prm( 59)*prm( 54))then
               z( 16)=1
            elseif(x( 98)<prm( 50)*prm( 54))then
               z( 16)=-1
            endif
         case(1)
            if(1*x( 82)-x( 59)<prm( 59)*prm( 54))then
               z( 16)= 0
            endif
         case(-1)
            if(1*x( 82)-x( 59)>prm( 50)*prm( 54))then
               z( 16)= 0
            endif
      end select
      select case (z( 17))
         case(0)
            if(x( 59)>prm( 49))then
               z( 17)=1
               eqtyp( 44)=0
            elseif(x( 59)<prm( 51))then
               z( 17)=-1
               eqtyp( 44)=0
            endif
         case(1)
            if (x( 98)<0.)then
               z( 17)= 0
               eqtyp( 44)= 59
            endif
         case(-1)
            if(x( 98)>0.)then
               z( 17)= 0
               eqtyp( 44)= 59
            endif
      end select

!& algeq 						! reactive current priority flag

!& swsign
      select case (z( 18))
         case(1)
            if(x( 34)<0.)then
               z( 18)=2
            endif
         case(2)
            if(x( 34)>=0.)then
               z( 18)=1
            endif
      end select

!& algeq                     ! PLL

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
            if(x( 46)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 46)>=0.)then
               z( 20)=1
            endif
      end select

!& algeq

!& swsign
      select case (z( 21))
         case(1)
            if(x( 47)<0.)then
               z( 21)=2
            endif
         case(2)
            if(x( 47)>=0.)then
               z( 21)=1
            endif
      end select

!& hyst
      if (z( 22) == -1)then
         if(x( 41)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 41)<0.9)then
            z( 22)=-1
         endif
      endif

!& hyst
      if (z( 23) == -1)then
         if(x( 43)>1.1)then
            z( 23)=1
         endif
      else
         if(x( 43)<0.9)then
            z( 23)=-1
         endif
      endif

!& algeq						       ! Low frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               if(x( 64)<0.)then
                  z( 24)=-1
                  eqtyp( 66)=0
               elseif(x( 64)>5)then
                  z( 24)= 1
                  eqtyp( 66)=0
               endif
            case(1)
               if(x( 63)<0.)then
                  z( 24)=0
                  eqtyp( 66)= 64
               endif
            case(-1)
               if(x( 63)>0.)then
                  z( 24)=0
                  eqtyp( 66)= 64
               endif
         end select
      else
         select case (z( 24))
            case(0)
               if(x( 64)<0.)then
                  z( 24)=-1
               elseif(x( 64)>5)then
                  z( 24)= 1
               endif
            case(1)
               if(x( 63)<5)then
                  z( 24)=0
               endif
            case(-1)
               if(x( 63)>0.)then
                  z( 24)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 25))
         case(1)
            if(x( 68)<0.)then
               z( 25)=2
            endif
         case(2)
            if(x( 68)>=0.)then
               z( 25)=1
            endif
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            if(x(100)>prm( 59)*prm( 54))then
               z( 26)=1
            elseif(x(100)<prm( 50)*prm( 54))then
               z( 26)=-1
            endif
         case(1)
            if(1*x( 66)-x( 65)<prm( 59)*prm( 54))then
               z( 26)= 0
            endif
         case(-1)
            if(1*x( 66)-x( 65)>prm( 50)*prm( 54))then
               z( 26)= 0
            endif
      end select
      select case (z( 27))
         case(0)
            if(x( 65)>prm( 49))then
               z( 27)=1
               eqtyp( 71)=0
            elseif(x( 65)<prm( 51))then
               z( 27)=-1
               eqtyp( 71)=0
            endif
         case(1)
            if (x(100)<0.)then
               z( 27)= 0
               eqtyp( 71)= 65
            endif
         case(-1)
            if(x(100)>0.)then
               z( 27)= 0
               eqtyp( 71)= 65
            endif
      end select

!& algeq								! High frequency protection and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               if(x( 70)<0.)then
                  z( 28)=-1
                  eqtyp( 73)=0
               elseif(x( 70)>5)then
                  z( 28)= 1
                  eqtyp( 73)=0
               endif
            case(1)
               if(x( 69)<0.)then
                  z( 28)=0
                  eqtyp( 73)= 70
               endif
            case(-1)
               if(x( 69)>0.)then
                  z( 28)=0
                  eqtyp( 73)= 70
               endif
         end select
      else
         select case (z( 28))
            case(0)
               if(x( 70)<0.)then
                  z( 28)=-1
               elseif(x( 70)>5)then
                  z( 28)= 1
               endif
            case(1)
               if(x( 69)<5)then
                  z( 28)=0
               endif
            case(-1)
               if(x( 69)>0.)then
                  z( 28)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& swsign
      select case (z( 29))
         case(1)
            if(x( 74)<0.)then
               z( 29)=2
            endif
         case(2)
            if(x( 74)>=0.)then
               z( 29)=1
            endif
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            if(x(101)>prm( 59)*prm( 54))then
               z( 30)=1
            elseif(x(101)<prm( 50)*prm( 54))then
               z( 30)=-1
            endif
         case(1)
            if(1*x( 72)-x( 71)<prm( 59)*prm( 54))then
               z( 30)= 0
            endif
         case(-1)
            if(1*x( 72)-x( 71)>prm( 50)*prm( 54))then
               z( 30)= 0
            endif
      end select
      select case (z( 31))
         case(0)
            if(x( 71)>prm( 49))then
               z( 31)=1
               eqtyp( 78)=0
            elseif(x( 71)<prm( 51))then
               z( 31)=-1
               eqtyp( 78)=0
            endif
         case(1)
            if (x(101)<0.)then
               z( 31)= 0
               eqtyp( 78)= 71
            endif
         case(-1)
            if(x(101)>0.)then
               z( 31)= 0
               eqtyp( 78)= 71
            endif
      end select

!& algeq				! Frequency droop control

!& db
      select case (z( 32))
         case(0)
            if(x( 75)>prm( 33))then
               z( 32)=1
            elseif(x( 75)<prm( 32))then
               z( 32)=-1
            endif
         case(-1)
            if(x( 75)>prm( 32))then
               z( 32)=0
            endif
         case(1)
            if(x( 75)<prm( 33))then
               z( 32)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 33))
         case(0)
            if(x( 77)>0.00001)then
               z( 33)=1
            elseif(x( 77)<(-prm( 62)))then
               z( 33)=-1
            endif
         case(-1)
            if(x( 77)>(-prm( 62)))then
               z( 33)=0
            endif
         case(1)
            if(x( 77)<0.00001)then
               z( 33)=0
            endif
      end select

!& lim
      select case (z( 34))
         case(0)
            if(x( 78)>prm( 61))then
               z( 34)=1
            elseif(x( 78)<0.0001)then
               z( 34)=-1
            endif
         case(-1)
            if(x( 78)>0.0001)then
               z( 34)=0
            endif
         case(1)
            if(x( 78)<prm( 61))then
               z( 34)=0
            endif
      end select

!& algeq

!& algeq

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 35) == -1 )then
         if(x( 87)> blocktol1 )then
            z( 35)=1
         endif
      else
         if(x( 87)< - blocktol1 )then
            z( 35)=-1
         endif
      endif

!& algeq               ! rocof protection and timer

!& swsign
      select case (z( 36))
         case(1)
            if(x( 89)<0.)then
               z( 36)=2
            endif
         case(2)
            if(x( 89)>=0.)then
               z( 36)=1
            endif
      end select

!& algeq

!& inlim
      if (1>= 0.005)then
         select case (z( 37))
            case(0)
               if(x( 93)<0)then
                  z( 37)=-1
                  eqtyp( 94)=0
               elseif(x( 93)>5)then
                  z( 37)= 1
                  eqtyp( 94)=0
               endif
            case(1)
               if(x( 92)<0.)then
                  z( 37)=0
                  eqtyp( 94)= 93
               endif
            case(-1)
               if(x( 92)>0.)then
                  z( 37)=0
                  eqtyp( 94)= 93
               endif
         end select
      else
         select case (z( 37))
            case(0)
               if(x( 93)<0)then
                  z( 37)=-1
               elseif(x( 93)>5)then
                  z( 37)= 1
               endif
            case(1)
               if(x( 92)<5)then
                  z( 37)=0
               endif
            case(-1)
               if(x( 92)>0)then
                  z( 37)=0
               endif
         end select
      endif

!& algeq

!& swsign
      select case (z( 38))
         case(1)
            if(x( 94)<0.)then
               z( 38)=2
            endif
         case(2)
            if(x( 94)>=0.)then
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

end subroutine inj_IBG3l
