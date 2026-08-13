!  MODEL NAME : inj_IBG3i               
!  MODEL DESCRIPTION FILE : IBG3_initial.txt
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
!  Parameters :
!       prm( 35)=  vxlv  
!       prm( 36)=  vylv  
!       prm( 37)=  Vref  
!       prm( 38)=  Pext  
!       prm( 39)=  Qext  
!       prm( 40)=  Iqref  
!       prm( 41)=  Ipref  
!       prm( 42)=  kpll  
!       prm( 43)=  theta_PLL  
!       prm( 44)=  Uplim  
!       prm( 45)=  Downlim  
!       prm( 46)=  Downlimdisc  
!       prm( 47)=  UplimdeltaP  
!       prm( 48)=  DownlimdeltaP  
!       prm( 49)=  Tlim  
!       prm( 50)=  Uplimdis  
!       prm( 51)=  downlimdis  
!       prm( 52)=  ratemax  
!       prm( 53)=  rate  
!       prm( 54)=  rateh  
!       prm( 55)=  fref  
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
!       x( 36)=  Pflaga                 Switch input a
!       x( 37)=  Pflagb                 Switch input b
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
!       x( 49)=  flagla                
!       x( 50)=  flaglb                
!       x( 51)=  deltafh               
!       x( 52)=  flagha                
!       x( 53)=  flaghb                
!       x( 54)=  PLLmulta              
!       x( 55)=  PLLmultb              
!       x( 56)=  mult                  
!       x( 57)=  deltaVPLL             
!       x( 58)=  wpll                  
!       x( 59)=  g                     
!       x( 60)=  tr                    
!       x( 61)=  Fr                    
!       x( 62)=  Frtemp                
!       x( 63)=  fvla                  
!       x( 64)=  fvlb                  
!       x( 65)=  deltafvl              
!       x( 66)=  g1                    
!       x( 67)=  tr1                   
!       x( 68)=  Frvh                  
!       x( 69)=  Frvhtemp              
!       x( 70)=  fvha                  
!       x( 71)=  fvhb                  
!       x( 72)=  deltafvh              
!       x( 73)=  g2                    
!       x( 74)=  tr2                   
!       x( 75)=  Frfl                  
!       x( 76)=  Frfltemp              
!       x( 77)=  ffla                  
!       x( 78)=  fflb                  
!       x( 79)=  deltaffl              
!       x( 80)=  g3                    
!       x( 81)=  tr3                   
!       x( 82)=  Frfh                  
!       x( 83)=  Frfhtemp              
!       x( 84)=  ffha                  
!       x( 85)=  ffhb                  
!       x( 86)=  deltaffh              
!       x( 87)=  w1                    
!       x( 88)=  w2                    
!       x( 89)=  w3                    
!       x( 90)=  w4                    
!       x( 91)=  w5                    
!       x( 92)=  w6                    
!       x( 93)=  w7                    
!       x( 94)=  Frvhtemp1             

!.........................................................................................................

subroutine inj_IBG3i(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 34
      nbaddpar= 21
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
      parname( 35)='vxlv'
      parname( 36)='vylv'
      parname( 37)='Vref'
      parname( 38)='Pext'
      parname( 39)='Qext'
      parname( 40)='Iqref'
      parname( 41)='Ipref'
      parname( 42)='kpll'
      parname( 43)='theta_PLL'
      parname( 44)='Uplim'
      parname( 45)='Downlim'
      parname( 46)='Downlimdisc'
      parname( 47)='UplimdeltaP'
      parname( 48)='DownlimdeltaP'
      parname( 49)='Tlim'
      parname( 50)='Uplimdis'
      parname( 51)='downlimdis'
      parname( 52)='ratemax'
      parname( 53)='rate'
      parname( 54)='rateh'
      parname( 55)='fref'
      adix=  1
      adiy=  2
      nbxvar=101
      nbzvar= 34

!........................................................................................
   case (define_obs)
      nbobs= 23
      obsname(  1)='Ip'
      obsname(  2)='Iq'
      obsname(  3)='Pgen'
      obsname(  4)='Qgen'
      obsname(  5)='Vm'
      obsname(  6)='PLLPhaseAngle'
      obsname(  7)='fm'
      obsname(  8)='fmfilt'
      obsname(  9)='Fr'
      obsname( 10)='Ffl'
      obsname( 11)='Ffh'
      obsname( 12)='Frtemp'
      obsname( 13)='Ipcmd'
      obsname( 14)='Vt'
      obsname( 15)='wpll'
      obsname( 16)='vq'
      obsname( 17)='z1'
      obsname( 18)='tr1'
      obsname( 19)='Ipmax'
      obsname( 20)='Iqmax'
      obsname( 21)='Iqmin'
      obsname( 22)='deltafvh'
      obsname( 23)='Frvh'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 22)              
      obs(  4)=x( 23)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 41)              
      obs(  8)=x( 42)              
      obs(  9)=x( 61)              
      obs( 10)=x( 44)              
      obs( 11)=x( 46)              
      obs( 12)=x( 62)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 58)              
      obs( 16)=x( 20)              
      obs( 17)=x( 27)              
      obs( 18)=x( 67)              
      obs( 19)=x( 15)              
      obs( 20)=x( 13)              
      obs( 21)=x( 14)              
      obs( 22)=x( 72)              
      obs( 23)=x( 68)              

!........................................................................................
   case (initialize)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 35)= vx + prm( 18)*ix - prm( 19)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 36)= vy + prm( 18)*iy + prm( 19)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 37)= dsqrt(prm( 35)**2 + prm( 36)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 38)= -prm( 35)*ix-prm( 36)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 39)= +prm( 35)*iy-prm( 36)*ix

!Iqref = -{Qext}/{Vref}
      prm( 40)= -prm( 39)/prm( 37)

!Ipref = -{Pext}/{Vref}
      prm( 41)= -prm( 38)/prm( 37)

!kpll = 10/({tau}*0.001)
      prm( 42)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 43)= atan(prm( 36)/prm( 35))

!Uplim = 9999
      prm( 44)= 9999

!Downlim = -9999
      prm( 45)= -9999

!Downlimdisc = 0
      prm( 46)= 0

!UplimdeltaP = 9999
      prm( 47)= 9999

!DownlimdeltaP = 0
      prm( 48)= 0

!Tlim = 0.01
      prm( 49)= 0.01

!Uplimdis = 0
      prm( 50)= 0

!downlimdis = -9999
      prm( 51)= -9999

!ratemax = {Iprate}*{IN}
      prm( 52)= prm(  3)*prm(  2)

!rate = 0.5
      prm( 53)= 0.5

!rateh = 0.5
      prm( 54)= 0.5

!fref = 1
      prm( 55)= 1

!vxl =  {vxlv}
      x(  3)= prm( 35)

!vyl =  {vylv}
      x(  4)= prm( 36)

!Vt =  {Vref}
      x(  5)= prm( 37)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 43)

!Vm =  {Vref}
      x(  7)= prm( 37)

!x2 =  {Vref}
      x(  8)= prm( 37)

!Ip =  {Ipref}
      x(  9)= prm( 41)

!Iq =  {Iqref}
      x( 10)= prm( 40)

!Ipcmd =  {Ipref}
      x( 11)= prm( 41)

!Iqcmd =  {Iqref}
      x( 12)= prm( 40)

!Iqmax =  dsqrt({Imax}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm(  1)**2 - prm( 41)**2 )

!Iqmin =  - dsqrt({Imax}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm(  1)**2 - prm( 41)**2 )

!Ipmax =  {IN}
      x( 15)= prm(  2)

!Ipmin =  -0.001
      x( 16)= -0.001

!x4 =  {Ipref}
      x( 17)= prm( 41)

!DeltaW =  0
      x( 18)= 0

!DeltaWf =   0
      x( 19)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 20)= -prm( 35)*sin(prm( 43)) + prm( 36)*cos(prm( 43))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 21)= prm( 35)*cos(prm( 43)) + prm( 36)*sin(prm( 43))

!Pgen =  -{Pext}
      x( 22)= -prm( 38)

!Qgen =  -{Qext}
      x( 23)= -prm( 39)

!Iqext =  0
      x( 24)= 0

!Fvl =  1
      x( 25)= 1

!Fvli =  1
      x( 26)= 1

!z1 =  0.
      x( 27)= 0.

!x5 =  {Iqref}
      x( 28)= prm( 40)

!Iptemp =  {Ipref}
      x( 29)= prm( 41)

!Iqtemp =  {Iqref}
      x( 30)= prm( 40)

!x10 =  -{Vref}
      x( 31)= -prm( 37)

!x11 =  {Vref} - {Vmax}
      x( 32)= prm( 37) - prm(  9)

!z =  0.
      x( 33)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 34)= prm( 37) - prm( 25)

!Pflag =  1
      x( 35)= 1

!Pflaga =  1
      x( 36)= 1

!Pflagb =  0.
      x( 37)= 0.

!vxlm =  {vxlv}
      x( 38)= prm( 35)

!vylm =  {vylv}
      x( 39)= prm( 36)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 40)= -0.5*(prm( 35)*sin(prm( 43)) - prm( 36)*cos(prm( 43))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 41)= 50*(-0.5*(prm( 35)*sin(prm( 43)) - prm( 36)*cos(prm( 43))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 42)= 50*(-0.5*(prm( 35)*sin(prm( 43)) - prm( 36)*cos(prm( 43))) + 1)

!Ffli =  1.
      x( 43)= 1.

!Ffl =  1.
      x( 44)= 1.

!Ffhi =  1.
      x( 45)= 1.

!Ffh =  1.
      x( 46)= 1.

!Ptot =  -{Pext}
      x( 47)= -prm( 38)

!deltafl =  50*[omega] - {fmin}
      x( 48)= 50*omega - prm( 15)

!flagla =  1
      x( 49)= 1

!flaglb =  0
      x( 50)= 0

!deltafh =  {fmax} - 50*[omega]
      x( 51)= prm( 16) - 50*omega

!flagha =  1
      x( 52)= 1

!flaghb =  0
      x( 53)= 0

!PLLmulta =  1
      x( 54)= 1

!PLLmultb =  0
      x( 55)= 0

!mult =  1
      x( 56)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 57)= prm( 37) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 58)= -(prm( 35)*sin(prm( 43)) - prm( 36)*cos(prm( 43)))*prm( 42) + 2*pi*50

!g =  0
      x( 59)= 0

!tr =  0
      x( 60)= 0

!Fr =  1
      x( 61)= 1

!Frtemp =  1
      x( 62)= 1

!fvla =  1
      x( 63)= 1

!fvlb =  1
      x( 64)= 1

!deltafvl =  -{Tr}
      x( 65)= -prm( 17)

!g1 =  1
      x( 66)= 1

!tr1 = 0
      x( 67)=0

!Frvh =  1
      x( 68)= 1

!Frvhtemp =  1
      x( 69)= 1

!fvha =  1
      x( 70)= 1

!fvhb =  1
      x( 71)= 1

!deltafvh =  -{Tr}
      x( 72)= -prm( 17)

!g2 =  0
      x( 73)= 0

!tr2 =  0
      x( 74)= 0

!Frfl =  1
      x( 75)= 1

!Frfltemp =  1
      x( 76)= 1

!ffla =  1
      x( 77)= 1

!fflb =  1
      x( 78)= 1

!deltaffl =  -{Tr}
      x( 79)= -prm( 17)

!g3 =  0
      x( 80)= 0

!tr3 =  0
      x( 81)= 0

!Frfh =  1
      x( 82)= 1

!Frfhtemp =  1
      x( 83)= 1

!ffha =  1
      x( 84)= 1

!ffhb =  1
      x( 85)= 1

!deltaffh =  -{Tr}
      x( 86)= -prm( 17)

!w1 =  0
      x( 87)= 0

!w2 =  0
      x( 88)= 0

!w3 =  0
      x( 89)= 0

!w4 =  0
      x( 90)= 0

!w5 =  0
      x( 91)= 0

!w6 =  0
      x( 92)= 0

!w7 =  0
      x( 93)= 0

!Frvhtemp1 = 1
      x( 94)=1

!& algeq
      eqtyp(  1)=0

!& algeq
      eqtyp(  2)=0

!& algeq
      eqtyp(  3)=0

!& tf1p
      eqtyp(  4)=  7
      tc(  4)=prm(  5)

!& max1v1c
      eqtyp(  5)=0
      if(x(  7)<0.01)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq
      eqtyp(  6)=0

!& algeq
      eqtyp(  7)=0

!& limvb
      eqtyp(  8)=0
      if(x( 17)>x( 15))then
         z(  2)=1
      elseif(x( 17)<x( 16))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq
      eqtyp(  9)=0

!& tf1p2lim
      if(prm(  4)< 0.001)then
         prm(  4)=0.d0
         prm( 45)=-huge(0.d0)
         prm( 44)= huge(0.d0)
         prm( 45)=-huge(0.d0)
         prm( 52)= huge(0.d0)
      endif
      if(1*x( 11)-x( 29)>prm( 52)*prm(  4))then
         z(  3)=1
      elseif(1*x( 11)-x( 29)<prm( 45)*prm(  4))then
         z(  3)=-1
      else
         z(  3)=0
      endif
      eqtyp( 10)=0
      if(x( 29)>prm( 44))then
         z(  4)=1
         eqtyp( 11)=0
      elseif(x( 29)<prm( 45))then
         z(  4)=-1
         eqtyp( 11)=0
      else
         z(  4)=0
         eqtyp( 11)= 29
      endif
      tc( 11)=prm(  4)

!& algeq 				  ! Active - reactive power priority
      eqtyp( 12)=0

!& algeq
      eqtyp( 13)=0

!& algeq
      eqtyp( 14)=0

!& limvb
      eqtyp( 15)=0
      if(x( 28)>x( 13))then
         z(  5)=1
      elseif(x( 28)<x( 14))then
         z(  5)=-1
      else
         z(  5)=0
      endif

!& algeq						!  Over/Under voltage/frequency flags
      eqtyp( 16)=0

!& tf1p
      eqtyp( 17)= 30
      tc( 17)=prm(  4)

!& algeq 				  ! Active - reactive power priority
      eqtyp( 18)=0

!& db 						!Reactive current injection
      eqtyp( 19)=0
      if(x(  7)>prm( 26))then
         z(  6)=1
      elseif(x(  7)<prm( 25))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq   						!  Low voltage ride-through and LV protection flag
      eqtyp( 20)=0

!& timer5
      eqtyp( 21)=0
      eqtyp( 22)=0
      z(  7)=-1
      x( 96)=0.

!& algeq 		
      eqtyp( 23)=0

!& hyst
      eqtyp( 24)=0
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
      eqtyp( 25)=0

!& inlim
      if (1>= 0.005)then
         tc( 26)=1
      endif
      if (x( 60)>5)then
         z(  9)=1
         eqtyp( 26)=0
      elseif (x( 60)<0.) then
         z(  9)=-1
         eqtyp( 26)=0
      else
         z(  9)=0
         if (1>= 0.005)then
            eqtyp( 26)= 60
         else
            eqtyp( 26)=0
         endif
      endif

!& algeq
      eqtyp( 27)=0

!& algeq
      eqtyp( 28)=0

!& algeq
      eqtyp( 29)=0

!& swsign
      eqtyp( 30)=0
      if(x( 65)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& tf1p2lim
      if(prm( 49)< 0.001)then
         prm( 49)=0.d0
         prm( 46)=-huge(0.d0)
         prm( 44)= huge(0.d0)
         prm( 45)=-huge(0.d0)
         prm( 53)= huge(0.d0)
      endif
      if(1*x( 62)-x( 61)>prm( 53)*prm( 49))then
         z( 11)=1
      elseif(1*x( 62)-x( 61)<prm( 45)*prm( 49))then
         z( 11)=-1
      else
         z( 11)=0
      endif
      eqtyp( 31)=0
      if(x( 61)>prm( 44))then
         z( 12)=1
         eqtyp( 32)=0
      elseif(x( 61)<prm( 46))then
         z( 12)=-1
         eqtyp( 32)=0
      else
         z( 12)=0
         eqtyp( 32)= 61
      endif
      tc( 32)=prm( 49)

!& algeq								! High voltage ride-through and HV protection flag
      eqtyp( 33)=0

!& pwlin4
      eqtyp( 34)=0
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
         tc( 35)=1
      endif
      if (x( 67)>5)then
         z( 14)=1
         eqtyp( 35)=0
      elseif (x( 67)<0.) then
         z( 14)=-1
         eqtyp( 35)=0
      else
         z( 14)=0
         if (1>= 0.005)then
            eqtyp( 35)= 67
         else
            eqtyp( 35)=0
         endif
      endif

!& algeq
      eqtyp( 36)=0

!& algeq
      eqtyp( 37)=0

!& algeq
      eqtyp( 38)=0

!& algeq
      eqtyp( 39)=0

!& swsign
      eqtyp( 40)=0
      if(x( 72)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& algeq
      eqtyp( 41)=0

!& tf1p2lim
      if(prm( 49)< 0.001)then
         prm( 49)=0.d0
         prm( 46)=-huge(0.d0)
         prm( 44)= huge(0.d0)
         prm( 45)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 94)-x( 68)>prm( 54)*prm( 49))then
         z( 16)=1
      elseif(1*x( 94)-x( 68)<prm( 45)*prm( 49))then
         z( 16)=-1
      else
         z( 16)=0
      endif
      eqtyp( 42)=0
      if(x( 68)>prm( 44))then
         z( 17)=1
         eqtyp( 43)=0
      elseif(x( 68)<prm( 46))then
         z( 17)=-1
         eqtyp( 43)=0
      else
         z( 17)=0
         eqtyp( 43)= 68
      endif
      tc( 43)=prm( 49)

!& algeq 						! PLL control loop
      eqtyp( 44)=0

!& algeq
      eqtyp( 45)=0

!& algeq
      eqtyp( 46)=0

!& swsign
      eqtyp( 47)=0
      if(x( 34)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& algeq
      eqtyp( 48)=0

!& algeq
      eqtyp( 49)=0

!& algeq
      eqtyp( 50)=0

!& swsign
      eqtyp( 51)=0
      if(x( 57)>=0.)then
         z( 19)=1
      else
         z( 19)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 52)=0
      else
         eqtyp( 52)=  6
         tc( 52)=1.
      endif

!& pictl
      eqtyp( 53)= 99
      x( 99)=x( 58)
      eqtyp( 54)=0

!& algeq
      eqtyp( 55)=0

!& algeq
      eqtyp( 56)=0

!& tf1p
      eqtyp( 57)= 38
      tc( 57)=prm(  5)

!& tf1p
      eqtyp( 58)= 39
      tc( 58)=prm(  5)

!& algeq
      eqtyp( 59)=0

!& algeq
      eqtyp( 60)=0

!& tf1p
      eqtyp( 61)= 42
      tc( 61)=0.1

!& algeq
      eqtyp( 62)=0

!& algeq
      eqtyp( 63)=0

!& algeq
      eqtyp( 64)=0

!& swsign
      eqtyp( 65)=0
      if(x( 48)>=0.)then
         z( 20)=1
      else
         z( 20)=2
      endif

!& algeq
      eqtyp( 66)=0

!& algeq
      eqtyp( 67)=0

!& algeq
      eqtyp( 68)=0

!& swsign
      eqtyp( 69)=0
      if(x( 51)>=0.)then
         z( 21)=1
      else
         z( 21)=2
      endif

!& hyst
      eqtyp( 70)=0
      if(x( 43)>1.1)then
         z( 22)=1
      elseif(x( 43)<0.9)then
         z( 22)=-1
      else
         if(1.>= 0.)then
            z( 22)=1
         else
            z( 22)=-1
         endif
      endif

!& hyst
      eqtyp( 71)=0
      if(x( 45)>1.1)then
         z( 23)=1
      elseif(x( 45)<0.9)then
         z( 23)=-1
      else
         if(1.>= 0.)then
            z( 23)=1
         else
            z( 23)=-1
         endif
      endif

!& algeq						! Low frequency protection flag and reconnection
      eqtyp( 72)=0

!& inlim
      if (1>= 0.005)then
         tc( 73)=1
      endif
      if (x( 74)>5)then
         z( 24)=1
         eqtyp( 73)=0
      elseif (x( 74)<0.) then
         z( 24)=-1
         eqtyp( 73)=0
      else
         z( 24)=0
         if (1>= 0.005)then
            eqtyp( 73)= 74
         else
            eqtyp( 73)=0
         endif
      endif

!& algeq
      eqtyp( 74)=0

!& algeq
      eqtyp( 75)=0

!& algeq
      eqtyp( 76)=0

!& swsign
      eqtyp( 77)=0
      if(x( 79)>=0.)then
         z( 25)=1
      else
         z( 25)=2
      endif

!& tf1p2lim
      if(prm( 49)< 0.001)then
         prm( 49)=0.d0
         prm( 46)=-huge(0.d0)
         prm( 44)= huge(0.d0)
         prm( 45)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 76)-x( 75)>prm( 54)*prm( 49))then
         z( 26)=1
      elseif(1*x( 76)-x( 75)<prm( 45)*prm( 49))then
         z( 26)=-1
      else
         z( 26)=0
      endif
      eqtyp( 78)=0
      if(x( 75)>prm( 44))then
         z( 27)=1
         eqtyp( 79)=0
      elseif(x( 75)<prm( 46))then
         z( 27)=-1
         eqtyp( 79)=0
      else
         z( 27)=0
         eqtyp( 79)= 75
      endif
      tc( 79)=prm( 49)

!& algeq								! High frequency protection flag and reconnection
      eqtyp( 80)=0

!& inlim
      if (1>= 0.005)then
         tc( 81)=1
      endif
      if (x( 81)>5)then
         z( 28)=1
         eqtyp( 81)=0
      elseif (x( 81)<0.) then
         z( 28)=-1
         eqtyp( 81)=0
      else
         z( 28)=0
         if (1>= 0.005)then
            eqtyp( 81)= 81
         else
            eqtyp( 81)=0
         endif
      endif

!& algeq
      eqtyp( 82)=0

!& algeq
      eqtyp( 83)=0

!& algeq
      eqtyp( 84)=0

!& swsign
      eqtyp( 85)=0
      if(x( 86)>=0.)then
         z( 29)=1
      else
         z( 29)=2
      endif

!& tf1p2lim
      if(prm( 49)< 0.001)then
         prm( 49)=0.d0
         prm( 46)=-huge(0.d0)
         prm( 44)= huge(0.d0)
         prm( 45)=-huge(0.d0)
         prm( 54)= huge(0.d0)
      endif
      if(1*x( 83)-x( 82)>prm( 54)*prm( 49))then
         z( 30)=1
      elseif(1*x( 83)-x( 82)<prm( 45)*prm( 49))then
         z( 30)=-1
      else
         z( 30)=0
      endif
      eqtyp( 86)=0
      if(x( 82)>prm( 44))then
         z( 31)=1
         eqtyp( 87)=0
      elseif(x( 82)<prm( 46))then
         z( 31)=-1
         eqtyp( 87)=0
      else
         z( 31)=0
         eqtyp( 87)= 82
      endif
      tc( 87)=prm( 49)

!& algeq				! Frequency droop control
      eqtyp( 88)=0

!& db
      eqtyp( 89)=0
      if(x( 87)>prm( 32))then
         z( 32)=1
      elseif(x( 87)<prm( 31))then
         z( 32)=-1
      else
         z( 32)=0
      endif

!& algeq
      eqtyp( 90)=0

!& algeq
      eqtyp( 91)=0

!& lim
      eqtyp( 92)=0
      if(x( 89)>0.00001)then
         z( 33)=1
      elseif(x( 89)<(-99999.))then
         z( 33)=-1
      else
         z( 33)=0
      endif

!& lim
      eqtyp( 93)=0
      if(x( 90)>99999.)then
         z( 34)=1
      elseif(x( 90)<0.0001)then
         z( 34)=-1
      else
         z( 34)=0
      endif

!& algeq
      eqtyp( 94)=0

!& algeq
      eqtyp( 95)=0

!& algeq
      eqtyp( 96)=0

!& algeq
      eqtyp( 97)=0

!& algeq
      eqtyp( 98)=0

!& algeq
      eqtyp( 99)=0

!& algeq
      eqtyp(100)=0

!& algeq
      eqtyp(101)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=vx + prm( 18)*x(  1) - prm( 19)*x(  2) - x(  3)

!& algeq
      f(  2)=vy + prm( 18)*x(  2) + prm( 19)*x(  1) - x(  4)

!& algeq
      f(  3)=x(  5) - dsqrt(x(  3)**2 + x(  4)**2)

!& tf1p
      f(  4)=(-x(  7)+1.*x(  5))

!& max1v1c
      select case (z(  1))
         case(1)
            f(  5)=0.01-x(  8)
         case(2)
            f(  5)=x(  7)-x(  8)
      end select

!& algeq
      f(  6)=x( 47)/x(  8) - x( 17)

!& algeq
      f(  7)=x( 16) + 0.001

!& limvb
      select case (z(  2))
         case(0)
            f(  8)=x( 11)-x( 17)
         case(-1)
            f(  8)=x( 11)-x( 16)
         case(1)
            f(  8)=x( 11)-x( 15)
      end select

!& algeq
      f(  9)=x( 29)*x( 61)*x( 68)*x( 75)*x( 82) - x(  9)

!& tf1p2lim
      select case (z(  3))
         case(0)
            f( 10)=x( 95)-1*x( 11)+x( 29)
         case(1)
            f( 10)=x( 95)-prm( 52)*prm(  4)
         case(-1)
            f( 10)=x( 95)-prm( 45)*prm(  4)
      end select
      select case (z(  4))
         case(0)
            f( 11)=x( 95)
         case(1)
            f( 11)=x( 29)-prm( 44)
         case(-1)
            f( 11)=x( 29)-prm( 45)
      end select

!& algeq 				  ! Active - reactive power priority
      f( 12)=x( 13) -x( 35)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) - (1-x( 35))*(prm( 29)*prm(  1)*0.707 + (1-prm( 29))*prm(  1))

!& algeq
      f( 13)=x( 14) + x( 35)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) + (1-x( 35))*prm(  1)

!& algeq
      f( 14)=-x( 24) + prm( 40) - x( 28)

!& limvb
      select case (z(  5))
         case(0)
            f( 15)=x( 12)-x( 28)
         case(-1)
            f( 15)=x( 12)-x( 14)
         case(1)
            f( 15)=x( 12)-x( 13)
      end select

!& algeq						!  Over/Under voltage/frequency flags
      f( 16)=x( 30)*x( 61)*x( 68)*x( 75)*x( 82) - x( 10)

!& tf1p
      f( 17)=(-x( 30)+1.*x( 12))

!& algeq 				  ! Active - reactive power priority
      f( 18)=x( 15) - x( 35)*prm(  2) -  (1-x( 35))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2))

!& db 						!Reactive current injection
      select case (z(  6))
         case(0)
            f( 19)=x( 24)
         case(-1)
            f( 19)=x( 24)-(-prm( 23)*prm(  1)*(prm( 20) + prm( 29)))-(prm( 21)*prm(  1)*(prm( 20) + prm( 29) ))*(x(  7)-prm( 25))
         case(1)
            f( 19)=x( 24)-prm( 24)*prm(  1)-prm( 22)*prm(  1)*prm( 27)*(x(  7)-prm( 26))
      end select

!& algeq   						!  Low voltage ride-through and LV protection flag
      f( 20)=x(  7) + x( 31)

!& timer5
      select case (z(  7))
         case (-1)
            f( 21)=x( 33)
            f( 22)=x( 96)
         case (0)
            f( 21)=x( 33)
            f( 22)= 1.
         case (1)
            f( 21)=x( 33)-1.
            f( 22)= 0.
      end select

!& algeq 		
      f( 23)=x( 26) -1 + x( 33)

!& hyst
      if(z(  8) == 1)then
         f( 24)=x( 25)-1.-(1.-1.)*(x( 26)-1.1)/(1.1-0.9)
      else
         f( 24)=x( 25)-0.-(0.-0.)*(x( 26)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 25)=x( 59) - 1 + x( 25)

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               f( 26)=x( 59)
            case(1)
               f( 26)=x( 60)-5
            case(-1)
               f( 26)=x( 60)-0.
         end select
      else
         select case (z(  9))
            case(0)
               f( 26)=x( 59)-x( 60)
            case(1)
               f( 26)=x( 60)-5
            case(-1)
               f( 26)=x( 60)-0.
         end select
      endif

!& algeq
      f( 27)=x( 63) - 1

!& algeq
      f( 28)=x( 64) - 1 + x( 59)

!& algeq
      f( 29)=x( 65) + prm( 17) - x( 60)

!& swsign
      select case (z( 10))
         case(1)
            f( 30)=x( 62)-x( 63)
         case(2)
            f( 30)=x( 62)-x( 64)
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            f( 31)=x( 97)-1*x( 62)+x( 61)
         case(1)
            f( 31)=x( 97)-prm( 53)*prm( 49)
         case(-1)
            f( 31)=x( 97)-prm( 45)*prm( 49)
      end select
      select case (z( 12))
         case(0)
            f( 32)=x( 97)
         case(1)
            f( 32)=x( 61)-prm( 44)
         case(-1)
            f( 32)=x( 61)-prm( 46)
      end select

!& algeq								! High voltage ride-through and HV protection flag
      f( 33)=x( 32) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 13))
         case (  1)
            f( 34)=0.+ ( (0.-0.)*(x( 32)-(-999))/(0.-(-999)) ) -x( 27)
         case (  2)
            f( 34)=0.+ ( (1.-0.)*(x( 32)-0.)/(0.-0.) ) -x( 27)
         case (  3)
            f( 34)=1.+ ( (1.-1.)*(x( 32)-0.)/(999-0.) ) -x( 27)
      end select

!& inlim
      if (1>= 0.005)then
         select case (z( 14))
            case(0)
               f( 35)=x( 27)
            case(1)
               f( 35)=x( 67)-5
            case(-1)
               f( 35)=x( 67)-0.
         end select
      else
         select case (z( 14))
            case(0)
               f( 35)=x( 27)-x( 67)
            case(1)
               f( 35)=x( 67)-5
            case(-1)
               f( 35)=x( 67)-0.
         end select
      endif

!& algeq
      f( 36)=x( 66) - 1 + x( 27)

!& algeq
      f( 37)=x( 70) - 1

!& algeq
      f( 38)=x( 71) - 1 + x( 27)

!& algeq
      f( 39)=x( 72) + prm( 17) - x( 67)

!& swsign
      select case (z( 15))
         case(1)
            f( 40)=x( 69)-x( 70)
         case(2)
            f( 40)=x( 69)-x( 71)
      end select

!& algeq
      f( 41)=x( 94) - x( 69)*x( 66)

!& tf1p2lim
      select case (z( 16))
         case(0)
            f( 42)=x( 98)-1*x( 94)+x( 68)
         case(1)
            f( 42)=x( 98)-prm( 54)*prm( 49)
         case(-1)
            f( 42)=x( 98)-prm( 45)*prm( 49)
      end select
      select case (z( 17))
         case(0)
            f( 43)=x( 98)
         case(1)
            f( 43)=x( 68)-prm( 44)
         case(-1)
            f( 43)=x( 68)-prm( 46)
      end select

!& algeq 						! PLL control loop
      f( 44)=x( 34) - x(  7) + prm( 25)

!& algeq
      f( 45)=x( 36) - 1

!& algeq
      f( 46)=x( 37)

!& swsign
      select case (z( 18))
         case(1)
            f( 47)=x( 35)-x( 36)
         case(2)
            f( 47)=x( 35)-x( 37)
      end select

!& algeq
      f( 48)=x( 54) - 1

!& algeq
      f( 49)=x( 55)

!& algeq
      f( 50)=x( 57) - x(  7) + prm( 11)

!& swsign
      select case (z( 19))
         case(1)
            f( 51)=x( 56)-x( 54)
         case(2)
            f( 51)=x( 56)-x( 55)
      end select

!& int
      if (1.< 0.005)then
         f( 52)=x( 19)-x(  6)
      else
         f( 52)=x( 19)
      endif

!& pictl
      f( 53)=0.1/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                     *x( 20)
      f( 54)=0.5/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                        *x( 20)+x( 99)-x( 58)

!& algeq
      f( 55)=x( 18) - x( 58) + omega*2*pi*50

!& algeq
      f( 56)=x( 19) - x( 18)*x( 56)

!& tf1p
      f( 57)=(-x( 38)+1.*x(  3))

!& tf1p
      f( 58)=(-x( 39)+1.*x(  4))

!& algeq
      f( 59)=x( 40) - x( 58)/(2*pi*50)

!& algeq
      f( 60)=x( 41) - 50*x( 40)

!& tf1p
      f( 61)=(-x( 42)+1*x( 41))

!& algeq
      f( 62)=x( 49) - 1

!& algeq
      f( 63)=x( 50)

!& algeq
      f( 64)=x( 48) - x( 42) + prm( 15)

!& swsign
      select case (z( 20))
         case(1)
            f( 65)=x( 43)-x( 49)
         case(2)
            f( 65)=x( 43)-x( 50)
      end select

!& algeq
      f( 66)=x( 52) - 1

!& algeq
      f( 67)=x( 53)

!& algeq
      f( 68)=x( 51) - prm( 16) + x( 42)

!& swsign
      select case (z( 21))
         case(1)
            f( 69)=x( 45)-x( 52)
         case(2)
            f( 69)=x( 45)-x( 53)
      end select

!& hyst
      if(z( 22) == 1)then
         f( 70)=x( 44)-1.-(1.-1.)*(x( 43)-1.1)/(1.1-0.9)
      else
         f( 70)=x( 44)-0.-(0.-0.)*(x( 43)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 23) == 1)then
         f( 71)=x( 46)-1.-(1.-1.)*(x( 45)-1.1)/(1.1-0.9)
      else
         f( 71)=x( 46)-0.-(0.-0.)*(x( 45)-0.9)/(1.1-0.9)
      endif

!& algeq						! Low frequency protection flag and reconnection
      f( 72)=x( 73) - 1 + x( 44)

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               f( 73)=x( 73)
            case(1)
               f( 73)=x( 74)-5
            case(-1)
               f( 73)=x( 74)-0.
         end select
      else
         select case (z( 24))
            case(0)
               f( 73)=x( 73)-x( 74)
            case(1)
               f( 73)=x( 74)-5
            case(-1)
               f( 73)=x( 74)-0.
         end select
      endif

!& algeq
      f( 74)=x( 77) - 1

!& algeq
      f( 75)=x( 78) - 1 + x( 73)

!& algeq
      f( 76)=x( 79) + prm( 17) - x( 74)

!& swsign
      select case (z( 25))
         case(1)
            f( 77)=x( 76)-x( 77)
         case(2)
            f( 77)=x( 76)-x( 78)
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            f( 78)=x(100)-1*x( 76)+x( 75)
         case(1)
            f( 78)=x(100)-prm( 54)*prm( 49)
         case(-1)
            f( 78)=x(100)-prm( 45)*prm( 49)
      end select
      select case (z( 27))
         case(0)
            f( 79)=x(100)
         case(1)
            f( 79)=x( 75)-prm( 44)
         case(-1)
            f( 79)=x( 75)-prm( 46)
      end select

!& algeq								! High frequency protection flag and reconnection
      f( 80)=x( 80) - 1 + x( 46)

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               f( 81)=x( 80)
            case(1)
               f( 81)=x( 81)-5
            case(-1)
               f( 81)=x( 81)-0.
         end select
      else
         select case (z( 28))
            case(0)
               f( 81)=x( 80)-x( 81)
            case(1)
               f( 81)=x( 81)-5
            case(-1)
               f( 81)=x( 81)-0.
         end select
      endif

!& algeq
      f( 82)=x( 84) - 1

!& algeq
      f( 83)=x( 85) - 1 + x( 80)

!& algeq
      f( 84)=x( 86) + prm( 17) - x( 81)

!& swsign
      select case (z( 29))
         case(1)
            f( 85)=x( 83)-x( 84)
         case(2)
            f( 85)=x( 83)-x( 85)
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            f( 86)=x(101)-1*x( 83)+x( 82)
         case(1)
            f( 86)=x(101)-prm( 54)*prm( 49)
         case(-1)
            f( 86)=x(101)-prm( 45)*prm( 49)
      end select
      select case (z( 31))
         case(0)
            f( 87)=x(101)
         case(1)
            f( 87)=x( 82)-prm( 44)
         case(-1)
            f( 87)=x( 82)-prm( 46)
      end select

!& algeq				! Frequency droop control
      f( 88)=x( 87) + (x( 42)/50) - prm( 55)

!& db
      select case (z( 32))
         case(0)
            f( 89)=x( 88)
         case(-1)
            f( 89)=x( 88)-0.-1.*(x( 87)-prm( 31))
         case(1)
            f( 89)=x( 88)-0.-1.*(x( 87)-prm( 32))
      end select

!& algeq
      f( 90)=x( 89) - x( 88)*prm( 34)

!& algeq
      f( 91)=x( 90) - x( 88)*prm( 33)

!& lim
      select case (z( 33))
         case(0)
            f( 92)=x( 91)-x( 89)
         case(-1)
            f( 92)=x( 91)-(-99999.)
         case(1)
            f( 92)=x( 91)-0.00001
      end select

!& lim
      select case (z( 34))
         case(0)
            f( 93)=x( 92)-x( 90)
         case(-1)
            f( 93)=x( 92)-0.0001
         case(1)
            f( 93)=x( 92)-99999.
      end select

!& algeq
      f( 94)=x( 93)-x( 92)-x( 91)

!& algeq
      f( 95)=x( 47)+prm( 38)-x( 93)

!& algeq
      f( 96)=x( 21) - x( 38)*cos(x(  6)) - x( 39)*sin(x(  6))

!& algeq
      f( 97)=x( 20) + x( 38)*sin(x(  6)) - x( 39)*cos(x(  6))

!& algeq
      f( 98)=x( 22) - x( 21)*x(  9)

!& algeq
      f( 99)=x( 23) - x( 21)*x( 10)

!& algeq
      f(100)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f(101)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

!........................................................................................
   case (update_disc)

!& algeq

!& algeq

!& algeq

!& tf1p

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

!& algeq

!& algeq

!& limvb
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

!& algeq

!& tf1p2lim
      select case (z(  3))
         case(0)
            if(x( 95)>prm( 52)*prm(  4))then
               z(  3)=1
            elseif(x( 95)<prm( 45)*prm(  4))then
               z(  3)=-1
            endif
         case(1)
            if(1*x( 11)-x( 29)<prm( 52)*prm(  4))then
               z(  3)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 29)>prm( 45)*prm(  4))then
               z(  3)= 0
            endif
      end select
      select case (z(  4))
         case(0)
            if(x( 29)>prm( 44))then
               z(  4)=1
               eqtyp( 11)=0
            elseif(x( 29)<prm( 45))then
               z(  4)=-1
               eqtyp( 11)=0
            endif
         case(1)
            if (x( 95)<0.)then
               z(  4)= 0
               eqtyp( 11)= 29
            endif
         case(-1)
            if(x( 95)>0.)then
               z(  4)= 0
               eqtyp( 11)= 29
            endif
      end select

!& algeq 				  ! Active - reactive power priority

!& algeq

!& algeq

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

!& algeq						!  Over/Under voltage/frequency flags

!& tf1p

!& algeq 				  ! Active - reactive power priority

!& db 						!Reactive current injection
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
         if(x( 31) >= (-prm( 12)))then
            z(  7)=0
            eqtyp( 22)= 96
         endif
      else
         if(x( 31) < (-prm( 12)))then
            z(  7)=-1
            eqtyp( 22)=0
         endif
      endif
      if(z(  7) == 0)then
         if(x( 31) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 96) > 0.)then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))then
            if(x( 96) > prm(  6)+(0.-prm(  6))*(x( 31)-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 96) > prm(  6)+(prm(  6)-prm(  6))*(x( 31)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 13) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))then
            if(x( 96) > prm(  8)+(prm(  6)-prm(  8))*(x( 31)-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30))))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))))then
               z(  7)=1
            endif
         elseif(x( 31) > (-prm( 12)))then
            if(x( 96) > prm(  7)+(prm(  8)-prm(  7))*(x( 31)-(-prm( 12)))/((-(prm( 28)*prm( 14) + (1-prm( 28))*prm( 30)))-(-prm( 12))))then
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
               if(x( 60)<0.)then
                  z(  9)=-1
                  eqtyp( 26)=0
               elseif(x( 60)>5)then
                  z(  9)= 1
                  eqtyp( 26)=0
               endif
            case(1)
               if(x( 59)<0.)then
                  z(  9)=0
                  eqtyp( 26)= 60
               endif
            case(-1)
               if(x( 59)>0.)then
                  z(  9)=0
                  eqtyp( 26)= 60
               endif
         end select
      else
         select case (z(  9))
            case(0)
               if(x( 60)<0.)then
                  z(  9)=-1
               elseif(x( 60)>5)then
                  z(  9)= 1
               endif
            case(1)
               if(x( 59)<5)then
                  z(  9)=0
               endif
            case(-1)
               if(x( 59)>0.)then
                  z(  9)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 10))
         case(1)
            if(x( 65)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 65)>=0.)then
               z( 10)=1
            endif
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            if(x( 97)>prm( 53)*prm( 49))then
               z( 11)=1
            elseif(x( 97)<prm( 45)*prm( 49))then
               z( 11)=-1
            endif
         case(1)
            if(1*x( 62)-x( 61)<prm( 53)*prm( 49))then
               z( 11)= 0
            endif
         case(-1)
            if(1*x( 62)-x( 61)>prm( 45)*prm( 49))then
               z( 11)= 0
            endif
      end select
      select case (z( 12))
         case(0)
            if(x( 61)>prm( 44))then
               z( 12)=1
               eqtyp( 32)=0
            elseif(x( 61)<prm( 46))then
               z( 12)=-1
               eqtyp( 32)=0
            endif
         case(1)
            if (x( 97)<0.)then
               z( 12)= 0
               eqtyp( 32)= 61
            endif
         case(-1)
            if(x( 97)>0.)then
               z( 12)= 0
               eqtyp( 32)= 61
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
               if(x( 67)<0.)then
                  z( 14)=-1
                  eqtyp( 35)=0
               elseif(x( 67)>5)then
                  z( 14)= 1
                  eqtyp( 35)=0
               endif
            case(1)
               if(x( 27)<0.)then
                  z( 14)=0
                  eqtyp( 35)= 67
               endif
            case(-1)
               if(x( 27)>0.)then
                  z( 14)=0
                  eqtyp( 35)= 67
               endif
         end select
      else
         select case (z( 14))
            case(0)
               if(x( 67)<0.)then
                  z( 14)=-1
               elseif(x( 67)>5)then
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

!& algeq

!& swsign
      select case (z( 15))
         case(1)
            if(x( 72)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 72)>=0.)then
               z( 15)=1
            endif
      end select

!& algeq

!& tf1p2lim
      select case (z( 16))
         case(0)
            if(x( 98)>prm( 54)*prm( 49))then
               z( 16)=1
            elseif(x( 98)<prm( 45)*prm( 49))then
               z( 16)=-1
            endif
         case(1)
            if(1*x( 94)-x( 68)<prm( 54)*prm( 49))then
               z( 16)= 0
            endif
         case(-1)
            if(1*x( 94)-x( 68)>prm( 45)*prm( 49))then
               z( 16)= 0
            endif
      end select
      select case (z( 17))
         case(0)
            if(x( 68)>prm( 44))then
               z( 17)=1
               eqtyp( 43)=0
            elseif(x( 68)<prm( 46))then
               z( 17)=-1
               eqtyp( 43)=0
            endif
         case(1)
            if (x( 98)<0.)then
               z( 17)= 0
               eqtyp( 43)= 68
            endif
         case(-1)
            if(x( 98)>0.)then
               z( 17)= 0
               eqtyp( 43)= 68
            endif
      end select

!& algeq 						! PLL control loop

!& algeq

!& algeq

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

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 19))
         case(1)
            if(x( 57)<0.)then
               z( 19)=2
            endif
         case(2)
            if(x( 57)>=0.)then
               z( 19)=1
            endif
      end select

!& int

!& pictl

!& algeq

!& algeq

!& tf1p

!& tf1p

!& algeq

!& algeq

!& tf1p

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 20))
         case(1)
            if(x( 48)<0.)then
               z( 20)=2
            endif
         case(2)
            if(x( 48)>=0.)then
               z( 20)=1
            endif
      end select

!& algeq

!& algeq

!& algeq

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

!& hyst
      if (z( 22) == -1)then
         if(x( 43)>1.1)then
            z( 22)=1
         endif
      else
         if(x( 43)<0.9)then
            z( 22)=-1
         endif
      endif

!& hyst
      if (z( 23) == -1)then
         if(x( 45)>1.1)then
            z( 23)=1
         endif
      else
         if(x( 45)<0.9)then
            z( 23)=-1
         endif
      endif

!& algeq						! Low frequency protection flag and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 24))
            case(0)
               if(x( 74)<0.)then
                  z( 24)=-1
                  eqtyp( 73)=0
               elseif(x( 74)>5)then
                  z( 24)= 1
                  eqtyp( 73)=0
               endif
            case(1)
               if(x( 73)<0.)then
                  z( 24)=0
                  eqtyp( 73)= 74
               endif
            case(-1)
               if(x( 73)>0.)then
                  z( 24)=0
                  eqtyp( 73)= 74
               endif
         end select
      else
         select case (z( 24))
            case(0)
               if(x( 74)<0.)then
                  z( 24)=-1
               elseif(x( 74)>5)then
                  z( 24)= 1
               endif
            case(1)
               if(x( 73)<5)then
                  z( 24)=0
               endif
            case(-1)
               if(x( 73)>0.)then
                  z( 24)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 25))
         case(1)
            if(x( 79)<0.)then
               z( 25)=2
            endif
         case(2)
            if(x( 79)>=0.)then
               z( 25)=1
            endif
      end select

!& tf1p2lim
      select case (z( 26))
         case(0)
            if(x(100)>prm( 54)*prm( 49))then
               z( 26)=1
            elseif(x(100)<prm( 45)*prm( 49))then
               z( 26)=-1
            endif
         case(1)
            if(1*x( 76)-x( 75)<prm( 54)*prm( 49))then
               z( 26)= 0
            endif
         case(-1)
            if(1*x( 76)-x( 75)>prm( 45)*prm( 49))then
               z( 26)= 0
            endif
      end select
      select case (z( 27))
         case(0)
            if(x( 75)>prm( 44))then
               z( 27)=1
               eqtyp( 79)=0
            elseif(x( 75)<prm( 46))then
               z( 27)=-1
               eqtyp( 79)=0
            endif
         case(1)
            if (x(100)<0.)then
               z( 27)= 0
               eqtyp( 79)= 75
            endif
         case(-1)
            if(x(100)>0.)then
               z( 27)= 0
               eqtyp( 79)= 75
            endif
      end select

!& algeq								! High frequency protection flag and reconnection

!& inlim
      if (1>= 0.005)then
         select case (z( 28))
            case(0)
               if(x( 81)<0.)then
                  z( 28)=-1
                  eqtyp( 81)=0
               elseif(x( 81)>5)then
                  z( 28)= 1
                  eqtyp( 81)=0
               endif
            case(1)
               if(x( 80)<0.)then
                  z( 28)=0
                  eqtyp( 81)= 81
               endif
            case(-1)
               if(x( 80)>0.)then
                  z( 28)=0
                  eqtyp( 81)= 81
               endif
         end select
      else
         select case (z( 28))
            case(0)
               if(x( 81)<0.)then
                  z( 28)=-1
               elseif(x( 81)>5)then
                  z( 28)= 1
               endif
            case(1)
               if(x( 80)<5)then
                  z( 28)=0
               endif
            case(-1)
               if(x( 80)>0.)then
                  z( 28)=0
               endif
         end select
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 29))
         case(1)
            if(x( 86)<0.)then
               z( 29)=2
            endif
         case(2)
            if(x( 86)>=0.)then
               z( 29)=1
            endif
      end select

!& tf1p2lim
      select case (z( 30))
         case(0)
            if(x(101)>prm( 54)*prm( 49))then
               z( 30)=1
            elseif(x(101)<prm( 45)*prm( 49))then
               z( 30)=-1
            endif
         case(1)
            if(1*x( 83)-x( 82)<prm( 54)*prm( 49))then
               z( 30)= 0
            endif
         case(-1)
            if(1*x( 83)-x( 82)>prm( 45)*prm( 49))then
               z( 30)= 0
            endif
      end select
      select case (z( 31))
         case(0)
            if(x( 82)>prm( 44))then
               z( 31)=1
               eqtyp( 87)=0
            elseif(x( 82)<prm( 46))then
               z( 31)=-1
               eqtyp( 87)=0
            endif
         case(1)
            if (x(101)<0.)then
               z( 31)= 0
               eqtyp( 87)= 82
            endif
         case(-1)
            if(x(101)>0.)then
               z( 31)= 0
               eqtyp( 87)= 82
            endif
      end select

!& algeq				! Frequency droop control

!& db
      select case (z( 32))
         case(0)
            if(x( 87)>prm( 32))then
               z( 32)=1
            elseif(x( 87)<prm( 31))then
               z( 32)=-1
            endif
         case(-1)
            if(x( 87)>prm( 31))then
               z( 32)=0
            endif
         case(1)
            if(x( 87)<prm( 32))then
               z( 32)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 33))
         case(0)
            if(x( 89)>0.00001)then
               z( 33)=1
            elseif(x( 89)<(-99999.))then
               z( 33)=-1
            endif
         case(-1)
            if(x( 89)>(-99999.))then
               z( 33)=0
            endif
         case(1)
            if(x( 89)<0.00001)then
               z( 33)=0
            endif
      end select

!& lim
      select case (z( 34))
         case(0)
            if(x( 90)>99999.)then
               z( 34)=1
            elseif(x( 90)<0.0001)then
               z( 34)=-1
            endif
         case(-1)
            if(x( 90)>0.0001)then
               z( 34)=0
            endif
         case(1)
            if(x( 90)<99999.)then
               z( 34)=0
            endif
      end select

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq

!& algeq
   end select

end subroutine inj_IBG3i
