!  MODEL NAME : inj_IBG22               
!  MODEL DESCRIPTION FILE : IBG22.txt
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
!       prm( 17)=  fstart
!       prm( 18)=  b
!       prm( 19)=  fr
!       prm( 20)=  Tr      ! Time after which units are allowed to reconnect to the network
!       prm( 21)=  Re
!       prm( 22)=  Xe
!       prm( 23)=  CM1
!       prm( 24)=  kRCI
!       prm( 25)=  kRCA
!       prm( 26)=  m
!       prm( 27)=  n
!       prm( 28)=  dbmin
!       prm( 29)=  dbmax
!       prm( 30)=  HVRT
!       prm( 31)=  LVRT
!       prm( 32)=  CM2
!       prm( 33)=  Vtrip
!       prm( 34)=  fdbup
!       prm( 35)=  fdbdn
!       prm( 36)=  Rup
!       prm( 37)=  Rdn
!  Parameters :
!       prm( 38)=  vxlv  
!       prm( 39)=  vylv  
!       prm( 40)=  Vref  
!       prm( 41)=  Pext  
!       prm( 42)=  Qext  
!       prm( 43)=  Iqref  
!       prm( 44)=  Ipref  
!       prm( 45)=  kpll  
!       prm( 46)=  theta_PLL  
!       prm( 47)=  Uplim  
!       prm( 48)=  Downlim  
!       prm( 49)=  Downlimdisc  
!       prm( 50)=  UplimdeltaP  
!       prm( 51)=  DownlimdeltaP  
!       prm( 52)=  Tlim  
!       prm( 53)=  Uplimdis  
!       prm( 54)=  downlimdis  
!       prm( 55)=  ratemax  
!       prm( 56)=  rate  
!       prm( 57)=  fref  
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
!       x( 38)=  Pflaga                 Switch input a
!       x( 39)=  Pflagb                 Switch input b
!       x( 40)=  vxlm                  
!       x( 41)=  vylm                  
!       x( 42)=  omegam                
!       x( 43)=  fm                    
!       x( 44)=  fmfilt                
!       x( 45)=  Ffli                   Current multiplier (input of hysteresis)
!       x( 46)=  Ffl                   
!       x( 47)=  Ffhi                  
!       x( 48)=  Ffh                   
!       x( 49)=  deltaP                
!       x( 50)=  deltaPfin              Active power correction
!       x( 51)=  Ptot                  
!       x( 52)=  deltafl               
!       x( 53)=  flagla                
!       x( 54)=  flaglb                
!       x( 55)=  deltafh               
!       x( 56)=  flagha                
!       x( 57)=  flaghb                
!       x( 58)=  PLLmulta              
!       x( 59)=  PLLmultb              
!       x( 60)=  mult                  
!       x( 61)=  deltaVPLL             
!       x( 62)=  wpll                  
!       x( 63)=  g                     
!       x( 64)=  tr                    
!       x( 65)=  Fr                    
!       x( 66)=  Frtemp                
!       x( 67)=  fvla                  
!       x( 68)=  fvlb                  
!       x( 69)=  deltafvl              
!       x( 70)=  deltaPlim             
!       x( 71)=  deltafcomp            
!       x( 72)=  fcomp                 
!       x( 73)=  fa                    
!       x( 74)=  fb                    
!       x( 75)=  fcompf                
!       x( 76)=  w1                    
!       x( 77)=  w2                    
!       x( 78)=  w3                    
!       x( 79)=  w4                    
!       x( 80)=  w5                    
!       x( 81)=  w6                    
!       x( 82)=  w7                    

!.........................................................................................................

subroutine inj_IBG22(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 37
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
      parname( 17)='fstart'
      parname( 18)='b'
      parname( 19)='fr'
      parname( 20)='Tr'
      parname( 21)='Re'
      parname( 22)='Xe'
      parname( 23)='CM1'
      parname( 24)='kRCI'
      parname( 25)='kRCA'
      parname( 26)='m'
      parname( 27)='n'
      parname( 28)='dbmin'
      parname( 29)='dbmax'
      parname( 30)='HVRT'
      parname( 31)='LVRT'
      parname( 32)='CM2'
      parname( 33)='Vtrip'
      parname( 34)='fdbup'
      parname( 35)='fdbdn'
      parname( 36)='Rup'
      parname( 37)='Rdn'
      parname( 38)='vxlv'
      parname( 39)='vylv'
      parname( 40)='Vref'
      parname( 41)='Pext'
      parname( 42)='Qext'
      parname( 43)='Iqref'
      parname( 44)='Ipref'
      parname( 45)='kpll'
      parname( 46)='theta_PLL'
      parname( 47)='Uplim'
      parname( 48)='Downlim'
      parname( 49)='Downlimdisc'
      parname( 50)='UplimdeltaP'
      parname( 51)='DownlimdeltaP'
      parname( 52)='Tlim'
      parname( 53)='Uplimdis'
      parname( 54)='downlimdis'
      parname( 55)='ratemax'
      parname( 56)='rate'
      parname( 57)='fref'
      adix=  1
      adiy=  2
      nbxvar= 87
      nbzvar= 27

!........................................................................................
   case (define_obs)
      nbobs= 16
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

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  9)              
      obs(  2)=x( 10)              
      obs(  3)=x( 22)              
      obs(  4)=x( 23)              
      obs(  5)=x(  7)              
      obs(  6)=x(  6)              
      obs(  7)=x( 44)              
      obs(  8)=x( 65)              
      obs(  9)=x( 28)              
      obs( 10)=x( 46)              
      obs( 11)=x( 48)              
      obs( 12)=x( 66)              
      obs( 13)=x( 11)              
      obs( 14)=x(  5)              
      obs( 15)=x( 62)              
      obs( 16)=x( 20)              

!........................................................................................
   case (initialize)

!vxlv = [vx] + {Re}*[ix] - {Xe}*[iy]
      prm( 38)= vx + prm( 21)*ix - prm( 22)*iy

!vylv = [vy] + {Re}*[iy] + {Xe}*[ix]
      prm( 39)= vy + prm( 21)*iy + prm( 22)*ix

!Vref = dsqrt({vxlv}**2 + {vylv}**2)
      prm( 40)= dsqrt(prm( 38)**2 + prm( 39)**2)

!Pext = -{vxlv}*[ix]-{vylv}*[iy]
      prm( 41)= -prm( 38)*ix-prm( 39)*iy

!Qext = +{vxlv}*[iy]-{vylv}*[ix]
      prm( 42)= +prm( 38)*iy-prm( 39)*ix

!Iqref = -{Qext}/{Vref}
      prm( 43)= -prm( 42)/prm( 40)

!Ipref = -{Pext}/{Vref}
      prm( 44)= -prm( 41)/prm( 40)

!kpll = 10/({tau}*0.001)
      prm( 45)= 10/(prm( 10)*0.001)

!theta_PLL = atan({vylv}/{vxlv})
      prm( 46)= atan(prm( 39)/prm( 38))

!Uplim = 9999
      prm( 47)= 9999

!Downlim = -9999
      prm( 48)= -9999

!Downlimdisc = 0
      prm( 49)= 0

!UplimdeltaP = 9999
      prm( 50)= 9999

!DownlimdeltaP = 0
      prm( 51)= 0

!Tlim = 0.01
      prm( 52)= 0.01

!Uplimdis = 0
      prm( 53)= 0

!downlimdis = -9999
      prm( 54)= -9999

!ratemax = {Iprate}*{IN}
      prm( 55)= prm(  3)*prm(  2)

!rate = 0.1
      prm( 56)= 0.1

!fref = 1
      prm( 57)= 1

!vxl =  {vxlv}
      x(  3)= prm( 38)

!vyl =  {vylv}
      x(  4)= prm( 39)

!Vt =  {Vref}
      x(  5)= prm( 40)

!PLLPhaseAngle =  {theta_PLL}
      x(  6)= prm( 46)

!Vm =  {Vref}
      x(  7)= prm( 40)

!x2 =  {Vref}
      x(  8)= prm( 40)

!Ip =  {Ipref}
      x(  9)= prm( 44)

!Iq =  {Iqref}
      x( 10)= prm( 43)

!Ipcmd =  {Ipref}
      x( 11)= prm( 44)

!Iqcmd =  {Iqref}
      x( 12)= prm( 43)

!Iqmax =  dsqrt({Imax}**2 - {Ipref}**2 )
      x( 13)= dsqrt(prm(  1)**2 - prm( 44)**2 )

!Iqmin =  - dsqrt({Imax}**2 - {Ipref}**2 )
      x( 14)= - dsqrt(prm(  1)**2 - prm( 44)**2 )

!Ipmax =  {IN}
      x( 15)= prm(  2)

!Ipmin =  -0.001
      x( 16)= -0.001

!x4 =  {Ipref}
      x( 17)= prm( 44)

!DeltaW =  0
      x( 18)= 0

!DeltaWf =   0
      x( 19)=  0

!vq =  -{vxlv}*sin({theta_PLL}) + {vylv}*cos({theta_PLL})
      x( 20)= -prm( 38)*sin(prm( 46)) + prm( 39)*cos(prm( 46))

!vd =  {vxlv}*cos({theta_PLL}) + {vylv}*sin({theta_PLL})
      x( 21)= prm( 38)*cos(prm( 46)) + prm( 39)*sin(prm( 46))

!Pgen =  -{Pext}
      x( 22)= -prm( 41)

!Qgen =  -{Qext}
      x( 23)= -prm( 42)

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
      x( 30)= prm( 43)

!Iptemp =  {Ipref}
      x( 31)= prm( 44)

!Iqtemp =  {Iqref}
      x( 32)= prm( 43)

!x10 =  -{Vref}
      x( 33)= -prm( 40)

!x11 =  {Vref} - {Vmax}
      x( 34)= prm( 40) - prm(  9)

!z =  0.
      x( 35)= 0.

!deltaV =  {Vref} - {dbmin}
      x( 36)= prm( 40) - prm( 28)

!Pflag =  1
      x( 37)= 1

!Pflaga =  1
      x( 38)= 1

!Pflagb =  0.
      x( 39)= 0.

!vxlm =  {vxlv}
      x( 40)= prm( 38)

!vylm =  {vylv}
      x( 41)= prm( 39)

!omegam =  -0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1
      x( 42)= -0.5*(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46))) + 1

!fm =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 43)= 50*(-0.5*(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46))) + 1)

!fmfilt =  50*(-0.5*({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)
      x( 44)= 50*(-0.5*(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46))) + 1)

!Ffli =  1.
      x( 45)= 1.

!Ffl =  1.
      x( 46)= 1.

!Ffhi =  1.
      x( 47)= 1.

!Ffh =  1.
      x( 48)= 1.

!deltaP =  {b}*-{Pext}*(50*(-({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1)  - {fstart})/50
      x( 49)= prm( 18)*-prm( 41)*(50*(-(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46))) + 1)  - prm( 17))/50

!deltaPfin =  0
      x( 50)= 0

!Ptot =  -{Pext}
      x( 51)= -prm( 41)

!deltafl =  50*[omega] - {fmin}
      x( 52)= 50*omega - prm( 15)

!flagla =  1
      x( 53)= 1

!flaglb =  0
      x( 54)= 0

!deltafh =  {fmax} - 50*[omega]
      x( 55)= prm( 16) - 50*omega

!flagha =  1
      x( 56)= 1

!flaghb =  0
      x( 57)= 0

!PLLmulta =  1
      x( 58)= 1

!PLLmultb =  0
      x( 59)= 0

!mult =  1
      x( 60)= 1

!deltaVPLL =  {Vref} - {Vminpll}
      x( 61)= prm( 40) - prm( 11)

!wpll =  -({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL}))*{kpll} + 2*pi*50
      x( 62)= -(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46)))*prm( 45) + 2*pi*50

!g =  0
      x( 63)= 0

!tr =  0
      x( 64)= 0

!Fr =  1
      x( 65)= 1

!Frtemp =  1
      x( 66)= 1

!fvla =  1
      x( 67)= 1

!fvlb =  1
      x( 68)= 1

!deltafvl =  -{Tr}
      x( 69)= -prm( 20)

!deltaPlim =  0
      x( 70)= 0

!deltafcomp =  50*(-({vxlv}*sin({theta_PLL}) - {vylv}*cos({theta_PLL})) + 1) - {fr}
      x( 71)= 50*(-(prm( 38)*sin(prm( 46)) - prm( 39)*cos(prm( 46))) + 1) - prm( 19)

!fcomp =  0
      x( 72)= 0

!fa =  1
      x( 73)= 1

!fb =  0
      x( 74)= 0

!fcompf =  0
      x( 75)= 0

!w1 =  0
      x( 76)= 0

!w2 =  0
      x( 77)= 0

!w3 =  0
      x( 78)= 0

!w4 =  0
      x( 79)= 0

!w5 =  0
      x( 80)= 0

!w6 =  0
      x( 81)= 0

!w7 =  0
      x( 82)= 0

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
         prm( 48)=-huge(0.d0)
         prm( 47)= huge(0.d0)
         prm( 48)=-huge(0.d0)
         prm( 55)= huge(0.d0)
      endif
      if(1*x( 11)-x( 31)>prm( 55)*prm(  4))then
         z(  3)=1
      elseif(1*x( 11)-x( 31)<prm( 48)*prm(  4))then
         z(  3)=-1
      else
         z(  3)=0
      endif
      eqtyp( 10)=0
      if(x( 31)>prm( 47))then
         z(  4)=1
         eqtyp( 11)=0
      elseif(x( 31)<prm( 48))then
         z(  4)=-1
         eqtyp( 11)=0
      else
         z(  4)=0
         eqtyp( 11)= 31
      endif
      tc( 11)=prm(  4)

!& algeq
      eqtyp( 12)=0

!& algeq
      eqtyp( 13)=0

!& algeq
      eqtyp( 14)=0

!& limvb
      eqtyp( 15)=0
      if(x( 30)>x( 13))then
         z(  5)=1
      elseif(x( 30)<x( 14))then
         z(  5)=-1
      else
         z(  5)=0
      endif

!& algeq
      eqtyp( 16)=0

!& tf1p
      eqtyp( 17)= 32
      tc( 17)=prm(  4)

!& algeq
      eqtyp( 18)=0

!& db
      eqtyp( 19)=0
      if(x(  7)>prm( 29))then
         z(  6)=1
      elseif(x(  7)<prm( 28))then
         z(  6)=-1
      else
         z(  6)=0
      endif

!& algeq
      eqtyp( 20)=0

!& timer5
      eqtyp( 21)=0
      eqtyp( 22)=0
      z(  7)=-1
      x( 84)=0.

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
      if (x( 64)>5)then
         z(  9)=1
         eqtyp( 26)=0
      elseif (x( 64)<0.) then
         z(  9)=-1
         eqtyp( 26)=0
      else
         z(  9)=0
         if (1>= 0.005)then
            eqtyp( 26)= 64
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
      if(x( 69)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& tf1p2lim
      if(prm( 52)< 0.001)then
         prm( 52)=0.d0
         prm( 49)=-huge(0.d0)
         prm( 47)= huge(0.d0)
         prm( 48)=-huge(0.d0)
         prm( 56)= huge(0.d0)
      endif
      if(1*x( 66)-x( 65)>prm( 56)*prm( 52))then
         z( 11)=1
      elseif(1*x( 66)-x( 65)<prm( 48)*prm( 52))then
         z( 11)=-1
      else
         z( 11)=0
      endif
      eqtyp( 31)=0
      if(x( 65)>prm( 47))then
         z( 12)=1
         eqtyp( 32)=0
      elseif(x( 65)<prm( 49))then
         z( 12)=-1
         eqtyp( 32)=0
      else
         z( 12)=0
         eqtyp( 32)= 65
      endif
      tc( 32)=prm( 52)

!& algeq
      eqtyp( 33)=0

!& pwlin4
      eqtyp( 34)=0
      if(x( 34)<(-999))then
         z( 13)=1
      elseif(x( 34)>=999)then
         z( 13)=   3
      elseif((-999)<=x( 34) .and. x( 34)<0.)then
         z( 13)=  1
      elseif(0.<=x( 34) .and. x( 34)<0.)then
         z( 13)=  2
      elseif(0.<=x( 34) .and. x( 34)<999)then
         z( 13)=  3
      endif

!& algeq
      eqtyp( 35)=0

!& hyst
      eqtyp( 36)=0
      if(x( 27)>1.1)then
         z( 14)=1
      elseif(x( 27)<0.9)then
         z( 14)=-1
      else
         if(1.>= 0.)then
            z( 14)=1
         else
            z( 14)=-1
         endif
      endif

!& algeq
      eqtyp( 37)=0

!& algeq
      eqtyp( 38)=0

!& algeq
      eqtyp( 39)=0

!& swsign
      eqtyp( 40)=0
      if(x( 36)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& algeq
      eqtyp( 41)=0

!& algeq
      eqtyp( 42)=0

!& algeq
      eqtyp( 43)=0

!& swsign
      eqtyp( 44)=0
      if(x( 61)>=0.)then
         z( 16)=1
      else
         z( 16)=2
      endif

!& int
      if (1.< 0.005)then
         eqtyp( 45)=0
      else
         eqtyp( 45)=  6
         tc( 45)=1.
      endif

!& pictl
      eqtyp( 46)= 86
      x( 86)=x( 62)
      eqtyp( 47)=0

!& algeq
      eqtyp( 48)=0

!& algeq
      eqtyp( 49)=0

!& tf1p
      eqtyp( 50)= 40
      tc( 50)=prm(  5)

!& tf1p
      eqtyp( 51)= 41
      tc( 51)=prm(  5)

!& algeq
      eqtyp( 52)=0

!& algeq
      eqtyp( 53)=0

!& tf1p
      eqtyp( 54)= 44
      tc( 54)=1.

!& algeq
      eqtyp( 55)=0

!& algeq
      eqtyp( 56)=0

!& algeq
      eqtyp( 57)=0

!& swsign
      eqtyp( 58)=0
      if(x( 52)>=0.)then
         z( 17)=1
      else
         z( 17)=2
      endif

!& algeq
      eqtyp( 59)=0

!& algeq
      eqtyp( 60)=0

!& algeq
      eqtyp( 61)=0

!& swsign
      eqtyp( 62)=0
      if(x( 55)>=0.)then
         z( 18)=1
      else
         z( 18)=2
      endif

!& hyst
      eqtyp( 63)=0
      if(x( 45)>1.1)then
         z( 19)=1
      elseif(x( 45)<0.9)then
         z( 19)=-1
      else
         if(1.>= 0.)then
            z( 19)=1
         else
            z( 19)=-1
         endif
      endif

!& hyst
      eqtyp( 64)=0
      if(x( 47)>1.1)then
         z( 20)=1
      elseif(x( 47)<0.9)then
         z( 20)=-1
      else
         if(1.>= 0.)then
            z( 20)=1
         else
            z( 20)=-1
         endif
      endif

!& algeq
      eqtyp( 65)=0

!& lim
      eqtyp( 66)=0
      if(x( 49)>999)then
         z( 21)=1
      elseif(x( 49)<0)then
         z( 21)=-1
      else
         z( 21)=0
      endif

!& tf1p2lim
      if(prm( 52)< 0.001)then
         prm( 52)=0.d0
         prm( 51)=-huge(0.d0)
         prm( 50)= huge(0.d0)
         prm( 51)=-huge(0.d0)
         prm( 50)= huge(0.d0)
      endif
      if(1*x( 50)-x( 70)>prm( 50)*prm( 52))then
         z( 22)=1
      elseif(1*x( 50)-x( 70)<prm( 51)*prm( 52))then
         z( 22)=-1
      else
         z( 22)=0
      endif
      eqtyp( 67)=0
      if(x( 70)>prm( 50))then
         z( 23)=1
         eqtyp( 68)=0
      elseif(x( 70)<prm( 51))then
         z( 23)=-1
         eqtyp( 68)=0
      else
         z( 23)=0
         eqtyp( 68)= 70
      endif
      tc( 68)=prm( 52)

!& algeq
      eqtyp( 69)=0

!& algeq
      eqtyp( 70)=0

!& algeq
      eqtyp( 71)=0

!& swsign
      eqtyp( 72)=0
      if(x( 71)>=0.)then
         z( 24)=1
      else
         z( 24)=2
      endif

!& tf1p
      eqtyp( 73)= 75
      tc( 73)=1

!& algeq
      eqtyp( 74)=0

!& db
      eqtyp( 75)=0
      if(x( 76)>prm( 35))then
         z( 25)=1
      elseif(x( 76)<prm( 34))then
         z( 25)=-1
      else
         z( 25)=0
      endif

!& algeq
      eqtyp( 76)=0

!& algeq
      eqtyp( 77)=0

!& lim
      eqtyp( 78)=0
      if(x( 78)>(-0.00001))then
         z( 26)=1
      elseif(x( 78)<(-99999.))then
         z( 26)=-1
      else
         z( 26)=0
      endif

!& lim
      eqtyp( 79)=0
      if(x( 79)>99999.)then
         z( 27)=1
      elseif(x( 79)<0.00001)then
         z( 27)=-1
      else
         z( 27)=0
      endif

!& algeq
      eqtyp( 80)=0

!& algeq
      eqtyp( 81)=0

!& algeq
      eqtyp( 82)=0

!& algeq
      eqtyp( 83)=0

!& algeq
      eqtyp( 84)=0

!& algeq
      eqtyp( 85)=0

!& algeq
      eqtyp( 86)=0

!& algeq
      eqtyp( 87)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=vx + prm( 21)*x(  1) - prm( 22)*x(  2) - x(  3)

!& algeq
      f(  2)=vy + prm( 21)*x(  2) + prm( 22)*x(  1) - x(  4)

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
      f(  6)=x( 51)/x(  8) - x( 17)

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
      f(  9)=x( 31)*x( 65)*x( 28)*x( 46)*x( 48) - x(  9)

!& tf1p2lim
      select case (z(  3))
         case(0)
            f( 10)=x( 83)-1*x( 11)+x( 31)
         case(1)
            f( 10)=x( 83)-prm( 55)*prm(  4)
         case(-1)
            f( 10)=x( 83)-prm( 48)*prm(  4)
      end select
      select case (z(  4))
         case(0)
            f( 11)=x( 83)
         case(1)
            f( 11)=x( 31)-prm( 47)
         case(-1)
            f( 11)=x( 31)-prm( 48)
      end select

!& algeq
      f( 12)=x( 13) -x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) - (1-x( 37))*(prm( 32)*prm(  1)*0.707 + (1-prm( 32))*prm(  1))

!& algeq
      f( 13)=x( 14) + x( 37)*dsqrt(max(0.d0,prm(  1)**2 - x( 11)**2)) + (1-x( 37))*prm(  1)

!& algeq
      f( 14)=-x( 24) + prm( 43) - x( 30)

!& limvb
      select case (z(  5))
         case(0)
            f( 15)=x( 12)-x( 30)
         case(-1)
            f( 15)=x( 12)-x( 14)
         case(1)
            f( 15)=x( 12)-x( 13)
      end select

!& algeq
      f( 16)=x( 32)*x( 65)*x( 28)*x( 46)*x( 48) - x( 10)

!& tf1p
      f( 17)=(-x( 32)+1.*x( 12))

!& algeq
      f( 18)=x( 15) - x( 37)*prm(  2) -  (1-x( 37))*dsqrt(max(0.d0,prm(  1)**2 - x( 12)**2))

!& db
      select case (z(  6))
         case(0)
            f( 19)=x( 24)
         case(-1)
            f( 19)=x( 24)-(-prm( 26)*prm(  1)*(prm( 23) + prm( 32)))-(prm( 24)*prm(  1)*(prm( 23) + prm( 32) ))*(x(  7)-prm( 28))
         case(1)
            f( 19)=x( 24)-prm( 27)*prm(  1)-prm( 25)*prm(  1)*prm( 30)*(x(  7)-prm( 29))
      end select

!& algeq
      f( 20)=x(  7) + x( 33)

!& timer5
      select case (z(  7))
         case (-1)
            f( 21)=x( 35)
            f( 22)=x( 84)
         case (0)
            f( 21)=x( 35)
            f( 22)= 1.
         case (1)
            f( 21)=x( 35)-1.
            f( 22)= 0.
      end select

!& algeq
      f( 23)=x( 26) -1 + x( 35)

!& hyst
      if(z(  8) == 1)then
         f( 24)=x( 25)-1.-(1.-1.)*(x( 26)-1.1)/(1.1-0.9)
      else
         f( 24)=x( 25)-0.-(0.-0.)*(x( 26)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 25)=x( 63) - 1 + x( 25)

!& inlim
      if (1>= 0.005)then
         select case (z(  9))
            case(0)
               f( 26)=x( 63)
            case(1)
               f( 26)=x( 64)-5
            case(-1)
               f( 26)=x( 64)-0.
         end select
      else
         select case (z(  9))
            case(0)
               f( 26)=x( 63)-x( 64)
            case(1)
               f( 26)=x( 64)-5
            case(-1)
               f( 26)=x( 64)-0.
         end select
      endif

!& algeq
      f( 27)=x( 67) - 1

!& algeq
      f( 28)=x( 68) - 1 + x( 63)

!& algeq
      f( 29)=x( 69) + prm( 20) - x( 64)

!& swsign
      select case (z( 10))
         case(1)
            f( 30)=x( 66)-x( 67)
         case(2)
            f( 30)=x( 66)-x( 68)
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            f( 31)=x( 85)-1*x( 66)+x( 65)
         case(1)
            f( 31)=x( 85)-prm( 56)*prm( 52)
         case(-1)
            f( 31)=x( 85)-prm( 48)*prm( 52)
      end select
      select case (z( 12))
         case(0)
            f( 32)=x( 85)
         case(1)
            f( 32)=x( 65)-prm( 47)
         case(-1)
            f( 32)=x( 65)-prm( 49)
      end select

!& algeq
      f( 33)=x( 34) - x(  7) + prm(  9)

!& pwlin4
      select case (z( 13))
         case (  1)
            f( 34)=0.+ ( (0.-0.)*(x( 34)-(-999))/(0.-(-999)) ) -x( 29)
         case (  2)
            f( 34)=0.+ ( (1.-0.)*(x( 34)-0.)/(0.-0.) ) -x( 29)
         case (  3)
            f( 34)=1.+ ( (1.-1.)*(x( 34)-0.)/(999-0.) ) -x( 29)
      end select

!& algeq
      f( 35)=x( 27) -1 + x( 29)

!& hyst
      if(z( 14) == 1)then
         f( 36)=x( 28)-1.-(1.-1.)*(x( 27)-1.1)/(1.1-0.9)
      else
         f( 36)=x( 28)-0.-(0.-0.)*(x( 27)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 37)=x( 36) - x(  7) + prm( 28)

!& algeq
      f( 38)=x( 38) - 1

!& algeq
      f( 39)=x( 39)

!& swsign
      select case (z( 15))
         case(1)
            f( 40)=x( 37)-x( 38)
         case(2)
            f( 40)=x( 37)-x( 39)
      end select

!& algeq
      f( 41)=x( 58) - 1

!& algeq
      f( 42)=x( 59)

!& algeq
      f( 43)=x( 61) - x(  7) + prm( 11)

!& swsign
      select case (z( 16))
         case(1)
            f( 44)=x( 60)-x( 58)
         case(2)
            f( 44)=x( 60)-x( 59)
      end select

!& int
      if (1.< 0.005)then
         f( 45)=x( 19)-x(  6)
      else
         f( 45)=x( 19)
      endif

!& pictl
      f( 46)=25/(prm( 10)*0.001)**2                                                                                                                                                                                                                                                                                      *x( 20)
      f( 47)=10/(prm( 10)*0.001)                                                                                                                                                                                                                                                                                         *x( 20)+x( 86)-x( 62)

!& algeq
      f( 48)=x( 18) - x( 62) + omega*2*pi*50

!& algeq
      f( 49)=x( 19) - x( 18)*x( 60)

!& tf1p
      f( 50)=(-x( 40)+1.*x(  3))

!& tf1p
      f( 51)=(-x( 41)+1.*x(  4))

!& algeq
      f( 52)=x( 42) - x( 62)/(2*pi*50)

!& algeq
      f( 53)=x( 43) - 50*x( 42)

!& tf1p
      f( 54)=(-x( 44)+1.*x( 43))

!& algeq
      f( 55)=x( 53) - 1

!& algeq
      f( 56)=x( 54)

!& algeq
      f( 57)=x( 52) - x( 44) + prm( 15)

!& swsign
      select case (z( 17))
         case(1)
            f( 58)=x( 45)-x( 53)
         case(2)
            f( 58)=x( 45)-x( 54)
      end select

!& algeq
      f( 59)=x( 56) - 1

!& algeq
      f( 60)=x( 57)

!& algeq
      f( 61)=x( 55) - prm( 16) + x( 44)

!& swsign
      select case (z( 18))
         case(1)
            f( 62)=x( 47)-x( 56)
         case(2)
            f( 62)=x( 47)-x( 57)
      end select

!& hyst
      if(z( 19) == 1)then
         f( 63)=x( 46)-1.-(1.-1.)*(x( 45)-1.1)/(1.1-0.9)
      else
         f( 63)=x( 46)-0.-(0.-0.)*(x( 45)-0.9)/(1.1-0.9)
      endif

!& hyst
      if(z( 20) == 1)then
         f( 64)=x( 48)-1.-(1.-1.)*(x( 47)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 48)-0.-(0.-0.)*(x( 47)-0.9)/(1.1-0.9)
      endif

!& algeq
      f( 65)=x( 49) + prm( 18)*prm( 41)*(x( 44) - prm( 17))/50

!& lim
      select case (z( 21))
         case(0)
            f( 66)=x( 50)-x( 49)
         case(-1)
            f( 66)=x( 50)-0
         case(1)
            f( 66)=x( 50)-999
      end select

!& tf1p2lim
      select case (z( 22))
         case(0)
            f( 67)=x( 87)-1*x( 50)+x( 70)
         case(1)
            f( 67)=x( 87)-prm( 50)*prm( 52)
         case(-1)
            f( 67)=x( 87)-prm( 51)*prm( 52)
      end select
      select case (z( 23))
         case(0)
            f( 68)=x( 87)
         case(1)
            f( 68)=x( 70)-prm( 50)
         case(-1)
            f( 68)=x( 70)-prm( 51)
      end select

!& algeq
      f( 69)=x( 73) - 1

!& algeq
      f( 70)=x( 74)

!& algeq
      f( 71)=x( 71) - x( 44) + prm( 19)

!& swsign
      select case (z( 24))
         case(1)
            f( 72)=x( 72)-x( 73)
         case(2)
            f( 72)=x( 72)-x( 74)
      end select

!& tf1p
      f( 73)=(-x( 75)+1.*x( 72))

!& algeq
      f( 74)=x( 76) + (x( 44)/50) - prm( 57)

!& db
      select case (z( 25))
         case(0)
            f( 75)=x( 77)
         case(-1)
            f( 75)=x( 77)-0.-1.*(x( 76)-prm( 34))
         case(1)
            f( 75)=x( 77)-0.-1.*(x( 76)-prm( 35))
      end select

!& algeq
      f( 76)=x( 78) - x( 77)*prm( 37)

!& algeq
      f( 77)=x( 79) - x( 77)*prm( 36)

!& lim
      select case (z( 26))
         case(0)
            f( 78)=x( 80)-x( 78)
         case(-1)
            f( 78)=x( 80)-(-99999.)
         case(1)
            f( 78)=x( 80)-(-0.00001)
      end select

!& lim
      select case (z( 27))
         case(0)
            f( 79)=x( 81)-x( 79)
         case(-1)
            f( 79)=x( 81)-0.00001
         case(1)
            f( 79)=x( 81)-99999.
      end select

!& algeq
      f( 80)=x( 82)-x( 81)-x( 80)

!& algeq
      f( 81)=x( 51)+prm( 41)-x( 82)

!& algeq
      f( 82)=x( 21) - x( 40)*cos(x(  6)) - x( 41)*sin(x(  6))

!& algeq
      f( 83)=x( 20) + x( 40)*sin(x(  6)) - x( 41)*cos(x(  6))

!& algeq
      f( 84)=x( 22) - x( 21)*x(  9)

!& algeq
      f( 85)=x( 23) - x( 21)*x( 10)

!& algeq
      f( 86)=x(  1) - x(  9)*cos(x(  6)) - x( 10)*sin(x(  6))

!& algeq
      f( 87)=x(  2) - x(  9)*sin(x(  6)) + x( 10)*cos(x(  6))

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
            if(x( 83)>prm( 55)*prm(  4))then
               z(  3)=1
            elseif(x( 83)<prm( 48)*prm(  4))then
               z(  3)=-1
            endif
         case(1)
            if(1*x( 11)-x( 31)<prm( 55)*prm(  4))then
               z(  3)= 0
            endif
         case(-1)
            if(1*x( 11)-x( 31)>prm( 48)*prm(  4))then
               z(  3)= 0
            endif
      end select
      select case (z(  4))
         case(0)
            if(x( 31)>prm( 47))then
               z(  4)=1
               eqtyp( 11)=0
            elseif(x( 31)<prm( 48))then
               z(  4)=-1
               eqtyp( 11)=0
            endif
         case(1)
            if (x( 83)<0.)then
               z(  4)= 0
               eqtyp( 11)= 31
            endif
         case(-1)
            if(x( 83)>0.)then
               z(  4)= 0
               eqtyp( 11)= 31
            endif
      end select

!& algeq

!& algeq

!& algeq

!& limvb
      select case (z(  5))
         case(0)
            if(x( 30)>x( 13))then
               z(  5)=1
            elseif(x( 30)<x( 14))then
               z(  5)=-1
            endif
         case(-1)
            if(x( 30)>x( 14))then
               z(  5)=0
            endif
         case(1)
            if(x( 30)<x( 13))then
               z(  5)=0
            endif
      end select

!& algeq

!& tf1p

!& algeq

!& db
      select case (z(  6))
         case(0)
            if(x(  7)>prm( 29))then
               z(  6)=1
            elseif(x(  7)<prm( 28))then
               z(  6)=-1
            endif
         case(-1)
            if(x(  7)>prm( 28))then
               z(  6)=0
            endif
         case(1)
            if(x(  7)<prm( 29))then
               z(  6)=0
            endif
      end select

!& algeq

!& timer5
      if(z(  7) == -1)then
         if(x( 33) >= (-prm( 12)))then
            z(  7)=0
            eqtyp( 22)= 84
         endif
      else
         if(x( 33) < (-prm( 12)))then
            z(  7)=-1
            eqtyp( 22)=0
         endif
      endif
      if(z(  7) == 0)then
         if(x( 33) > (-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33))))then
            if(x( 84) > 0.)then
               z(  7)=1
            endif
         elseif(x( 33) > (-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33))))then
            if(x( 84) > prm(  6)+(0.-prm(  6))*(x( 33)-(-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33))))/((-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33)))-(-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33)))))then
               z(  7)=1
            endif
         elseif(x( 33) > (-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33))))then
            if(x( 84) > prm(  6)+(prm(  6)-prm(  6))*(x( 33)-(-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33))))/((-(prm( 31)*prm( 13) + (1-prm( 31))*prm( 33)))-(-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33)))))then
               z(  7)=1
            endif
         elseif(x( 33) > (-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33))))then
            if(x( 84) > prm(  8)+(prm(  6)-prm(  8))*(x( 33)-(-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33))))/((-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33)))-(-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33)))))then
               z(  7)=1
            endif
         elseif(x( 33) > (-prm( 12)))then
            if(x( 84) > prm(  7)+(prm(  8)-prm(  7))*(x( 33)-(-prm( 12)))/((-(prm( 31)*prm( 14) + (1-prm( 31))*prm( 33)))-(-prm( 12))))then
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
               if(x( 64)<0.)then
                  z(  9)=-1
                  eqtyp( 26)=0
               elseif(x( 64)>5)then
                  z(  9)= 1
                  eqtyp( 26)=0
               endif
            case(1)
               if(x( 63)<0.)then
                  z(  9)=0
                  eqtyp( 26)= 64
               endif
            case(-1)
               if(x( 63)>0.)then
                  z(  9)=0
                  eqtyp( 26)= 64
               endif
         end select
      else
         select case (z(  9))
            case(0)
               if(x( 64)<0.)then
                  z(  9)=-1
               elseif(x( 64)>5)then
                  z(  9)= 1
               endif
            case(1)
               if(x( 63)<5)then
                  z(  9)=0
               endif
            case(-1)
               if(x( 63)>0.)then
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
            if(x( 69)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 69)>=0.)then
               z( 10)=1
            endif
      end select

!& tf1p2lim
      select case (z( 11))
         case(0)
            if(x( 85)>prm( 56)*prm( 52))then
               z( 11)=1
            elseif(x( 85)<prm( 48)*prm( 52))then
               z( 11)=-1
            endif
         case(1)
            if(1*x( 66)-x( 65)<prm( 56)*prm( 52))then
               z( 11)= 0
            endif
         case(-1)
            if(1*x( 66)-x( 65)>prm( 48)*prm( 52))then
               z( 11)= 0
            endif
      end select
      select case (z( 12))
         case(0)
            if(x( 65)>prm( 47))then
               z( 12)=1
               eqtyp( 32)=0
            elseif(x( 65)<prm( 49))then
               z( 12)=-1
               eqtyp( 32)=0
            endif
         case(1)
            if (x( 85)<0.)then
               z( 12)= 0
               eqtyp( 32)= 65
            endif
         case(-1)
            if(x( 85)>0.)then
               z( 12)= 0
               eqtyp( 32)= 65
            endif
      end select

!& algeq

!& pwlin4
      if(x( 34)<(-999))then
         z( 13)=1
      elseif(x( 34)>=999)then
         z( 13)=  3
      elseif((-999)<=x( 34) .and. x( 34)<0.)then
         z( 13)=  1
      elseif(0.<=x( 34) .and. x( 34)<0.)then
         z( 13)=  2
      elseif(0.<=x( 34) .and. x( 34)<999)then
         z( 13)=  3
      endif

!& algeq

!& hyst
      if (z( 14) == -1)then
         if(x( 27)>1.1)then
            z( 14)=1
         endif
      else
         if(x( 27)<0.9)then
            z( 14)=-1
         endif
      endif

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 15))
         case(1)
            if(x( 36)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 36)>=0.)then
               z( 15)=1
            endif
      end select

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 16))
         case(1)
            if(x( 61)<0.)then
               z( 16)=2
            endif
         case(2)
            if(x( 61)>=0.)then
               z( 16)=1
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
      select case (z( 17))
         case(1)
            if(x( 52)<0.)then
               z( 17)=2
            endif
         case(2)
            if(x( 52)>=0.)then
               z( 17)=1
            endif
      end select

!& algeq

!& algeq

!& algeq

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

!& hyst
      if (z( 19) == -1)then
         if(x( 45)>1.1)then
            z( 19)=1
         endif
      else
         if(x( 45)<0.9)then
            z( 19)=-1
         endif
      endif

!& hyst
      if (z( 20) == -1)then
         if(x( 47)>1.1)then
            z( 20)=1
         endif
      else
         if(x( 47)<0.9)then
            z( 20)=-1
         endif
      endif

!& algeq

!& lim
      select case (z( 21))
         case(0)
            if(x( 49)>999)then
               z( 21)=1
            elseif(x( 49)<0)then
               z( 21)=-1
            endif
         case(-1)
            if(x( 49)>0)then
               z( 21)=0
            endif
         case(1)
            if(x( 49)<999)then
               z( 21)=0
            endif
      end select

!& tf1p2lim
      select case (z( 22))
         case(0)
            if(x( 87)>prm( 50)*prm( 52))then
               z( 22)=1
            elseif(x( 87)<prm( 51)*prm( 52))then
               z( 22)=-1
            endif
         case(1)
            if(1*x( 50)-x( 70)<prm( 50)*prm( 52))then
               z( 22)= 0
            endif
         case(-1)
            if(1*x( 50)-x( 70)>prm( 51)*prm( 52))then
               z( 22)= 0
            endif
      end select
      select case (z( 23))
         case(0)
            if(x( 70)>prm( 50))then
               z( 23)=1
               eqtyp( 68)=0
            elseif(x( 70)<prm( 51))then
               z( 23)=-1
               eqtyp( 68)=0
            endif
         case(1)
            if (x( 87)<0.)then
               z( 23)= 0
               eqtyp( 68)= 70
            endif
         case(-1)
            if(x( 87)>0.)then
               z( 23)= 0
               eqtyp( 68)= 70
            endif
      end select

!& algeq

!& algeq

!& algeq

!& swsign
      select case (z( 24))
         case(1)
            if(x( 71)<0.)then
               z( 24)=2
            endif
         case(2)
            if(x( 71)>=0.)then
               z( 24)=1
            endif
      end select

!& tf1p

!& algeq

!& db
      select case (z( 25))
         case(0)
            if(x( 76)>prm( 35))then
               z( 25)=1
            elseif(x( 76)<prm( 34))then
               z( 25)=-1
            endif
         case(-1)
            if(x( 76)>prm( 34))then
               z( 25)=0
            endif
         case(1)
            if(x( 76)<prm( 35))then
               z( 25)=0
            endif
      end select

!& algeq

!& algeq

!& lim
      select case (z( 26))
         case(0)
            if(x( 78)>(-0.00001))then
               z( 26)=1
            elseif(x( 78)<(-99999.))then
               z( 26)=-1
            endif
         case(-1)
            if(x( 78)>(-99999.))then
               z( 26)=0
            endif
         case(1)
            if(x( 78)<(-0.00001))then
               z( 26)=0
            endif
      end select

!& lim
      select case (z( 27))
         case(0)
            if(x( 79)>99999.)then
               z( 27)=1
            elseif(x( 79)<0.00001)then
               z( 27)=-1
            endif
         case(-1)
            if(x( 79)>0.00001)then
               z( 27)=0
            endif
         case(1)
            if(x( 79)<99999.)then
               z( 27)=0
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

end subroutine inj_IBG22
