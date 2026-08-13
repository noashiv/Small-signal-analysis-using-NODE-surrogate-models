!  MODEL NAME : inj_LinRegS             
!  MODEL DESCRIPTION FILE : LinReg_Scaling.txt
!  Data :
!       prm(  1)=  Tout
!  Parameters :
!       prm(  2)=  v0  
!       prm(  3)=  w0  
!       prm(  4)=  ip0  
!       prm(  5)=  iq0  
!       prm(  6)=  mu_w   scaling parameters from 23.06.2022
!       prm(  7)=  mu_v  
!       prm(  8)=  mu_ip  
!       prm(  9)=  mu_iq  
!       prm( 10)=  o_w  
!       prm( 11)=  o_v  
!       prm( 12)=  o_ip  
!       prm( 13)=  o_iq  
!       prm( 14)=  ws1   Historical
!       prm( 15)=  vs1   Historical
!       prm( 16)=  ips1   Historical
!       prm( 17)=  iqs1   Historical
!  Output states :
!       x(  1)=  ix           real component of current
!       x(  2)=  iy           imaginary component of current
!  Internal states defined by user :
!       x(  3)=  V                     
!       x(  4)=  ipi                   
!       x(  5)=  iqi                   
!       x(  6)=  ip                    
!       x(  7)=  iq                    
!       x(  8)=  ws                    
!       x(  9)=  vs                    
!       x( 10)=  ips                   
!       x( 11)=  iqs                   

!.........................................................................................................

subroutine inj_LinRegS(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
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
   A = transpose(reshape((/0.18146230579783657, 0.1491481743539769, -0.1807609161396279, -0.14355829594273814, 0.9953960461959739, 0.001742846809828854, -1.489484432349083, 0.5128336353190757, 1.4923837457765505, -0.5113458844461374, -0.0018006600295326042, 0.9986697003450816 /), (/ size(A, 2), size(A, 1) /)))
!=============================================================================
   
   select case (mode)
   case (define_var_and_par)
      nbdata=  1
      nbaddpar= 16
      parname(  1)='Tout'
      parname(  2)='v0'
      parname(  3)='w0'
      parname(  4)='ip0'
      parname(  5)='iq0'
      parname(  6)='mu_w'
      parname(  7)='mu_v'
      parname(  8)='mu_ip'
      parname(  9)='mu_iq'
      parname( 10)='o_w'
      parname( 11)='o_v'
      parname( 12)='o_ip'
      parname( 13)='o_iq'
      parname( 14)='ws1'
      parname( 15)='vs1'
      parname( 16)='ips1'
      parname( 17)='iqs1'
      adix=  1
      adiy=  2
      nbxvar= 11
      nbzvar=  0

!........................................................................................
   case (define_obs)
      nbobs=  2
      obsname(  1)='ip'
      obsname(  2)='iq'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  6)              
      obs(  2)=x(  7)       
!==========================Change 2===================================================
      ! update the historical values
!      prm(10:25)=prm(6:21)
      prm(14) = x( 8)
      prm(15) = x( 9)
      prm(16) = x(10)
      prm(17) = x(11)         
!=============================================================================      

!........................................................................................
   case (initialize)

!v0 = dsqrt([vx]**2+[vy]**2)
      prm(  2)= dsqrt(vx**2+vy**2)

!w0 = [omega]
      prm(  3)= omega

!ip0 = -([vx]*[ix]+[vy]*[iy])/{v0}
      prm(  4)= -(vx*ix+vy*iy)/prm(  2)

!iq0 = - ([vy]*[ix]-[vx]*[iy])/{v0}
      prm(  5)= -(vy*ix-vx*iy)/prm(  2)

!mu_w = 0.9989367			
      prm(  6)= 0.9989366982390585			

!mu_v = 0.99156038
      prm(  7)= 0.9915603789241514

!mu_ip = 0.1800172
      prm(  8)= 0.18001720405020039

!mu_iq = 0.06395422prm(10
      prm(  9)= 0.06395422325848646

!o_w = dsqrt(1.00061130d-04)
      prm( 10)= (0.0001000611303294589)

!o_v = dsqrt(4.91040567d-04)
      prm( 11)= (0.0004910405674276576)

!o_ip = dsqrt(1.66692250d-03)
      prm( 12)= (0.0016669225014240032)

!o_iq = dsqrt(2.53530508d-05)
      prm( 13)= (0.00002535305076631447)

!ws1 = ([omega]-{mu_w})/{o_w} 		
      prm( 14)= (omega-prm(  6))/dsqrt(prm( 10))

!vs1 = ({v0}-{mu_v})/{o_v} 		
      prm( 15)= (prm(  2)-prm(  7))/dsqrt(prm( 11))

!ips1 = ({ip0}-{mu_ip})/{o_ip} 		
      prm( 16)= (prm(  4)-prm(  8))/dsqrt(prm( 12)) 		

!iqs1 =  ({iq0}-{mu_iq})/{o_iq}  	
      prm( 17)=  (prm(  5)-prm(  9))/dsqrt(prm( 13))

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

!ws =  {ws1}
      x(  8)= prm( 14)

!vs =  {vs1}
      x(  9)= prm( 15)

!ips =  {ips1}
      x( 10)= prm( 16)

!iqs =  {iqs1}
      x( 11)= prm( 17)

!& algeq ! Compute V
      eqtyp(  1)=0

!& algeq	! Compute V
      eqtyp(  2)=0

!& algeq ! Compute dw
      eqtyp(  3)=0

!& algeq                                             ! compute currents from matrix multiplication
      eqtyp(  4)=0

!& algeq                                             ! compute currents from matrix multiplication
      eqtyp(  5)=0

!& algeq ! Compute ip
      eqtyp(  6)=0

!& algeq ! Compute iq
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

!& algeq	! Compute vs
      f(  2)=-x(  9) + (x(  3)-prm(  7))/dsqrt(prm( 11))

!& algeq ! Compute ws
      f(  3)=- x(  8) + (omega-prm(  6))/dsqrt(prm( 10))

!============================Change 3=================================================
! Declare the NN input and compute output
      NNin = (/ x(8), x(9), prm(14), prm(15), prm(16), prm(17) /)
      NNout = matmul(A,NNin)

!& algeq                                             ! compute currents, matrix multiplication, descaling
      f(  4)=-x( 4) + NNout(1) * dsqrt(prm(12))+prm(8)

!& algeq                                             ! compute currents, matrix multiplication, descaling
      f(  5)=- x( 5) + NNout(2)*dsqrt(prm(13))+prm(9)
!=============================================================================

!& algeq ! Compute scaled current, ips
      f(  6)=- x( 10) + NNout(1)

!& algeq ! Compute scaled current, iqs
      f(  7)=- x(11) + NNout(2)

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

!& algeq	! Compute V

!& algeq ! Compute dw

!& algeq                                             ! compute currents from matrix multiplication

!& algeq                                             ! compute currents from matrix multiplication

!& algeq ! Compute ip

!& algeq ! Compute iq

!& tf1p          ! small "output" time constant for driving the currents

!& tf1p          ! small "output" time constant for driving the currents

!& algeq						! backtransform

!& algeq
   end select

end subroutine inj_LinRegS
