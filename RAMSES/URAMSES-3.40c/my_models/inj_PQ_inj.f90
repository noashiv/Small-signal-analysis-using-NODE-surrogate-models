!  MODEL NAME : inj_PQ_inj              
!  MODEL DESCRIPTION FILE : inj_PQ.txt
!  Data :
!       prm(  1)=  Tout       ! small "output" time constant for driving the currents (recommend: 0.01)
!  Parameters :
!       prm(  2)=  P0   initial active power
!       prm(  3)=  Q0   initial reactive power
!       prm(  4)=  Vo   initial voltage magnitude at bus
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  Ixset                 
!       x(  4)=  Iyset                 
!       x(  5)=  P                     
!       x(  6)=  Q                     
!       x(  7)=  V                      Voltage magnitude

!.........................................................................................................

subroutine inj_PQ_inj(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
      nbdata=  1
      nbaddpar=  3
      parname(  1)='Tout'
      parname(  2)='P0'
      parname(  3)='Q0'
      parname(  4)='Vo'
      adix=  1
      adiy=  2
      nbxvar=  7
      nbzvar=  0

!........................................................................................
   case (define_obs)
      nbobs=  2
      obsname(  1)='P'
      obsname(  2)='Q'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  5)              
      obs(  2)=x(  6)              

!........................................................................................
   case (initialize)

!P0 = [vx]*[ix]+[vy]*[iy]
      prm(  2)= vx*ix+vy*iy

!Q0 = [vy]*[ix]-[vx]*[iy]
      prm(  3)= vy*ix-vx*iy

!Vo = dsqrt([vx]**2+[vy]**2)
      prm(  4)= dsqrt(vx**2+vy**2)

!Ixset =  [ix]
      x(  3)= x(  1)

!Iyset =  [iy]
      x(  4)= x(  2)

!P =  {P0}
      x(  5)= prm(  2)

!Q =  {Q0}
      x(  6)= prm(  3)

!V =  {Vo}
      x(  7)= prm(  4)

!& algeq         ! voltage magnitube
      eqtyp(  1)=0

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  2)=  1
      tc(  2)=prm(  1)

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  3)=  2
      tc(  3)=prm(  1)

!& algeq         ! ix component of injected current
      eqtyp(  4)=0

!& algeq         ! iy component of injected current
      eqtyp(  5)=0

!& algeq         ! set P to Pref
      eqtyp(  6)=0

!& algeq         ! set Q to Qref
      eqtyp(  7)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq         ! voltage magnitube
      f(  1)=dsqrt(vx**2+vy**2) - x(  7)

!& tf1p          ! small "output" time constant for driving the currents
      f(  2)=(-x(  1)+1.*x(  3))

!& tf1p          ! small "output" time constant for driving the currents
      f(  3)=(-x(  2)+1.*x(  4))

!& algeq         ! ix component of injected current
      f(  4)=(x(  5)*vx + x(  6)*vy)/max(x(  7)**2,1.d-02) -x(  3)

!& algeq         ! iy component of injected current
      f(  5)=(x(  5)*vy - x(  6)*vx)/max(x(  7)**2,1.d-02) -x(  4)

!& algeq         ! set P to Pref
      f(  6)=x(  5) - prm(  2)

!& algeq         ! set Q to Qref
      f(  7)=x(  6) - prm(  3)

!........................................................................................
   case (update_disc)

!& algeq         ! voltage magnitube

!& tf1p          ! small "output" time constant for driving the currents

!& tf1p          ! small "output" time constant for driving the currents

!& algeq         ! ix component of injected current

!& algeq         ! iy component of injected current

!& algeq         ! set P to Pref

!& algeq         ! set Q to Qref
   end select

end subroutine inj_PQ_inj
