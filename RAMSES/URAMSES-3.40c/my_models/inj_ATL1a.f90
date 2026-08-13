!  MODEL NAME : inj_ATL1a               
!  MODEL DESCRIPTION FILE : ATL1a.txt
!  Data :
!       prm(  1)=  Sb                              ! base power of the unit
!       prm(  2)=  Sbs                             ! base power of the system
!       prm(  3)=  vdc_star                        ! DC link voltage reference
!       prm(  4)=  pf                              ! setpoint for power factor at the terminal
!       prm(  5)=  tau                             ! Pll time constant
!       prm(  6)=  Vminpll                         ! PLL freezing voltage, PLL freezes below this value
!       prm(  7)=  tau_f                           ! filter constant for frequency
!       prm(  8)=  kp_v                            ! DC link voltage control parameters
!       prm(  9)=  ki_v
!       prm( 10)=  kp_c                            ! rectifier current control parameters
!       prm( 11)=  ki_c
!       prm( 12)=  kp_p                            ! power control parameters
!       prm( 13)=  ki_p
!       prm( 14)=  kp_w                            ! motor speed control parameters
!       prm( 15)=  ki_w
!       prm( 16)=  w_cc                            ! motor current control bandwidth
!       prm( 17)=  rt                              ! terminal impedance
!       prm( 18)=  lt
!       prm( 19)=  cdc                             ! DC link capacitance
!       prm( 20)=  kw                              ! speed/torque control constant
!       prm( 21)=  kT                              ! motor torque constant
!       prm( 22)=  ra                              ! motor anchor/stator resistance
!       prm( 23)=  H                               ! motor inertia
!       prm( 24)=  b                               ! motor friction coefficient
!       prm( 25)=  Tnm                             ! compressor torque at nominal speed
!       prm( 26)=  iF                              ! motor field current, equal to 0 in case of BLDC and PMSM
!       prm( 27)=  wm_min                          ! limits on rotational speed
!       prm( 28)=  wm_max
!       prm( 29)=  Vmax                            ! voltage range during which unit needs to stay connected
!       prm( 30)=  Vmin
!       prm( 31)=  Vint
!       prm( 32)=  Vr
!       prm( 33)=  tLVRT1
!       prm( 34)=  tLVRT2
!       prm( 35)=  tLVRTint
!       prm( 36)=  Vtrip
!       prm( 37)=  fmin                            ! frequency control regime
!       prm( 38)=  fmax
!       prm( 39)=  Trocof                          ! delay for ROCOF measurement
!       prm( 40)=  dfmax                           ! maximum permissable ROCOF
!       prm( 41)=  VPmin                           ! power limit below 0.9 pu of Voltage
!       prm( 42)=  VPmax                           ! power limit above 0.93 pu voltage
!       prm( 43)=  LVRT                            ! enable or disable LVRT
!       prm( 44)=  Tm                              ! measurement delay
!       prm( 45)=  fdbdn
!       prm( 46)=  fdbup
!       prm( 47)=  fpmax                           ! frequency at which maximum consumption power is required
!       prm( 48)=  fpmin                           ! frequency at which minimum power consumption is required
!       prm( 49)=  protection                      ! Flag for protection, -1 for off, 1 for on
!       prm( 50)=  support                         ! Flag for grid support, -1 for off, 1 for on
!  Parameters :
!       prm( 51)=  w0  
!       prm( 52)=  wb  
!       prm( 53)=  t2   Torque polynomial parameters, set to constant torque
!       prm( 54)=  t1  
!       prm( 55)=  t0  
!       prm( 56)=  Tlim  
!       prm( 57)=  Downlim  
!       prm( 58)=  Downlimdisc  
!       prm( 59)=  UplimdeltaP  
!       prm( 60)=  DownlimdeltaP  
!       prm( 61)=  Uplimdis  
!       prm( 62)=  downlimdis  
!       prm( 63)=  theta0  
!       prm( 64)=  P0   initial active power
!       prm( 65)=  Q0   initial reactive power
!       prm( 66)=  P0_unit  
!       prm( 67)=  Q0_unit  
!       prm( 68)=  V0   initial voltage magnitude at bus
!       prm( 69)=  iP0   current alignment
!       prm( 70)=  iQ0  
!       prm( 71)=  vd0   voltage alignment
!       prm( 72)=  vq0  
!       prm( 73)=  md0   modulation indices
!       prm( 74)=  mq0  
!       prm( 75)=  idc0   DC link current
!       prm( 76)=  iT0  
!       prm( 77)=  wm0  
!       prm( 78)=  Te0  
!       prm( 79)=  Tc0  
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  vd                    
!       x(  4)=  vq                    
!       x(  5)=  theta                 
!       x(  6)=  vdc_ref               
!       x(  7)=  V                     
!       x(  8)=  vxm                   
!       x(  9)=  vym                   
!       x( 10)=  Vm                    
!       x( 11)=  iP                    
!       x( 12)=  diP                   
!       x( 13)=  iQ                    
!       x( 14)=  diQ                   
!       x( 15)=  P                     
!       x( 16)=  dp                    
!       x( 17)=  Punit                 
!       x( 18)=  Q                     
!       x( 19)=  Qunit                 
!       x( 20)=  Pref_lim               limited P reference
!       x( 21)=  dw_pll                
!       x( 22)=  dw_pllf               
!       x( 23)=  deltaf                
!       x( 24)=  w_pll                 
!       x( 25)=  f                     
!       x( 26)=  fi                    
!       x( 27)=  vdc                   
!       x( 28)=  dvdc                  
!       x( 29)=  iP_ref                
!       x( 30)=  Plim                  
!       x( 31)=  Plimin                
!       x( 32)=  iQ_ref                
!       x( 33)=  mdr                   
!       x( 34)=  mqr                   
!       x( 35)=  md                    
!       x( 36)=  mq                    
!       x( 37)=  dvd                   
!       x( 38)=  dvq                   
!       x( 39)=  idc                   
!       x( 40)=  didc                  
!       x( 41)=  wm_ref                
!       x( 42)=  wm_ref_lim            
!       x( 43)=  wm_ref_lim_in         
!       x( 44)=  iT_ref                
!       x( 45)=  iT                    
!       x( 46)=  dwm                   
!       x( 47)=  wm                    
!       x( 48)=  Te                    
!       x( 49)=  dT                    
!       x( 50)=  F_pll                 
!       x( 51)=  dv_pll                
!       x( 52)=  deltafvh              
!       x( 53)=  z1                    
!       x( 54)=  Fvhi                  
!       x( 55)=  Fvh                   
!       x( 56)=  iPs                   
!       x( 57)=  iQs                   
!       x( 58)=  Pref                  
!       x( 59)=  x10                   
!       x( 60)=  z                     
!       x( 61)=  Fvl                   
!       x( 62)=  Fvli                  
!       x( 63)=  deltafl               
!       x( 64)=  Ffl                   
!       x( 65)=  Ffli                  
!       x( 66)=  deltafh               
!       x( 67)=  Ffh                   
!       x( 68)=  Ffhi                  
!       x( 69)=  rocof                 
!       x( 70)=  abrocof               
!       x( 71)=  deltarocof            
!       x( 72)=  Ffri                  
!       x( 73)=  Ffr                   
!       x( 74)=  Plim_min              
!       x( 75)=  w1                    
!       x( 76)=  w2                    
!       x( 77)=  dPupi                 
!       x( 78)=  dPup                  
!       x( 79)=  dPdni                 
!       x( 80)=  dPdn                  
!       x( 81)=  dP                    
!       x( 82)=  status                 status of the device, 1 for on
!       x( 83)=  p1                    
!       x( 84)=  p2                    
!       x( 85)=  p3                    
!       x( 86)=  s1                    
!       x( 87)=  s2                    
!       x( 88)=  one                   
!       x( 89)=  zero                  

!.........................................................................................................

subroutine inj_ATL1a(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata= 50
      nbaddpar= 29
      parname(  1)='Sb'
      parname(  2)='Sbs'
      parname(  3)='vdc_star'
      parname(  4)='pf'
      parname(  5)='tau'
      parname(  6)='Vminpll'
      parname(  7)='tau_f'
      parname(  8)='kp_v'
      parname(  9)='ki_v'
      parname( 10)='kp_c'
      parname( 11)='ki_c'
      parname( 12)='kp_p'
      parname( 13)='ki_p'
      parname( 14)='kp_w'
      parname( 15)='ki_w'
      parname( 16)='w_cc'
      parname( 17)='rt'
      parname( 18)='lt'
      parname( 19)='cdc'
      parname( 20)='kw'
      parname( 21)='kT'
      parname( 22)='ra'
      parname( 23)='H'
      parname( 24)='b'
      parname( 25)='Tnm'
      parname( 26)='iF'
      parname( 27)='wm_min'
      parname( 28)='wm_max'
      parname( 29)='Vmax'
      parname( 30)='Vmin'
      parname( 31)='Vint'
      parname( 32)='Vr'
      parname( 33)='tLVRT1'
      parname( 34)='tLVRT2'
      parname( 35)='tLVRTint'
      parname( 36)='Vtrip'
      parname( 37)='fmin'
      parname( 38)='fmax'
      parname( 39)='Trocof'
      parname( 40)='dfmax'
      parname( 41)='VPmin'
      parname( 42)='VPmax'
      parname( 43)='LVRT'
      parname( 44)='Tm'
      parname( 45)='fdbdn'
      parname( 46)='fdbup'
      parname( 47)='fpmax'
      parname( 48)='fpmin'
      parname( 49)='protection'
      parname( 50)='support'
      parname( 51)='w0'
      parname( 52)='wb'
      parname( 53)='t2'
      parname( 54)='t1'
      parname( 55)='t0'
      parname( 56)='Tlim'
      parname( 57)='Downlim'
      parname( 58)='Downlimdisc'
      parname( 59)='UplimdeltaP'
      parname( 60)='DownlimdeltaP'
      parname( 61)='Uplimdis'
      parname( 62)='downlimdis'
      parname( 63)='theta0'
      parname( 64)='P0'
      parname( 65)='Q0'
      parname( 66)='P0_unit'
      parname( 67)='Q0_unit'
      parname( 68)='V0'
      parname( 69)='iP0'
      parname( 70)='iQ0'
      parname( 71)='vd0'
      parname( 72)='vq0'
      parname( 73)='md0'
      parname( 74)='mq0'
      parname( 75)='idc0'
      parname( 76)='iT0'
      parname( 77)='wm0'
      parname( 78)='Te0'
      parname( 79)='Tc0'
      adix=  1
      adiy=  2
      nbxvar= 98
      nbzvar= 22

!........................................................................................
   case (define_obs)
      nbobs= 21
      obsname(  1)='iP'
      obsname(  2)='iQ'
      obsname(  3)='ix'
      obsname(  4)='iy'
      obsname(  5)='vd'
      obsname(  6)='vq'
      obsname(  7)='P'
      obsname(  8)='Punit'
      obsname(  9)='Pref_lim'
      obsname( 10)='Q'
      obsname( 11)='f'
      obsname( 12)='wm'
      obsname( 13)='wm_ref'
      obsname( 14)='dwm'
      obsname( 15)='dp'
      obsname( 16)='status'
      obsname( 17)='rocof'
      obsname( 18)='Plim'
      obsname( 19)='dPdn'
      obsname( 20)='dPup'
      obsname( 21)='iT'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x( 11)              
      obs(  2)=x( 13)              
      obs(  3)=x(  1)              
      obs(  4)=x(  2)              
      obs(  5)=x(  3)              
      obs(  6)=x(  4)              
      obs(  7)=x( 15)              
      obs(  8)=x( 17)              
      obs(  9)=x( 20)              
      obs( 10)=x( 18)              
      obs( 11)=x( 25)              
      obs( 12)=x( 47)              
      obs( 13)=x( 41)              
      obs( 14)=x( 46)              
      obs( 15)=x( 16)              
      obs( 16)=x( 82)              
      obs( 17)=x( 69)              
      obs( 18)=x( 30)              
      obs( 19)=x( 80)              
      obs( 20)=x( 78)              
      obs( 21)=x( 45)              

!........................................................................................
   case (initialize)

!w0 = 1
      prm( 51)= 1

!wb = 2*pi*fnom
      prm( 52)= 2*pi*fnom

!t2 = 0
      prm( 53)= 0

!t1 = 0
      prm( 54)= 0

!t0 = 1
      prm( 55)= 1

!Tlim = 0.01
      prm( 56)= 0.01

!Downlim = -9999
      prm( 57)= -9999

!Downlimdisc = 0
      prm( 58)= 0

!UplimdeltaP = 9999
      prm( 59)= 9999

!DownlimdeltaP = -9999
      prm( 60)= -9999

!Uplimdis = 0
      prm( 61)= 0

!downlimdis = -9999
      prm( 62)= -9999

!theta0 = atan([vy]/[vx])
      prm( 63)= atan(vy/vx)

!P0 = ([vx]*[ix]+[vy]*[iy])
      prm( 64)= (vx*ix+vy*iy)

!Q0 = [vy]*[ix]-[vx]*[iy]
      prm( 65)= vy*ix-vx*iy

!P0_unit = -{P0}*{Sbs}/{Sb}
      prm( 66)= -prm( 64)*prm(  2)/prm(  1)

!Q0_unit = -{Q0}*{Sbs}/{Sb}
      prm( 67)= -prm( 65)*prm(  2)/prm(  1)

!V0 = dsqrt([vx]**2+[vy]**2)
      prm( 68)= dsqrt(vx**2+vy**2)

!iP0 =  (-[ix]*cos({theta0})-[iy]*sin({theta0}))*{Sbs}/{Sb}
      prm( 69)=  (-ix*cos(prm( 63))-iy*sin(prm( 63)))*prm(  2)/prm(  1)

!iQ0 =  (-[ix]*sin({theta0})+[iy]*cos({theta0}))*{Sbs}/{Sb}
      prm( 70)=  (-ix*sin(prm( 63))+iy*cos(prm( 63)))*prm(  2)/prm(  1)

!vd0 = [vx]*cos({theta0})+[vy]*sin({theta0})
      prm( 71)= vx*cos(prm( 63))+vy*sin(prm( 63))

!vq0 = [vx]*sin({theta0})-[vy]*cos({theta0})
      prm( 72)= vx*sin(prm( 63))-vy*cos(prm( 63))

!md0 = 1/{vdc_star}*({vd0}+{lt}*{w0}*{iQ0}-{rt}*{iP0})
      prm( 73)= 1/prm(  3)*(prm( 71)+prm( 18)*prm( 51)*prm( 70)-prm( 17)*prm( 69))

!mq0 = 1/{vdc_star}*({vq0}-{lt}*{w0}*{iP0}-{rt}*{iQ0})
      prm( 74)= 1/prm(  3)*(prm( 72)-prm( 18)*prm( 51)*prm( 69)-prm( 17)*prm( 70))

!idc0 = {md0}*{iP0}+{mq0}*{iQ0}
      prm( 75)= prm( 73)*prm( 69)+prm( 74)*prm( 70)

!iT0 = {Tnm}*{kT}/(2*{kT}**2+2*{ra}*{b}) + dsqrt(({Tnm}*{kT}/(2*{kT}**2+2*{ra}*{b}))**2-({ra}*{b}*{iF}**2-{b}*{idc0}*{vdc_star})/({kT}**2+{ra}*{b}))
      prm( 76)= prm( 25)*prm( 21)/(2*prm( 21)**2+2*prm( 22)*prm( 24)) + dsqrt((prm( 25)*prm( 21)/(2*prm( 21)**2+2*prm( 22)*prm( 24)))**2-(prm( 22)*prm( 24)*prm( 26)**2-prm( 24)*prm( 75)*prm(  3))/(prm( 21)**2+prm( 22)*prm( 24)))

!wm0 = 1/{b}*({kT}*{iT0}-{Tnm})
      prm( 77)= 1/prm( 24)*(prm( 21)*prm( 76)-prm( 25))

!Te0 = {iT0}*{kT}
      prm( 78)= prm( 76)*prm( 21)

!Tc0 = {Tnm}
      prm( 79)= prm( 25)

!vd =  {vd0}
      x(  3)= prm( 71)

!vq =  {vq0}
      x(  4)= prm( 72)

!theta =  {theta0}
      x(  5)= prm( 63)

!vdc_ref = {vdc_star}
      x(  6)=prm(  3)

!V =  {V0}
      x(  7)= prm( 68)

!vxm =  [vx]
      x(  8)= vx

!vym =  [vy]
      x(  9)= vy

!Vm =  {V0}
      x( 10)= prm( 68)

!iP =   {iP0}
      x( 11)=  prm( 69)

!diP =  0
      x( 12)= 0

!iQ =   {iQ0}
      x( 13)=  prm( 70)

!diQ =  0
      x( 14)= 0

!P =  {P0}
      x( 15)= prm( 64)

!dp =  0
      x( 16)= 0

!Punit =  {P0_unit}
      x( 17)= prm( 66)

!Q =  {Q0}
      x( 18)= prm( 65)

!Qunit =  {Q0_unit}
      x( 19)= prm( 67)

!Pref_lim =  {P0_unit}
      x( 20)= prm( 66)

!dw_pll =  0
      x( 21)= 0

!dw_pllf =  0
      x( 22)= 0

!deltaf =  0
      x( 23)= 0

!w_pll =  {wb}
      x( 24)= prm( 52)

!f =  fnom
      x( 25)= fnom

!fi =  fnom
      x( 26)= fnom

!vdc =  {vdc_star}
      x( 27)= prm(  3)

!dvdc =  0
      x( 28)= 0

!iP_ref =  {iP0}
      x( 29)= prm( 69)

!Plim =  {VPmax}
      x( 30)= prm( 42)

!Plimin =  {VPmax}
      x( 31)= prm( 42)

!iQ_ref =  {iQ0}
      x( 32)= prm( 70)

!mdr =  {lt}/{vdc_star}*{iQ0}*{w0}-{md0}
      x( 33)= prm( 18)/prm(  3)*prm( 70)*prm( 51)-prm( 73)

!mqr =  -{lt}/{vdc_star}*{iP0}*{w0}-{mq0}
      x( 34)= -prm( 18)/prm(  3)*prm( 69)*prm( 51)-prm( 74)

!md =  {md0}
      x( 35)= prm( 73)

!mq =  {mq0}
      x( 36)= prm( 74)

!dvd =  {iP0}*{rt}
      x( 37)= prm( 69)*prm( 17)

!dvq =  {iQ0}*{rt}
      x( 38)= prm( 70)*prm( 17)

!idc =  {idc0}
      x( 39)= prm( 75)

!didc =  {md0}*{iP0}+{mq0}*{iQ0}-{idc0}
      x( 40)= prm( 73)*prm( 69)+prm( 74)*prm( 70)-prm( 75)

!wm_ref =  {wm0}
      x( 41)= prm( 77)

!wm_ref_lim =  {wm0}
      x( 42)= prm( 77)

!wm_ref_lim_in =  {wm0}
      x( 43)= prm( 77)

!iT_ref =  {iT0}
      x( 44)= prm( 76)

!iT =  {iT0}
      x( 45)= prm( 76)

!dwm =  0
      x( 46)= 0

!wm =  {wm0}
      x( 47)= prm( 77)

!Te =  {kT}*{iT0}
      x( 48)= prm( 21)*prm( 76)

!dT =  {kT}*{iT0}-{Tc0}
      x( 49)= prm( 21)*prm( 76)-prm( 79)

!F_pll =  1
      x( 50)= 1

!dv_pll =  {V0}-{Vminpll}
      x( 51)= prm( 68)-prm(  6)

!deltafvh =   {V0}-{Vmax}
      x( 52)=  prm( 68)-prm( 29)

!z1 =  0
      x( 53)= 0

!Fvhi =  1
      x( 54)= 1

!Fvh =  1
      x( 55)= 1

!iPs =  {iP0}
      x( 56)= prm( 69)

!iQs =  {iQ0}
      x( 57)= prm( 70)

!Pref =  {P0_unit}
      x( 58)= prm( 66)

!x10 =  -{V0}
      x( 59)= -prm( 68)

!z = 0
      x( 60)=0

!Fvl =  1
      x( 61)= 1

!Fvli =  1
      x( 62)= 1

!deltafl =  [f] - {fmin}
      x( 63)= x( 25) - prm( 37)

!Ffl =  1
      x( 64)= 1

!Ffli =  1
      x( 65)= 1

!deltafh =  {fmax} - [f]
      x( 66)= prm( 38) - x( 25)

!Ffh =  1
      x( 67)= 1

!Ffhi =  1
      x( 68)= 1

!rocof =  0
      x( 69)= 0

!abrocof =  0
      x( 70)= 0

!deltarocof =  {dfmax} - 0
      x( 71)= prm( 40) - 0

!Ffri =  1
      x( 72)= 1

!Ffr =  1
      x( 73)= 1

!Plim_min =  -0.00001
      x( 74)= -0.00001

!w1 =  0
      x( 75)= 0

!w2 =  0
      x( 76)= 0

!dPupi =  0
      x( 77)= 0

!dPup =  0
      x( 78)= 0

!dPdni =  0
      x( 79)= 0

!dPdn =  0
      x( 80)= 0

!dP =  0
      x( 81)= 0

!status =  1
      x( 82)= 1

!p1 =  {protection}
      x( 83)= prm( 49)

!p2 =  1
      x( 84)= 1

!p3 =  1
      x( 85)= 1

!s1 =  {support}
      x( 86)= prm( 50)

!s2 =  {wm0}
      x( 87)= prm( 77)

!one =  1
      x( 88)= 1

!zero =  0
      x( 89)= 0

!& algeq                                             ! voltage magnitude
      eqtyp(  1)=0

!& tf1p
      eqtyp(  2)= 10
      tc(  2)=prm( 44)

!& tf1p
      eqtyp(  3)=  8
      tc(  3)=prm( 44)

!& tf1p
      eqtyp(  4)=  9
      tc(  4)=prm( 44)

!& algeq                                             ! voltage alignment
      eqtyp(  5)=0

!& algeq
      eqtyp(  6)=0

!& algeq                                             ! compute ix
      eqtyp(  7)=0

!& algeq                                             ! compute iy
      eqtyp(  8)=0

!& algeq
      eqtyp(  9)=0

!& algeq
      eqtyp( 10)=0

!& algeq                                             ! compute powers
      eqtyp( 11)=0

!& algeq
      eqtyp( 12)=0

!& algeq                                             ! compute powers
      eqtyp( 13)=0

!& algeq
      eqtyp( 14)=0

!& int                                               ! voltage alignment angle, PLL angle
      if (1.d0< 0.005)then
         eqtyp( 15)=0
      else
         eqtyp( 15)=  5
         tc( 15)=1.d0
      endif

!& pictl                                             ! PLL
      eqtyp( 16)= 90
      x( 90)=x( 24)
      eqtyp( 17)=0

!& algeq                                             ! frequency deviation
      eqtyp( 18)=0

!& algeq
      eqtyp( 19)=0

!& algeq                                             ! compute and filter frequency
      eqtyp( 20)=0

!& tf1p
      eqtyp( 21)= 25
      tc( 21)=prm(  7)

!& algeq                                             ! PLL freezing
      eqtyp( 22)=0

!& swsign
      eqtyp( 23)=0
      if(x( 51)>=0.)then
         z(  1)=1
      else
         z(  1)=2
      endif

!& algeq
      eqtyp( 24)=0

!& algeq                                             ! DC voltage control
      eqtyp( 25)=0

!& pictl
      eqtyp( 26)= 91
      x( 91)=x( 29)
      eqtyp( 27)=0

!& algeq                                             ! p-axis current control
      eqtyp( 28)=0

!& pictl
      eqtyp( 29)= 92
      x( 92)=x( 33)
      eqtyp( 30)=0

!& algeq                                             ! q-axis current control
      eqtyp( 31)=0

!& algeq
      eqtyp( 32)=0

!& pictl
      eqtyp( 33)= 93
      x( 93)=x( 34)
      eqtyp( 34)=0

!& algeq                                             ! md
      eqtyp( 35)=0

!& algeq                                             ! mq
      eqtyp( 36)=0

!& algeq                                             ! voltage over d-axis terminal impedance
      eqtyp( 37)=0

!& algeq                                             ! voltage over q-axis terminal impedance
      eqtyp( 38)=0

!& tf1p                                              ! d-axis current
      eqtyp( 39)= 11
      tc( 39)=prm( 18)/(prm( 52)*prm( 17))

!& tf1p                                              ! q-axis current
      eqtyp( 40)= 13
      tc( 40)=prm( 18)/(prm( 52)*prm( 17))

!& algeq                                             ! DC link current
      eqtyp( 41)=0

!& algeq                                             ! DC link
      eqtyp( 42)=0

!& int                                               ! DC link voltage
      if (prm( 19)/prm( 52)< 0.005)then
         eqtyp( 43)=0
      else
         eqtyp( 43)= 27
         tc( 43)=prm( 19)/prm( 52)
      endif

!& limvb                                              ! power limiter
      eqtyp( 44)=0
      if(x( 58)>x( 30))then
         z(  2)=1
      elseif(x( 58)<x( 74))then
         z(  2)=-1
      else
         z(  2)=0
      endif

!& algeq                                             ! power mismatch
      eqtyp( 45)=0

!& pictl                                             ! power control
      eqtyp( 46)= 94
      x( 94)=x( 41)
      eqtyp( 47)=0

!& lim                                               ! limit speed control input
      eqtyp( 48)=0
      if(x( 41)>prm( 28))then
         z(  3)=1
      elseif(x( 41)<prm( 27))then
         z(  3)=-1
      else
         z(  3)=0
      endif

!& algeq                                             ! speed control input
      eqtyp( 49)=0

!& pictl                                             ! speed control
      eqtyp( 50)= 95
      x( 95)=x( 44)
      eqtyp( 51)=0

!& tf1p                                              ! motor current control
      eqtyp( 52)= 45
      tc( 52)=1/prm( 16)

!& algeq                                             ! torque equations
      eqtyp( 53)=0

!& algeq
      eqtyp( 54)=0

!& tf1p                                              ! motor inertia
      eqtyp( 55)= 47
      tc( 55)=2*prm( 23)/prm( 24)

!& algeq
      eqtyp( 56)=0

!& pwlin4                                            ! Overvoltage Protection
      eqtyp( 57)=0
      if(x( 52)<(-999))then
         z(  4)=1
      elseif(x( 52)>=999)then
         z(  4)=   3
      elseif((-999)<=x( 52) .and. x( 52)<0.)then
         z(  4)=  1
      elseif(0.<=x( 52) .and. x( 52)<0.)then
         z(  4)=  2
      elseif(0.<=x( 52) .and. x( 52)<999)then
         z(  4)=  3
      endif

!& algeq
      eqtyp( 58)=0

!& hyst
      eqtyp( 59)=0
      if(x( 54)>1.1)then
         z(  5)=1
      elseif(x( 54)<0.9)then
         z(  5)=-1
      else
         if(1.>= 0.)then
            z(  5)=1
         else
            z(  5)=-1
         endif
      endif

!& algeq                                             ! LVRT
      eqtyp( 60)=0

!& timer5
      eqtyp( 61)=0
      eqtyp( 62)=0
      z(  6)=-1
      x( 96)=0.

!& algeq
      eqtyp( 63)=0

!& hyst
      eqtyp( 64)=0
      if(x( 62)>1.1)then
         z(  7)=1
      elseif(x( 62)<0.9)then
         z(  7)=-1
      else
         if(1.>= 0.)then
            z(  7)=1
         else
            z(  7)=-1
         endif
      endif

!& algeq                         ! status variable that can switch the entire unit on or off
      eqtyp( 65)=0

!& algeq
      eqtyp( 66)=0

!& algeq
      eqtyp( 67)=0

!& swsign
      eqtyp( 68)=0
      if(x( 83)>=0.)then
         z(  8)=1
      else
         z(  8)=2
      endif

!& algeq                     ! switch support on and off
      eqtyp( 69)=0

!& algeq
      eqtyp( 70)=0

!& swsign
      eqtyp( 71)=0
      if(x( 86)>=0.)then
         z(  9)=1
      else
         z(  9)=2
      endif

!& algeq                     ! underfrequency protection
      eqtyp( 72)=0

!& swsign
      eqtyp( 73)=0
      if(x( 63)>=0.)then
         z( 10)=1
      else
         z( 10)=2
      endif

!& hyst
      eqtyp( 74)=0
      if(x( 65)>1.1)then
         z( 11)=1
      elseif(x( 65)<0.9)then
         z( 11)=-1
      else
         if(1.>= 0.)then
            z( 11)=1
         else
            z( 11)=-1
         endif
      endif

!& algeq                 !  overfrequency protection
      eqtyp( 75)=0

!& swsign
      eqtyp( 76)=0
      if(x( 66)>=0.)then
         z( 12)=1
      else
         z( 12)=2
      endif

!& hyst
      eqtyp( 77)=0
      if(x( 68)>1.1)then
         z( 13)=1
      elseif(x( 68)<0.9)then
         z( 13)=-1
      else
         if(1.>= 0.)then
            z( 13)=1
         else
            z( 13)=-1
         endif
      endif

!& algeq                ! frequency deviation in Hz
      eqtyp( 78)=0

!& tfder1p               ! Rocof measurement in Hz/s
      x( 97)=x( 23)
      eqtyp( 79)= 97
      tc( 79)=prm( 39)
      eqtyp( 80)=0

!& abs
      eqtyp( 81)=0
      if(x( 69)>0. )then
         z( 14)=1
      else
         z( 14)=-1
      endif

!& algeq              ! Rocof protection
      eqtyp( 82)=0

!& swsign
      eqtyp( 83)=0
      if(x( 71)>=0.)then
         z( 15)=1
      else
         z( 15)=2
      endif

!& hyst
      eqtyp( 84)=0
      if(x( 72)>1.1)then
         z( 16)=1
      elseif(x( 72)<0.9)then
         z( 16)=-1
      else
         if(1.>= 0.)then
            z( 16)=1
         else
            z( 16)=-1
         endif
      endif

!& pwlin4            ! limit active power during undervoltage
      eqtyp( 85)=0
      if(x( 10)<0)then
         z( 17)=1
      elseif(x( 10)>=1.5)then
         z( 17)=   3
      elseif(0<=x( 10) .and. x( 10)<0.9)then
         z( 17)=  1
      elseif(0.9<=x( 10) .and. x( 10)<0.93)then
         z( 17)=  2
      elseif(0.93<=x( 10) .and. x( 10)<1.5)then
         z( 17)=  3
      endif

!& algeq
      eqtyp( 86)=0

!& tf1p2lim
      if(prm( 56)< 0.001)then
         prm( 56)=0.d0
         prm( 41)=-huge(0.d0)
         prm( 42)= huge(0.d0)
         prm( 60)=-huge(0.d0)
         prm( 59)= huge(0.d0)
      endif
      if(1*x( 31)-x( 30)>prm( 59)*prm( 56))then
         z( 18)=1
      elseif(1*x( 31)-x( 30)<prm( 60)*prm( 56))then
         z( 18)=-1
      else
         z( 18)=0
      endif
      eqtyp( 87)=0
      if(x( 30)>prm( 42))then
         z( 19)=1
         eqtyp( 88)=0
      elseif(x( 30)<prm( 41))then
         z( 19)=-1
         eqtyp( 88)=0
      else
         z( 19)=0
         eqtyp( 88)= 30
      endif
      tc( 88)=prm( 56)

!& algeq         ! Frequency droop control
      eqtyp( 89)=0

!& db            ! frequency deadband in pu
      eqtyp( 90)=0
      if(x( 75)>prm( 46))then
         z( 20)=1
      elseif(x( 75)<prm( 45))then
         z( 20)=-1
      else
         z( 20)=0
      endif

!& algeq         ! compute unlimited power change during overfrequency
      eqtyp( 91)=0

!& lim           ! limit power change
      eqtyp( 92)=0
      if(x( 77)>(prm( 42)-prm( 66)))then
         z( 21)=1
      elseif(x( 77)<0.0000000001)then
         z( 21)=-1
      else
         z( 21)=0
      endif

!& algeq         ! compute unlimited power change during underfrequency
      eqtyp( 93)=0

!& lim           ! limit power change
      eqtyp( 94)=0
      if(x( 79)>(-0.00000001))then
         z( 22)=1
      elseif(x( 79)<(-prm( 66)))then
         z( 22)=-1
      else
         z( 22)=0
      endif

!& algeq
      eqtyp( 95)=0

!& algeq
      eqtyp( 96)=0

!& algeq
      eqtyp( 97)=0

!& algeq
      eqtyp( 98)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq                                             ! voltage magnitude
      f(  1)=dsqrt(vx**2+vy**2) - x(  7)

!& tf1p
      f(  2)=(-x( 10)+1.*x(  7))

!& tf1p
      f(  3)=(-x(  8)+1.*vx    )

!& tf1p
      f(  4)=(-x(  9)+1.*vy    )

!& algeq                                             ! voltage alignment
      f(  5)=-x(  3) + x(  8)*cos(x(  5))+x(  9)*sin(x(  5))

!& algeq
      f(  6)=-x(  4) - x(  8)*sin(x(  5))+x(  9)*cos(x(  5))

!& algeq                                             ! compute ix
      f(  7)=-x(  1) + (-x( 56)*cos(x(  5))-x( 57)*sin(x(  5)))*prm(  1)/prm(  2)

!& algeq                                             ! compute iy
      f(  8)=-x(  2) + (-x( 56)*sin(x(  5))+x( 57)*cos(x(  5)))*prm(  1)/prm(  2)

!& algeq
      f(  9)=-x( 56) + x( 11)*x( 82)

!& algeq
      f( 10)=-x( 57) + x( 13)*x( 82)

!& algeq                                             ! compute powers
      f( 11)=-x( 15)*prm(  2)/prm(  1) -x( 17)                            ! + x(  1)*vx+x(  2)*vy

!& algeq
      f( 12)=-x( 18)*prm(  2)/prm(  1) - x( 19)                           ! -vx*x(  2) + vy*x(  1)

!& algeq                                             ! compute powers
      f( 13)=-x( 17) + x(  3)*x( 56) + x(  4)*x( 57)                              ! - x( 15)*prm(  2)/prm(  1)

!& algeq
      f( 14)=-x( 19) + x(  3)*x( 57) - x(  4)*x( 56)                              ! - x( 18)*prm(  2)/prm(  1)

!& int                                               ! voltage alignment angle, PLL angle
      if (1.d0< 0.005)then
         f( 15)=x( 22)-x(  5)
      else
         f( 15)=x( 22)
      endif

!& pictl                                             ! PLL
      f( 16)=0.1/(prm(  5)*0.001)**2                                                                                                                                                                                                                                                                                     *x(  4)
      f( 17)=0.5/(prm(  5)*0.001)                                                                                                                                                                                                                                                                                        *x(  4)+x( 90)-x( 24)

!& algeq                                             ! frequency deviation
      f( 18)=x( 21) - x( 24) + omega*prm( 52)

!& algeq
      f( 19)=x( 22) -x( 21)*x( 50)

!& algeq                                             ! compute and filter frequency
      f( 20)=-x( 26)+x( 24)/prm( 52)*fnom

!& tf1p
      f( 21)=(-x( 25)+1.*x( 26))

!& algeq                                             ! PLL freezing
      f( 22)=-x( 51) + x( 10)-prm(  6)

!& swsign
      select case (z(  1))
         case(1)
            f( 23)=x( 50)-x( 88)
         case(2)
            f( 23)=x( 50)-x( 89)
      end select

!& algeq
      f( 24)=-x(  6) + prm(  3)

!& algeq                                             ! DC voltage control
      f( 25)=-x( 28) + x(  6) - x( 27)

!& pictl
      f( 26)=prm(  9)                                                                                                                                                                                                                                                                                                    *x( 28)
      f( 27)=prm(  8)                                                                                                                                                                                                                                                                                                    *x( 28)+x( 91)-x( 29)

!& algeq                                             ! p-axis current control
      f( 28)=-x( 12) + x( 29)*x( 82) -x( 11)

!& pictl
      f( 29)=prm( 11)                                                                                                                                                                                                                                                                                                    *x( 12)
      f( 30)=prm( 10)                                                                                                                                                                                                                                                                                                    *x( 12)+x( 92)-x( 33)

!& algeq                                             ! q-axis current control
      f( 31)=-x( 32)                                           ! + x( 29)*dsqrt(1-prm(  4))*x( 82)

!& algeq
      f( 32)=-x( 14) + x( 32)*x( 82) -x( 13)

!& pictl
      f( 33)=prm( 11)                                                                                                                                                                                                                                                                                                    *x( 14)
      f( 34)=prm( 10)                                                                                                                                                                                                                                                                                                    *x( 14)+x( 93)-x( 34)

!& algeq                                             ! md
      f( 35)=-x( 35) + (-x( 33) + prm( 18)/max(1.d-3,prm(  3))*x( 25)/fnom*x( 13))

!& algeq                                             ! mq
      f( 36)=-x( 36) + (-x( 34) - prm( 18)/max(1.d-3,prm(  3))*x( 25)/fnom*x( 11))

!& algeq                                             ! voltage over d-axis terminal impedance
      f( 37)=-x( 37) + x(  3) - x( 35) * x( 27) + prm( 18)*omega*x( 13)

!& algeq                                             ! voltage over q-axis terminal impedance
      f( 38)=-x( 38) + x(  4) - x( 36) * x( 27) - prm( 18)*omega*x( 11)

!& tf1p                                              ! d-axis current
      f( 39)=(-x( 11)+1/prm( 17)*x( 37))

!& tf1p                                              ! q-axis current
      f( 40)=(-x( 13)+1/prm( 17)*x( 38))

!& algeq                                             ! DC link current
      f( 41)=-x( 39) + x( 82)*(x( 47)*prm( 21)*x( 45) + prm( 22)*x( 45)**2) / max(1.d-3,x( 27))

!& algeq                                             ! DC link
      f( 42)=-x( 40)+x( 35)*x( 11)+x( 36)*x( 13)-x( 39)

!& int                                               ! DC link voltage
      if (prm( 19)/prm( 52)< 0.005)then
         f( 43)=x( 40)-x( 27)
      else
         f( 43)=x( 40)
      endif

!& limvb                                              ! power limiter
      select case (z(  2))
         case(0)
            f( 44)=x( 20)-x( 58)
         case(-1)
            f( 44)=x( 20)-x( 74)
         case(1)
            f( 44)=x( 20)-x( 30)
      end select

!& algeq                                             ! power mismatch
      f( 45)=-x( 16) + x( 20)-x( 17)

!& pictl                                             ! power control
      f( 46)=prm( 13)                                                                                                                                                                                                                                                                                                    *x( 16)
      f( 47)=prm( 12)                                                                                                                                                                                                                                                                                                    *x( 16)+x( 94)-x( 41)

!& lim                                               ! limit speed control input
      select case (z(  3))
         case(0)
            f( 48)=x( 43)-x( 41)
         case(-1)
            f( 48)=x( 43)-prm( 27)
         case(1)
            f( 48)=x( 43)-prm( 28)
      end select

!& algeq                                             ! speed control input
      f( 49)=-x( 46) + prm( 20)*(x( 82)*x( 42)-x( 47))

!& pictl                                             ! speed control
      f( 50)=prm( 15)                                                                                                                                                                                                                                                                                                    *x( 46)
      f( 51)=prm( 14)                                                                                                                                                                                                                                                                                                    *x( 46)+x( 95)-x( 44)

!& tf1p                                              ! motor current control
      f( 52)=(-x( 45)+1*x( 44))

!& algeq                                             ! torque equations
      f( 53)=-x( 48) + prm( 21)*x( 45)

!& algeq
      f( 54)=-x( 49) + x( 48)-x( 82)*prm( 79)

!& tf1p                                              ! motor inertia
      f( 55)=(-x( 47)+1/prm( 24)*x( 49))

!& algeq
      f( 56)=x( 52) - x( 10) +prm( 29)

!& pwlin4                                            ! Overvoltage Protection
      select case (z(  4))
         case (  1)
            f( 57)=0.+ ( (0.-0.)*(x( 52)-(-999))/(0.-(-999)) ) -x( 53)
         case (  2)
            f( 57)=0.+ ( (1.-0.)*(x( 52)-0.)/(0.-0.) ) -x( 53)
         case (  3)
            f( 57)=1.+ ( (1.-1.)*(x( 52)-0.)/(999-0.) ) -x( 53)
      end select

!& algeq
      f( 58)=x( 54) -1 + x( 53)

!& hyst
      if(z(  5) == 1)then
         f( 59)=x( 55)-1.-(1.-1.)*(x( 54)-1.1)/(1.1-0.9)
      else
         f( 59)=x( 55)-0.-(0.-0.)*(x( 54)-0.9)/(1.1-0.9)
      endif

!& algeq                                             ! LVRT
      f( 60)=x( 10) + x( 59)

!& timer5
      select case (z(  6))
         case (-1)
            f( 61)=x( 60)
            f( 62)=x( 96)
         case (0)
            f( 61)=x( 60)
            f( 62)= 1.
         case (1)
            f( 61)=x( 60)-1.
            f( 62)= 0.
      end select

!& algeq
      f( 63)=x( 62) -1 + x( 60)

!& hyst
      if(z(  7) == 1)then
         f( 64)=x( 61)-1.-(1.-1.)*(x( 62)-1.1)/(1.1-0.9)
      else
         f( 64)=x( 61)-0.-(0.-0.)*(x( 62)-0.9)/(1.1-0.9)
      endif

!& algeq                         ! status variable that can switch the entire unit on or off
      f( 65)=x( 84) - x( 55)*x( 61)*x( 64)*x( 67)*x( 73)

!& algeq
      f( 66)=x( 83) - prm( 49)

!& algeq
      f( 67)=x( 85) - 1

!& swsign
      select case (z(  8))
         case(1)
            f( 68)=x( 82)-x( 84)
         case(2)
            f( 68)=x( 82)-x( 85)
      end select

!& algeq                     ! switch support on and off
      f( 69)=x( 86) - prm( 50)

!& algeq
      f( 70)=x( 87) - prm( 77)

!& swsign
      select case (z(  9))
         case(1)
            f( 71)=x( 42)-x( 43)
         case(2)
            f( 71)=x( 42)-x( 87)
      end select

!& algeq                     ! underfrequency protection
      f( 72)=x( 63) - x( 25) + prm( 37)

!& swsign
      select case (z( 10))
         case(1)
            f( 73)=x( 65)-x( 88)
         case(2)
            f( 73)=x( 65)-x( 89)
      end select

!& hyst
      if(z( 11) == 1)then
         f( 74)=x( 64)-1.-(1.-1.)*(x( 65)-1.1)/(1.1-0.9)
      else
         f( 74)=x( 64)-0.-(0.-0.)*(x( 65)-0.9)/(1.1-0.9)
      endif

!& algeq                 !  overfrequency protection
      f( 75)=x( 66) - prm( 38) + x( 25)

!& swsign
      select case (z( 12))
         case(1)
            f( 76)=x( 68)-x( 88)
         case(2)
            f( 76)=x( 68)-x( 89)
      end select

!& hyst
      if(z( 13) == 1)then
         f( 77)=x( 67)-1.-(1.-1.)*(x( 68)-1.1)/(1.1-0.9)
      else
         f( 77)=x( 67)-0.-(0.-0.)*(x( 68)-0.9)/(1.1-0.9)
      endif

!& algeq                ! frequency deviation in Hz
      f( 78)=-x( 23) + x( 25)-fnom

!& tfder1p               ! Rocof measurement in Hz/s
      f( 79)=-x( 97)+x( 23)
      if (prm( 39)< 0.005)then
         f( 80)=1/prm( 39)*x( 23)-x( 69)
      else
         f( 80)=1/prm( 39)*(x( 23)-x( 97))-x( 69)
      endif

!& abs
      if(z( 14) == 1 )then
         f( 81)=x( 70)-x( 69)
      else
         f( 81)=x( 70)+x( 69)
      endif

!& algeq              ! Rocof protection
      f( 82)=-x( 71) +prm( 40) -x( 70)

!& swsign
      select case (z( 15))
         case(1)
            f( 83)=x( 72)-x( 88)
         case(2)
            f( 83)=x( 72)-x( 89)
      end select

!& hyst
      if(z( 16) == 1)then
         f( 84)=x( 73)-1.-(1.-1.)*(x( 72)-1.1)/(1.1-0.9)
      else
         f( 84)=x( 73)-0.-(0.-0.)*(x( 72)-0.9)/(1.1-0.9)
      endif

!& pwlin4            ! limit active power during undervoltage
      select case (z( 17))
         case (  1)
            f( 85)=prm( 41)+ ( (prm( 41)-prm( 41))*(x( 10)-0)/(0.9-0) ) -x( 31)
         case (  2)
            f( 85)=prm( 41)+ ( (prm( 42)-prm( 41))*(x( 10)-0.9)/(0.93-0.9) ) -x( 31)
         case (  3)
            f( 85)=prm( 42)+ ( (prm( 42)-prm( 42))*(x( 10)-0.93)/(1.5-0.93) ) -x( 31)
      end select

!& algeq
      f( 86)=x( 74)+0.00001

!& tf1p2lim
      select case (z( 18))
         case(0)
            f( 87)=x( 98)-1*x( 31)+x( 30)
         case(1)
            f( 87)=x( 98)-prm( 59)*prm( 56)
         case(-1)
            f( 87)=x( 98)-prm( 60)*prm( 56)
      end select
      select case (z( 19))
         case(0)
            f( 88)=x( 98)
         case(1)
            f( 88)=x( 30)-prm( 42)
         case(-1)
            f( 88)=x( 30)-prm( 41)
      end select

!& algeq         ! Frequency droop control
      f( 89)=-x( 75) + x( 25)/fnom-1.d0

!& db            ! frequency deadband in pu
      select case (z( 20))
         case(0)
            f( 90)=x( 76)
         case(-1)
            f( 90)=x( 76)-0.-1.*(x( 75)-prm( 45))
         case(1)
            f( 90)=x( 76)-0.-1.*(x( 75)-prm( 46))
      end select

!& algeq         ! compute unlimited power change during overfrequency
      f( 91)=-x( 77) + (x( 76)*fnom)/(prm( 47)-fnom)*(prm( 42)-prm( 66))

!& lim           ! limit power change
      select case (z( 21))
         case(0)
            f( 92)=x( 78)-x( 77)
         case(-1)
            f( 92)=x( 78)-0.0000000001
         case(1)
            f( 92)=x( 78)-(prm( 42)-prm( 66))
      end select

!& algeq         ! compute unlimited power change during underfrequency
      f( 93)=-x( 79) + (x( 76)*fnom)/(fnom-prm( 48))*(prm( 66)-prm( 41))

!& lim           ! limit power change
      select case (z( 22))
         case(0)
            f( 94)=x( 80)-x( 79)
         case(-1)
            f( 94)=x( 80)-(-prm( 66))
         case(1)
            f( 94)=x( 80)-(-0.00000001)
      end select

!& algeq
      f( 95)=x( 81) - x( 78)-x( 80)

!& algeq
      f( 96)=- x( 58) +  x( 82)*(prm( 66) +x( 81))

!& algeq
      f( 97)=x( 88) -1

!& algeq
      f( 98)=x( 89)

!........................................................................................
   case (update_disc)

!& algeq                                             ! voltage magnitude

!& tf1p

!& tf1p

!& tf1p

!& algeq                                             ! voltage alignment

!& algeq

!& algeq                                             ! compute ix

!& algeq                                             ! compute iy

!& algeq

!& algeq

!& algeq                                             ! compute powers

!& algeq

!& algeq                                             ! compute powers

!& algeq

!& int                                               ! voltage alignment angle, PLL angle

!& pictl                                             ! PLL

!& algeq                                             ! frequency deviation

!& algeq

!& algeq                                             ! compute and filter frequency

!& tf1p

!& algeq                                             ! PLL freezing

!& swsign
      select case (z(  1))
         case(1)
            if(x( 51)<0.)then
               z(  1)=2
            endif
         case(2)
            if(x( 51)>=0.)then
               z(  1)=1
            endif
      end select

!& algeq

!& algeq                                             ! DC voltage control

!& pictl

!& algeq                                             ! p-axis current control

!& pictl

!& algeq                                             ! q-axis current control

!& algeq

!& pictl

!& algeq                                             ! md

!& algeq                                             ! mq

!& algeq                                             ! voltage over d-axis terminal impedance

!& algeq                                             ! voltage over q-axis terminal impedance

!& tf1p                                              ! d-axis current

!& tf1p                                              ! q-axis current

!& algeq                                             ! DC link current

!& algeq                                             ! DC link

!& int                                               ! DC link voltage

!& limvb                                              ! power limiter
      select case (z(  2))
         case(0)
            if(x( 58)>x( 30))then
               z(  2)=1
            elseif(x( 58)<x( 74))then
               z(  2)=-1
            endif
         case(-1)
            if(x( 58)>x( 74))then
               z(  2)=0
            endif
         case(1)
            if(x( 58)<x( 30))then
               z(  2)=0
            endif
      end select

!& algeq                                             ! power mismatch

!& pictl                                             ! power control

!& lim                                               ! limit speed control input
      select case (z(  3))
         case(0)
            if(x( 41)>prm( 28))then
               z(  3)=1
            elseif(x( 41)<prm( 27))then
               z(  3)=-1
            endif
         case(-1)
            if(x( 41)>prm( 27))then
               z(  3)=0
            endif
         case(1)
            if(x( 41)<prm( 28))then
               z(  3)=0
            endif
      end select

!& algeq                                             ! speed control input

!& pictl                                             ! speed control

!& tf1p                                              ! motor current control

!& algeq                                             ! torque equations

!& algeq

!& tf1p                                              ! motor inertia

!& algeq

!& pwlin4                                            ! Overvoltage Protection
      if(x( 52)<(-999))then
         z(  4)=1
      elseif(x( 52)>=999)then
         z(  4)=  3
      elseif((-999)<=x( 52) .and. x( 52)<0.)then
         z(  4)=  1
      elseif(0.<=x( 52) .and. x( 52)<0.)then
         z(  4)=  2
      elseif(0.<=x( 52) .and. x( 52)<999)then
         z(  4)=  3
      endif

!& algeq

!& hyst
      if (z(  5) == -1)then
         if(x( 54)>1.1)then
            z(  5)=1
         endif
      else
         if(x( 54)<0.9)then
            z(  5)=-1
         endif
      endif

!& algeq                                             ! LVRT

!& timer5
      if(z(  6) == -1)then
         if(x( 59) >= (-prm( 32)))then
            z(  6)=0
            eqtyp( 62)= 96
         endif
      else
         if(x( 59) < (-prm( 32)))then
            z(  6)=-1
            eqtyp( 62)=0
         endif
      endif
      if(z(  6) == 0)then
         if(x( 59) > (-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36))))then
            if(x( 96) > 0.)then
               z(  6)=1
            endif
         elseif(x( 59) > (-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36))))then
            if(x( 96) > prm( 33)+(0.-prm( 33))*(x( 59)-(-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36))))/((-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36)))-(-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36)))))then
               z(  6)=1
            endif
         elseif(x( 59) > (-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36))))then
            if(x( 96) > prm( 33)+(prm( 33)-prm( 33))*(x( 59)-(-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36))))/((-(prm( 43)*prm( 30) + (1-prm( 43))*prm( 36)))-(-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36)))))then
               z(  6)=1
            endif
         elseif(x( 59) > (-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36))))then
            if(x( 96) > prm( 35)+(prm( 33)-prm( 35))*(x( 59)-(-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36))))/((-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36)))-(-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36)))))then
               z(  6)=1
            endif
         elseif(x( 59) > (-prm( 32)))then
            if(x( 96) > prm( 34)+(prm( 35)-prm( 34))*(x( 59)-(-prm( 32)))/((-(prm( 43)*prm( 31) + (1-prm( 43))*prm( 36)))-(-prm( 32))))then
               z(  6)=1
            endif
         endif
      endif

!& algeq

!& hyst
      if (z(  7) == -1)then
         if(x( 62)>1.1)then
            z(  7)=1
         endif
      else
         if(x( 62)<0.9)then
            z(  7)=-1
         endif
      endif

!& algeq                         ! status variable that can switch the entire unit on or off

!& algeq

!& algeq

!& swsign
      select case (z(  8))
         case(1)
            if(x( 83)<0.)then
               z(  8)=2
            endif
         case(2)
            if(x( 83)>=0.)then
               z(  8)=1
            endif
      end select

!& algeq                     ! switch support on and off

!& algeq

!& swsign
      select case (z(  9))
         case(1)
            if(x( 86)<0.)then
               z(  9)=2
            endif
         case(2)
            if(x( 86)>=0.)then
               z(  9)=1
            endif
      end select

!& algeq                     ! underfrequency protection

!& swsign
      select case (z( 10))
         case(1)
            if(x( 63)<0.)then
               z( 10)=2
            endif
         case(2)
            if(x( 63)>=0.)then
               z( 10)=1
            endif
      end select

!& hyst
      if (z( 11) == -1)then
         if(x( 65)>1.1)then
            z( 11)=1
         endif
      else
         if(x( 65)<0.9)then
            z( 11)=-1
         endif
      endif

!& algeq                 !  overfrequency protection

!& swsign
      select case (z( 12))
         case(1)
            if(x( 66)<0.)then
               z( 12)=2
            endif
         case(2)
            if(x( 66)>=0.)then
               z( 12)=1
            endif
      end select

!& hyst
      if (z( 13) == -1)then
         if(x( 68)>1.1)then
            z( 13)=1
         endif
      else
         if(x( 68)<0.9)then
            z( 13)=-1
         endif
      endif

!& algeq                ! frequency deviation in Hz

!& tfder1p               ! Rocof measurement in Hz/s

!& abs
      if (z( 14) == -1 )then
         if(x( 69)> blocktol1 )then
            z( 14)=1
         endif
      else
         if(x( 69)< - blocktol1 )then
            z( 14)=-1
         endif
      endif

!& algeq              ! Rocof protection

!& swsign
      select case (z( 15))
         case(1)
            if(x( 71)<0.)then
               z( 15)=2
            endif
         case(2)
            if(x( 71)>=0.)then
               z( 15)=1
            endif
      end select

!& hyst
      if (z( 16) == -1)then
         if(x( 72)>1.1)then
            z( 16)=1
         endif
      else
         if(x( 72)<0.9)then
            z( 16)=-1
         endif
      endif

!& pwlin4            ! limit active power during undervoltage
      if(x( 10)<0)then
         z( 17)=1
      elseif(x( 10)>=1.5)then
         z( 17)=  3
      elseif(0<=x( 10) .and. x( 10)<0.9)then
         z( 17)=  1
      elseif(0.9<=x( 10) .and. x( 10)<0.93)then
         z( 17)=  2
      elseif(0.93<=x( 10) .and. x( 10)<1.5)then
         z( 17)=  3
      endif

!& algeq

!& tf1p2lim
      select case (z( 18))
         case(0)
            if(x( 98)>prm( 59)*prm( 56))then
               z( 18)=1
            elseif(x( 98)<prm( 60)*prm( 56))then
               z( 18)=-1
            endif
         case(1)
            if(1*x( 31)-x( 30)<prm( 59)*prm( 56))then
               z( 18)= 0
            endif
         case(-1)
            if(1*x( 31)-x( 30)>prm( 60)*prm( 56))then
               z( 18)= 0
            endif
      end select
      select case (z( 19))
         case(0)
            if(x( 30)>prm( 42))then
               z( 19)=1
               eqtyp( 88)=0
            elseif(x( 30)<prm( 41))then
               z( 19)=-1
               eqtyp( 88)=0
            endif
         case(1)
            if (x( 98)<0.)then
               z( 19)= 0
               eqtyp( 88)= 30
            endif
         case(-1)
            if(x( 98)>0.)then
               z( 19)= 0
               eqtyp( 88)= 30
            endif
      end select

!& algeq         ! Frequency droop control

!& db            ! frequency deadband in pu
      select case (z( 20))
         case(0)
            if(x( 75)>prm( 46))then
               z( 20)=1
            elseif(x( 75)<prm( 45))then
               z( 20)=-1
            endif
         case(-1)
            if(x( 75)>prm( 45))then
               z( 20)=0
            endif
         case(1)
            if(x( 75)<prm( 46))then
               z( 20)=0
            endif
      end select

!& algeq         ! compute unlimited power change during overfrequency

!& lim           ! limit power change
      select case (z( 21))
         case(0)
            if(x( 77)>(prm( 42)-prm( 66)))then
               z( 21)=1
            elseif(x( 77)<0.0000000001)then
               z( 21)=-1
            endif
         case(-1)
            if(x( 77)>0.0000000001)then
               z( 21)=0
            endif
         case(1)
            if(x( 77)<(prm( 42)-prm( 66)))then
               z( 21)=0
            endif
      end select

!& algeq         ! compute unlimited power change during underfrequency

!& lim           ! limit power change
      select case (z( 22))
         case(0)
            if(x( 79)>(-0.00000001))then
               z( 22)=1
            elseif(x( 79)<(-prm( 66)))then
               z( 22)=-1
            endif
         case(-1)
            if(x( 79)>(-prm( 66)))then
               z( 22)=0
            endif
         case(1)
            if(x( 79)<(-0.00000001))then
               z( 22)=0
            endif
      end select

!& algeq

!& algeq

!& algeq

!& algeq
   end select

end subroutine inj_ATL1a
