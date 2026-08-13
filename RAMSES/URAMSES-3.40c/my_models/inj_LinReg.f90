!  MODEL NAME : inj_LinReg              
!  MODEL DESCRIPTION FILE : LinReg_noScaling.txt
!  Data :
!       prm(  1)=  Tout
!  Parameters :
!       prm(  2)=  v0  
!       prm(  3)=  w0  
!       prm(  4)=  ip0  
!       prm(  5)=  iq0  
!       prm(  6)=  dw1   Historical
!       prm(  7)=  dv1   Historical
!       prm(  8)=  dip1   Historical
!       prm(  9)=  diq1   Historical
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  V                     
!       x(  4)=  ipi                   
!       x(  5)=  iqi                   
!       x(  6)=  ip                    
!       x(  7)=  iq                    
!       x(  8)=  dw                    
!       x(  9)=  dv                    
!       x( 10)=  dip                   
!       x( 11)=  diq                   

!.........................................................................................................

subroutine inj_LinReg(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
   
!============================Change 1=================================================
   ! Define NN input, output and matrix
   double precision, DIMENSION(6) :: NNin
   double precision, DIMENSION(2) :: NNout
   double precision, DIMENSION(2,6) :: A

   ! Define the matrix A. Take it from MATLAB printing row by row comma separated.
   ! A = transpose(reshape((/ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 /), (/ size(A, 2), size(A, 1) /)))
   ! This will give you a matrix like:
   ! 1 2 3  4  5  6
   ! 7 8 9 10 11 12
   A = transpose(reshape((/0.7831809336664127, 0.27379302326846217, -0.7784086548006044, -0.2621848517825998, 0.9944414484550389, 0.017765768825855347, -0.7487796435840025, 0.11646341399092917, 0.7505730688208507, -0.11609420920973999, -0.00027321365325154565, 0.9989192087617073 /), (/ size(A, 2), size(A, 1) /)))
   !=============================================================================

   select case (mode)
   case (define_var_and_par)
      nbdata=  1
      nbaddpar=  8
      parname(  1)='Tout'
      parname(  2)='v0'
      parname(  3)='w0'
      parname(  4)='ip0'
      parname(  5)='iq0'
      parname(  6)='dw1'
      parname(  7)='dv1'
      parname(  8)='dip1'
      parname(  9)='diq1'
      adix=  1
      adiy=  2
      nbxvar= 11
      nbzvar=  0

!........................................................................................
   case (define_obs)
      nbobs= 4
      obsname(  1)='ip'
      obsname(  2)='iq'
      obsname(  3)='dip'
      obsname(  4)='diq'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  6)              
      obs(  2)=x(  7)
      obs(  3)=x( 10)              
      obs(  4)=x( 11)

!........................................................................................
   case (initialize)

!v0 = dsqrt([vx]**2+[vy]**2)
      prm(  2)= dsqrt(vx**2+vy**2)

!w0 = [omega]
      prm(  3)= omega

!ip0 = -([vx]*[ix]+[vy]*[iy])/{v0}
      prm(  4)= -(vx*ix+vy*iy)/prm(  2)

!iq0 = -([vy]*[ix]-[vx]*[iy])/{v0}
      prm(  5)= -(vy*ix-vx*iy)/prm(  2)

!dw1 = 0
      prm(  6)= 0

!dv1 = 0
      prm(  7)= 0

!dip1 = 0
      prm(  8)= 0

!diq1 = 0
      prm(  9)= 0

!V =  {v0}
      x(  3)= prm(  2)

!ipi =  {ip0}
      x(  4)= prm(  4)

!iqi =  {iq0}
      x(  5)= prm(  5)

!ip =  {ip0}
      x(  6)= prm(  4)

!iq =  {iq0}
      x(  7)= prm(  5)

!dw =  0
      x(  8)= 0

!dv =  0
      x(  9)= 0

!dip =  0
      x( 10)= 0

!diq =  0
      x( 11)= 0

!& algeq ! Compute V
      eqtyp(  1)=0

!& algeq	! Compute dV
      eqtyp(  2)=0

!& algeq ! Compute dw
      eqtyp(  3)=0

!& algeq                                             ! compute currents from matrix multiplication
      eqtyp(  4)=0

!& algeq                                             ! compute currents from matrix multiplication
      eqtyp(  5)=0

!& algeq ! Compute dip
      eqtyp(  6)=0

!& algeq ! Compute diq
      eqtyp(  7)=0

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  8)=  6
      tc(  8)=prm(  1)

!& tf1p          ! small "output" time constant for driving the currents
      eqtyp(  9)=  7
      tc(  9)=prm(  1)

!& algeq						! backtransform
      eqtyp( 10)=0

!& algeq
      eqtyp( 11)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq ! Compute V
      f(  1)=x(  3) - dsqrt(vx**2+vy**2)

!& algeq	! Compute dV
      f(  2)=x(  9) - (dsqrt(vx**2+vy**2)-prm(  2))

!& algeq ! Compute dw
      f(  3)=- x(  8) + (omega-prm(  3))

!============================Change 3=================================================
! Declare the NN input and compute output
      NNin = (/ x(8), x(9), prm(6), prm(7), prm(8), prm(9) /)
      NNout = matmul(A,NNin)

!& algeq                                             ! compute currents, matrix multiplication
      f(  4)=-x(  4) + NNout(1) + prm(  4)

!& algeq                                             ! compute currents, matrix multiplication
      f(  5)=- x(  5) + NNout(2) + prm(  5)
!=============================================================================

!& algeq ! Compute dip
      f(  6)=- x( 10) + NNout(1)

!& algeq ! Compute diq
      f(  7)=- x( 11) + NNout(2)

!& tf1p          ! small "output" time constant for driving the currents
      f(  8)=(-x(  6)+1.*x(  4))

!& tf1p          ! small "output" time constant for driving the currents
      f(  9)=(-x(  7)+1.*x(  5))

!& algeq						! backtransform
      f( 10)=x(  3)*x(  6) + (vx*x(  1)+vy*x(  2))

!& algeq
      f( 11)=x(  3)*x(  7) + (vy*x(  1)-vx*x(  2))

!........................................................................................
   case (update_disc)

!& algeq ! Compute V

!& algeq	! Compute dV

!& algeq ! Compute dw

!& algeq                                             ! compute currents from matrix multiplication

!& algeq                                             ! compute currents from matrix multiplication

!& algeq ! Compute dip

!& algeq ! Compute diq

!& tf1p          ! small "output" time constant for driving the currents

!& tf1p          ! small "output" time constant for driving the currents

!& algeq						! backtransform

!& algeq
   end select

end subroutine inj_LinReg
