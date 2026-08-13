!  MODEL NAME : tor_DEGOV1              
!  MODEL DESCRIPTION FILE : tor_DEGOV1.txt
!  Data :
!       prm(  1)=  SWM
!       prm(  2)=  T1
!       prm(  3)=  T2
!       prm(  4)=  T3
!       prm(  5)=  K
!       prm(  6)=  T4
!       prm(  7)=  T5
!       prm(  8)=  T6
!       prm(  9)=  TMIN
!       prm( 10)=  TMAX
!       prm( 11)=  TD
!       prm( 12)=  R
!       prm( 13)=  TE
!  Parameters :
!       prm( 14)=  V60  
!       prm( 15)=  REF  
!  Output states :
!       x(  1)=  tm           mechanical torque
!  Internal states defined by user :
!       x(  2)=  V4b                   
!       x(  3)=  V4a                   
!       x(  4)=  V3                    
!       x(  5)=  V2                    
!       x(  6)=  V4                    
!       x(  7)=  V5                    
!       x(  8)=  V6                    
!       x(  9)=  Pm                    
!       x( 10)=  SW                    

!.........................................................................................................

subroutine tor_DEGOV1(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
   obsname,adtm,eqtyp,tc,t,p,tm,omega,x,z,f,obs)

   use MODELING
   use SETTINGS, only : blocktol1
   use FUNCTIONS_IN_MODELS

   implicit none
   double precision, intent(in):: t,p,tm,omega
   double precision, intent(out):: f(*)
   double precision :: obs(*)
   double precision, intent(inout):: x(*),prm(*),tc(*)
   integer, intent(in):: nb,mode
   integer, intent(inout):: nbxvar,nbzvar,nbdata,nbaddpar,adtm,nbobs,eqtyp(*),z(*)
   character(len=20), intent(in):: name
   character(len=10) :: parname(*),obsname(*)

   select case (mode)
   case (define_var_and_par)
      nbdata= 13
      nbaddpar=  2
      parname(  1)='SWM'
      parname(  2)='T1'
      parname(  3)='T2'
      parname(  4)='T3'
      parname(  5)='K'
      parname(  6)='T4'
      parname(  7)='T5'
      parname(  8)='T6'
      parname(  9)='TMIN'
      parname( 10)='TMAX'
      parname( 11)='TD'
      parname( 12)='R'
      parname( 13)='TE'
      parname( 14)='V60'
      parname( 15)='REF'
      adtm=  1
      nbxvar= 15
      nbzvar=  2

!........................................................................................
   case (define_obs)
      nbobs=  7
      obsname(  1)='V2'
      obsname(  2)='V3'
      obsname(  3)='V4a'
      obsname(  4)='V4'
      obsname(  5)='V5'
      obsname(  6)='V6'
      obsname(  7)='Pm'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  5)              
      obs(  2)=x(  4)              
      obs(  3)=x(  3)              
      obs(  4)=x(  6)              
      obs(  5)=x(  7)              
      obs(  6)=x(  8)              
      obs(  7)=x(  9)              

!........................................................................................
   case (initialize)

!V60 = ((1.d0-{SWM})*[tm])+({SWM}*[p])
      prm( 14)= ((1.d0-prm(  1))*tm)+(prm(  1)*p)

!REF = {V60}*{R}
      prm( 15)= prm( 14)*prm( 12)

!V4b =  0.d0
      x(  2)= 0.d0

!V4a =  [V4b]
      x(  3)= x(  2)

!V3 =  [V4a]
      x(  4)= x(  3)

!V2 =  -[V3]
      x(  5)= -x(  4)

!V4 =  [tm]
      x(  6)= x(  1)

!V5 =  [p]
      x(  7)= p

!V6 =  {V60}
      x(  8)= prm( 14)

!Pm =  [tm]
      x(  9)= x(  1)

!SW =  {SWM}-0.5d0
      x( 10)= prm(  1)-0.5d0

!& algeq
      eqtyp(  1)=0

!& tf2p2z							Electrical control/Governor
      if (prm(  2)*prm(  3)>= 0.005)then
         x( 11)=prm(  2)*prm(  3)*x(  5)
         x( 12)=0.d0
      elseif (prm(  2)>= 0.005)then
         x( 11)=x(  5)
         x( 12)=0.d0
      else
         x( 11)=0.d0
         x( 12)=0.d0
      endif
      if (prm(  2)*prm(  3)>= 0.005)then
         eqtyp(  2)= 11
         eqtyp(  3)= 12
         eqtyp(  4)= 0
         tc(  3)=prm(  2)*prm(  3)
      elseif (prm(  2)>= 0.005)then
         eqtyp(  2)= 11
         eqtyp(  3)= 0
         eqtyp(  4)= 0
         tc(  2)=prm(  2)
      else
         eqtyp(  2)= 0
         eqtyp(  3)= 0
         eqtyp(  4)= 0
      endif

!& tf1p1z							Fuel injection system/Actuator
      x( 13)=x(  4)
      eqtyp(  5)= 13
      tc(  5)=prm(  8)
      eqtyp(  6)=0

!& tf1p
      eqtyp(  7)=  2
      tc(  7)=prm(  7)

!& inlim
      if (1.d0>= 0.005)then
         tc(  8)=1.d0
      endif
      if (x(  6)>prm( 10))then
         z(  1)=1
         eqtyp(  8)=0
      elseif (x(  6)<prm(  9)) then
         z(  1)=-1
         eqtyp(  8)=0
      else
         z(  1)=0
         if (1.d0>= 0.005)then
            eqtyp(  8)=  6
         else
            eqtyp(  8)=0
         endif
      endif

!& tf1p
      eqtyp(  9)=  7
      tc(  9)=prm( 13)

!& algeq
      eqtyp( 10)=0

!& swsign
      eqtyp( 11)=0
      if(x( 10)>=0.)then
         z(  2)=1
      else
         z(  2)=2
      endif

!& tf2p2z							Engine dead time
      if (0.0833*prm( 11)*prm( 11)>= 0.005)then
         x( 14)=0.0833*prm( 11)*prm( 11)*x(  6)
         x( 15)=0.d0
      elseif (0.5*prm( 11)>= 0.005)then
         x( 14)=x(  6)
         x( 15)=0.d0
      else
         x( 14)=0.d0
         x( 15)=0.d0
      endif
      if (0.0833*prm( 11)*prm( 11)>= 0.005)then
         eqtyp( 12)= 14
         eqtyp( 13)= 15
         eqtyp( 14)= 0
         tc( 13)=0.0833*prm( 11)*prm( 11)
      elseif (0.5*prm( 11)>= 0.005)then
         eqtyp( 12)= 14
         eqtyp( 13)= 0
         eqtyp( 14)= 0
         tc( 12)=0.5*prm( 11)
      else
         eqtyp( 12)= 0
         eqtyp( 13)= 0
         eqtyp( 14)= 0
      endif

!& algeq
      eqtyp( 15)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq
      f(  1)=x(  5)+prm( 12)*x(  8)-prm( 15)+omega-1.d0

!& tf2p2z							Electrical control/Governor
      if (prm(  2)*prm(  3)>= 0.005)then
         f(  2)=x( 12)
         f(  3)=-x( 11)-prm(  2)*x( 12)+prm(  2)*prm(  3)*x(  5)
         f(  4)=1.d0*((prm(  2)*prm(  3)-0.d0)*x( 11)+(prm(  4)*prm(  2)*prm(  3)-prm(  2)*0.d0)*x( 12) & 
           & +0.d0*prm(  2)*prm(  3)*x(  5))-(prm(  2)*prm(  3)**2)*x(  4)
      elseif (prm(  2)>= 0.005)then
         f(  2)=x(  5)-x( 11)
         f(  3)=x( 12)
         f(  4)=1.d0*(prm(  4)*x(  5)+(prm(  2)-prm(  4))*x( 11))-prm(  2)*x(  4)
      else
         f(  2)=x( 11)
         f(  3)=x( 12)
         f(  4)=1.d0*x(  5)-x(  4)
      endif

!& tf1p1z							Fuel injection system/Actuator
      f(  5)=-x( 13)+x(  4)
      if (prm(  8)< 0.005)then
         f(  6)=prm(  5)*x(  4)-x(  3)
      else
         f(  6)=prm(  5)*(prm(  6)*x(  4)+(prm(  8)-prm(  6))*x( 13))-prm(  8)*x(  3)
      endif

!& tf1p
      f(  7)=(-x(  2)+1.d0*x(  3))

!& inlim
      if (1.d0>= 0.005)then
         select case (z(  1))
            case(0)
               f(  8)=x(  2)
            case(1)
               f(  8)=x(  6)-prm( 10)
            case(-1)
               f(  8)=x(  6)-prm(  9)
         end select
      else
         select case (z(  1))
            case(0)
               f(  8)=x(  2)-x(  6)
            case(1)
               f(  8)=x(  6)-prm( 10)
            case(-1)
               f(  8)=x(  6)-prm(  9)
         end select
      endif

!& tf1p
      f(  9)=(-x(  7)+1.d0*p     )

!& algeq
      f( 10)=x( 10)-prm(  1)+0.5d0

!& swsign
      select case (z(  2))
         case(1)
            f( 11)=x(  8)-x(  7)
         case(2)
            f( 11)=x(  8)-x(  6)
      end select

!& tf2p2z							Engine dead time
      if (0.0833*prm( 11)*prm( 11)>= 0.005)then
         f( 12)=x( 15)
         f( 13)=-x( 14)-0.5*prm( 11)*x( 15)+0.0833*prm( 11)*prm( 11)*x(  6)
         f( 14)=1.d0*((0.0833*prm( 11)*prm( 11)-0.0833*prm( 11)*prm( 11))*x( 14)+((-0.5*prm( 11))*0.0833*prm( 11)*prm( 11)-0.5*prm( 11)*0.0833*prm( 11)*prm( 11))*x( 15) & 
           & +0.0833*prm( 11)*prm( 11)*0.0833*prm( 11)*prm( 11)*x(  6))-(0.0833*prm( 11)*prm( 11)**2)*x(  1)
      elseif (0.5*prm( 11)>= 0.005)then
         f( 12)=x(  6)-x( 14)
         f( 13)=x( 15)
         f( 14)=1.d0*((-0.5*prm( 11))*x(  6)+(0.5*prm( 11)-(-0.5*prm( 11)))*x( 14))-0.5*prm( 11)*x(  1)
      else
         f( 12)=x( 14)
         f( 13)=x( 15)
         f( 14)=1.d0*x(  6)-x(  1)
      endif

!& algeq
      f( 15)=x(  9)-x(  1)*omega

!........................................................................................
   case (update_disc)

!& algeq

!& tf2p2z							Electrical control/Governor

!& tf1p1z							Fuel injection system/Actuator

!& tf1p

!& inlim
      if (1.d0>= 0.005)then
         select case (z(  1))
            case(0)
               if(x(  6)<prm(  9))then
                  z(  1)=-1
                  eqtyp(  8)=0
               elseif(x(  6)>prm( 10))then
                  z(  1)= 1
                  eqtyp(  8)=0
               endif
            case(1)
               if(x(  2)<0.)then
                  z(  1)=0
                  eqtyp(  8)=  6
               endif
            case(-1)
               if(x(  2)>0.)then
                  z(  1)=0
                  eqtyp(  8)=  6
               endif
         end select
      else
         select case (z(  1))
            case(0)
               if(x(  6)<prm(  9))then
                  z(  1)=-1
               elseif(x(  6)>prm( 10))then
                  z(  1)= 1
               endif
            case(1)
               if(x(  2)<prm( 10))then
                  z(  1)=0
               endif
            case(-1)
               if(x(  2)>prm(  9))then
                  z(  1)=0
               endif
         end select
      endif

!& tf1p

!& algeq

!& swsign
      select case (z(  2))
         case(1)
            if(x( 10)<0.)then
               z(  2)=2
            endif
         case(2)
            if(x( 10)>=0.)then
               z(  2)=1
            endif
      end select

!& tf2p2z							Engine dead time

!& algeq
   end select

end subroutine tor_DEGOV1
