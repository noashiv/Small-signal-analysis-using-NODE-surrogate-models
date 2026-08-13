!  MODEL NAME : inj_LinReg_noScale      
!  MODEL DESCRIPTION FILE : LinReg_noScaling.txt
!  Data :
!       prm(  1)=  avip
!       prm(  2)=  awip
!       prm(  3)=  aviq
!       prm(  4)=  awiq
!       prm(  5)=  Tout
!  Parameters :
!       prm(  6)=  v0  
!       prm(  7)=  w0  
!       prm(  8)=  ip0  
!       prm(  9)=  iq0  
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  ip                    
!       x(  4)=  iq                    
!       x(  5)=  ipi                   
!       x(  6)=  iqi                   
!       x(  7)=  V                     

!.........................................................................................................

subroutine inj_LinReg_noScale(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata=  5
      nbaddpar=  4
      parname(  1)='avip'
      parname(  2)='awip'
      parname(  3)='aviq'
      parname(  4)='awiq'
      parname(  5)='Tout'
      parname(  6)='v0'
      parname(  7)='w0'
      parname(  8)='ip0'
      parname(  9)='iq0'
      adix=  1
      adiy=  2
      nbxvar=  7
      nbzvar=  0

!........................................................................................
   case (define_obs)
      nbobs=  4
      obsname(  1)='ip'
      obsname(  2)='iq'
      obsname(  3)='ix'
      obsname(  4)='iy'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  3)              
      obs(  2)=x(  4)              
      obs(  3)=x(  1)              
      obs(  4)=x(  2)              

!........................................................................................
   case (initialize)

!v0 = dsqrt([vx]**2+[vy]**2)
      prm(  6)= dsqrt(vx**2+vy**2)

!w0 = [omega]
      prm(  7)= omega

!ip0 = ([vx]*[ix]+[vy]*[iy])/{v0}
      prm(  8)= (vx*ix+vy*iy)/prm(  6)

!iq0 = ([vy]*[ix]-[vx]*[iy])/{v0}
      prm(  9)= (vy*ix-vx*iy)/prm(  6)

!ip =  {ip0}
      x(  3)= prm(  8)

!iq =  {iq0}
      x(  4)= prm(  9)

!ipi =  {ip0}
      x(  5)= prm(  8)

!iqi =  {iq0}
      x(  6)= prm(  9)

!V =  {v0}
      x(  7)= prm(  6)

!& algeq
      eqtyp(  1)=0

!& algeq                                             ! compute ip
      eqtyp(  2)=0

!& algeq                                             ! compute iq
      eqtyp(  3)=0

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  4)=  3
      tc(  4)=prm(  5)

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  5)=  4
      tc(  5)=prm(  5)

!& algeq						! backtransform
      eqtyp(  6)=0

!& algeq
      eqtyp(  7)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=x(  7) - dsqrt(vx**2+vy**2)

!& algeq                                             ! compute ip
      f(  2)=-x(  5) + prm(  1)*x(  7)+prm(  2)*omega

!& algeq                                             ! compute iq
      f(  3)=-x(  6) + prm(  3)*x(  7)+prm(  4)*omega

!& tf1p          ! small "output" time constant for driving the currents
      f(  4)=(-x(  3)+1.*x(  5))

!& tf1p          ! small "output" time constant for driving the currents
      f(  5)=(-x(  4)+1.*x(  6))

!& algeq						! backtransform
      f(  6)=x(  7)*x(  3) - (vx*x(  1)+vy*x(  2))

!& algeq
      f(  7)=x(  7)*x(  4) - (vy*x(  1)-vx*x(  2))

!........................................................................................
   case (update_disc)

!& algeq

!& algeq                                             ! compute ip

!& algeq                                             ! compute iq

!& tf1p          ! small "output" time constant for driving the currents

!& tf1p          ! small "output" time constant for driving the currents

!& algeq						! backtransform

!& algeq
   end select

end subroutine inj_LinReg_noScale
