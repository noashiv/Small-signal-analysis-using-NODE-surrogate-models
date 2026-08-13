!  MODEL NAME : exc_AC1A                
!  MODEL DESCRIPTION FILE : exc_AC1A.txt
!  Data :
!       prm(  1)=  Kv
!       prm(  2)=  Rc
!       prm(  3)=  Xc
!       prm(  4)=  TR
!       prm(  5)=  KA
!       prm(  6)=  TA
!       prm(  7)=  TB
!       prm(  8)=  TC
!       prm(  9)=  VAMAX
!       prm( 10)=  VAMIN
!       prm( 11)=  KE
!       prm( 12)=  TE
!       prm( 13)=  KF
!       prm( 14)=  TF
!       prm( 15)=  VRMAX
!       prm( 16)=  VRMIN
!       prm( 17)=  VE1
!       prm( 18)=  SE1
!       prm( 19)=  VE2
!       prm( 20)=  SE2
!       prm( 21)=  KC
!       prm( 22)=  KD
!       prm( 23)=  VUEL
!  Parameters :
!       prm( 24)=  VE0  
!       prm( 25)=  VFE0  
!       prm( 26)=  VREF  
!       prm( 27)=  VOEL  
!  Output states :
!       x(  1)=  vf           field voltage
!  Internal states defined by user :
!       x(  2)=  Vc1                   
!       x(  3)=  Vc                    
!       x(  4)=  VRminusVFE            
!       x(  5)=  VR                    
!       x(  6)=  V4                    
!       x(  7)=  V3                    
!       x(  8)=  V2                    
!       x(  9)=  V1                    
!       x( 10)=  deltaV                
!       x( 11)=  VE                    
!       x( 12)=  VFE                   
!       x( 13)=  VF                    

!.........................................................................................................

subroutine exc_AC1A(nb,name,mode,nbxvar,nbzvar,nbdata,nbaddpar,prm,parname,nbobs, &
   obsname,advf,eqtyp,tc,t,v,p,q,omega,if,vf,x,z,f,obs)

   use MODELING
   use SETTINGS, only : blocktol1
   use FUNCTIONS_IN_MODELS

   implicit none
   double precision, intent(in):: t,v,p,q,omega,if,vf
   double precision, intent(out):: f(*)
   double precision :: obs(*)
   double precision, intent(inout):: x(*),prm(*),tc(*)
   integer, intent(in):: nb,mode
   integer, intent(inout):: nbxvar,nbzvar,nbdata,nbaddpar,advf,nbobs,eqtyp(*),z(*)
   character(len=20), intent(in):: name
   character(len=10) :: parname(*),obsname(*)

   select case (mode)
   case (define_var_and_par)
      nbdata= 23
      nbaddpar=  4
      parname(  1)='Kv'
      parname(  2)='Rc'
      parname(  3)='Xc'
      parname(  4)='TR'
      parname(  5)='KA'
      parname(  6)='TA'
      parname(  7)='TB'
      parname(  8)='TC'
      parname(  9)='VAMAX'
      parname( 10)='VAMIN'
      parname( 11)='KE'
      parname( 12)='TE'
      parname( 13)='KF'
      parname( 14)='TF'
      parname( 15)='VRMAX'
      parname( 16)='VRMIN'
      parname( 17)='VE1'
      parname( 18)='SE1'
      parname( 19)='VE2'
      parname( 20)='SE2'
      parname( 21)='KC'
      parname( 22)='KD'
      parname( 23)='VUEL'
      parname( 24)='VE0'
      parname( 25)='VFE0'
      parname( 26)='VREF'
      parname( 27)='VOEL'
      advf=  1
      nbxvar= 15
      nbzvar=  5

!........................................................................................
   case (define_obs)
      nbobs=  2
      obsname(  1)='VR'
      obsname(  2)='vf'

!........................................................................................
   case (evaluate_obs)
      obs(  1)=x(  5)              
      obs(  2)=x(  1)              

!........................................................................................
   case (initialize)

!VE0        = vinrectif([if],[vf],{KC})
      prm( 24)= vinrectif(if,vf,prm( 21))

!VFE0       = {KD}*[if]+({KE}+satur({VE0},{VE1},{SE1},{VE2},{SE2}))*{VE0}
      prm( 25)= prm( 22)*if+(prm( 11)+satur(prm( 24),prm( 17),prm( 18),prm( 19),prm( 20)))*prm( 24)

!VREF       = vcomp([v],[p],[q],{Kv},{Rc},{Xc})+({VFE0}/{KA})
      prm( 26)= vcomp(v,p,q,prm(  1),prm(  2),prm(  3))+(prm( 25)/prm(  5))

!VOEL       = 99999
      prm( 27)= 99999

!Vc1 =  vcomp([v],[p],[q],{Kv},{Rc},{Xc})
      x(  2)= vcomp(v,p,q,prm(  1),prm(  2),prm(  3))

!Vc =  [Vc1]
      x(  3)= x(  2)

!VRminusVFE =  0.d0
      x(  4)= 0.d0

!VR =  {VFE0}
      x(  5)= prm( 25)

!V4 =  [VR]
      x(  6)= x(  5)

!V3 =  [VR]
      x(  7)= x(  5)

!V2 =  [VR]
      x(  8)= x(  5)

!V1 =  [V2]/{KA}
      x(  9)= x(  8)/prm(  5)

!deltaV =  [V1]
      x( 10)= x(  9)

!VE =  {VE0}
      x( 11)= prm( 24)

!VFE =  {VFE0}
      x( 12)= prm( 25)

!VF =  0.d0
      x( 13)= 0.d0

!& algeq                    line drop compensation
      eqtyp(  1)=0

!& tf1p                     voltage measurement time constant
      eqtyp(  2)=  3
      tc(  2)=prm(  4)

!& algeq                    summation point of AVR
      eqtyp(  3)=0

!& tf1p1z                   lead-lag
      x( 14)=x( 10)
      eqtyp(  4)= 14
      tc(  4)=prm(  7)
      eqtyp(  5)=0

!& tf1plim                  amplifier
      if(x(  8)>prm(  9))then
         z(  1)=1
         eqtyp(  6)=0
      elseif(x(  8)<prm( 10))then
         z(  1)=-1
         eqtyp(  6)=0
      else
         z(  1)=0
         eqtyp(  6)=  8
      endif
      tc(  6)=prm(  6)

!& max1v1c                  HV gate of UEL
      eqtyp(  7)=0
      if(x(  8)<prm( 23))then
         z(  2)=1
      else
         z(  2)=2
      endif

!& min1v1c                    LV gate of OEL
      eqtyp(  8)=0
      if(x(  7)<prm( 27))then
         z(  3)=1
      else
         z(  3)=2
      endif

!& lim                      limiter
      eqtyp(  9)=0
      if(x(  6)>prm( 15))then
         z(  4)=1
      elseif(x(  6)<prm( 16))then
         z(  4)=-1
      else
         z(  4)=0
      endif

!& algeq                    input of exciter integrator
      eqtyp( 10)=0

!& inlim                    exciter integrator
      if (prm( 12)>= 0.005)then
         tc( 11)=prm( 12)
      endif
      if (x( 11)>9999.d0)then
         z(  5)=1
         eqtyp( 11)=0
      elseif (x( 11)<0.d0) then
         z(  5)=-1
         eqtyp( 11)=0
      else
         z(  5)=0
         if (prm( 12)>= 0.005)then
            eqtyp( 11)= 11
         else
            eqtyp( 11)=0
         endif
      endif

!& algeq                    VFE function of if and ve
      eqtyp( 12)=0

!& algeq                    vf function of VE and if
      eqtyp( 13)=0

!& tfder1p                  derivative feedback
      x( 15)=x( 12)
      eqtyp( 14)= 15
      tc( 14)=prm( 14)
      eqtyp( 15)=0

!........................................................................................
   case (evaluate_eqs)

!& algeq                    line drop compensation
      f(  1)=x(  2)-vcomp(v,p,q,prm(  1),prm(  2),prm(  3))

!& tf1p                     voltage measurement time constant
      f(  2)=(-x(  3)+1.d0*x(  2))

!& algeq                    summation point of AVR
      f(  3)=prm( 26)-x(  3)-x( 13)-x( 10)

!& tf1p1z                   lead-lag
      f(  4)=-x( 14)+x( 10)
      if (prm(  7)< 0.005)then
         f(  5)=1.d0*x( 10)-x(  9)
      else
         f(  5)=1.d0*(prm(  8)*x( 10)+(prm(  7)-prm(  8))*x( 14))-prm(  7)*x(  9)
      endif

!& tf1plim                  amplifier
      select case (z(  1))
         case(0)
            f(  6)=-x(  8)+prm(  5)*x(  9)
         case(1)
            f(  6)=x(  8)-prm(  9)
         case(-1)
            f(  6)=x(  8)-prm( 10)
      end select

!& max1v1c                  HV gate of UEL
      select case (z(  2))
         case(1)
            f(  7)=prm( 23)-x(  7)
         case(2)
            f(  7)=x(  8)-x(  7)
      end select

!& min1v1c                    LV gate of OEL
      select case (z(  3))
         case(1)
            f(  8)=x(  7)-x(  6)
         case(2)
            f(  8)=prm( 27)-x(  6)
      end select

!& lim                      limiter
      select case (z(  4))
         case(0)
            f(  9)=x(  5)-x(  6)
         case(-1)
            f(  9)=x(  5)-prm( 16)
         case(1)
            f(  9)=x(  5)-prm( 15)
      end select

!& algeq                    input of exciter integrator
      f( 10)=x(  4)-x(  5)+x( 12)

!& inlim                    exciter integrator
      if (prm( 12)>= 0.005)then
         select case (z(  5))
            case(0)
               f( 11)=x(  4)
            case(1)
               f( 11)=x( 11)-9999.d0
            case(-1)
               f( 11)=x( 11)-0.d0
         end select
      else
         select case (z(  5))
            case(0)
               f( 11)=x(  4)-x( 11)
            case(1)
               f( 11)=x( 11)-9999.d0
            case(-1)
               f( 11)=x( 11)-0.d0
         end select
      endif

!& algeq                    VFE function of if and ve
      f( 12)=prm( 22)*if+(prm( 11)+satur(x( 11),prm( 17),prm( 18),prm( 19),prm( 20)))*x( 11)-x( 12)

!& algeq                    vf function of VE and if
      f( 13)=x(  1)-vrectif(if,x( 11),prm( 21))

!& tfder1p                  derivative feedback
      f( 14)=-x( 15)+x( 12)
      if (prm( 14)< 0.005)then
         f( 15)=(prm( 13)/prm( 14))*x( 12)-x( 13)
      else
         f( 15)=(prm( 13)/prm( 14))*(x( 12)-x( 15))-x( 13)
      endif

!........................................................................................
   case (update_disc)

!& algeq                    line drop compensation

!& tf1p                     voltage measurement time constant

!& algeq                    summation point of AVR

!& tf1p1z                   lead-lag

!& tf1plim                  amplifier
      select case (z(  1))
         case(0)
            if(x(  8)<prm( 10))then
                  z(  1)=-1
                  eqtyp(  6)=0
            elseif(x(  8)>prm(  9))then
                  z(  1)= 1
                  eqtyp(  6)=0
            endif
         case(1)
            if(-x(  8)+prm(  5)*x(  9)<0.)then
                  z(  1)=0
                  eqtyp(  6)=  8
            endif
         case(-1)
            if(-x(  8)+prm(  5)*x(  9)>0.)then
                  z(  1)= 0
                  eqtyp(  6)=  8
            endif
      end select

!& max1v1c                  HV gate of UEL
      select case (z(  2))
         case(1)
            if(x(  8)>prm( 23))then
               z(  2)=2
            endif
         case(2)
            if(prm( 23)>x(  8))then
               z(  2)=1
            endif
      end select

!& min1v1c                    LV gate of OEL
      select case (z(  3))
         case(1)
            if(x(  7)>prm( 27))then
               z(  3)=2
            endif
         case(2)
            if(prm( 27)>x(  7))then
               z(  3)=1
            endif
      end select

!& lim                      limiter
      select case (z(  4))
         case(0)
            if(x(  6)>prm( 15))then
               z(  4)=1
            elseif(x(  6)<prm( 16))then
               z(  4)=-1
            endif
         case(-1)
            if(x(  6)>prm( 16))then
               z(  4)=0
            endif
         case(1)
            if(x(  6)<prm( 15))then
               z(  4)=0
            endif
      end select

!& algeq                    input of exciter integrator

!& inlim                    exciter integrator
      if (prm( 12)>= 0.005)then
         select case (z(  5))
            case(0)
               if(x( 11)<0.d0)then
                  z(  5)=-1
                  eqtyp( 11)=0
               elseif(x( 11)>9999.d0)then
                  z(  5)= 1
                  eqtyp( 11)=0
               endif
            case(1)
               if(x(  4)<0.)then
                  z(  5)=0
                  eqtyp( 11)= 11
               endif
            case(-1)
               if(x(  4)>0.)then
                  z(  5)=0
                  eqtyp( 11)= 11
               endif
         end select
      else
         select case (z(  5))
            case(0)
               if(x( 11)<0.d0)then
                  z(  5)=-1
               elseif(x( 11)>9999.d0)then
                  z(  5)= 1
               endif
            case(1)
               if(x(  4)<9999.d0)then
                  z(  5)=0
               endif
            case(-1)
               if(x(  4)>0.d0)then
                  z(  5)=0
               endif
         end select
      endif

!& algeq                    VFE function of if and ve

!& algeq                    vf function of VE and if

!& tfder1p                  derivative feedback
   end select

end subroutine exc_AC1A
