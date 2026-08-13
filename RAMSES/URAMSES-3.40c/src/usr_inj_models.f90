!> @file
!> @brief associates the name of the injector with the actual subroutine

!> @brief associates the name of the injector with the actual subroutine
!> @details .
subroutine assoc_inj_ptr(modelname,inj_ptr)

   use MODELING

   implicit none

   character(len=20), intent(in):: modelname
   procedure(injector), pointer, intent(out) :: inj_ptr
   external inj_vfault
   external inj_ATL
   external inj_ATL1
   external inj_ATL1a
   external inj_IBG22
   external inj_IBG22r
   external inj_IBG3
   external inj_LinReg
   external inj_LinRegS
   external inj_LinReg_noScale
   external inj_PQ_inj
   external inj_BESS2
   external inj_BESS3  
   external inj_BESS3a  
   external inj_IBG22rl
   external inj_IBG22h
   external inj_IBG3l
   external inj_IBG3i
   external inj_IBG3a
   external inj_IBG3s
   external inj_IBG22ra
   external inj_SVC
   
   
   select case (modelname)

      case('VFAULT')
         inj_ptr=>inj_vfault
      case('ATL')
          inj_ptr=>inj_ATL
      case('ATL1')
          inj_ptr=>inj_ATL1
      case('ATL1a')
          inj_ptr=>inj_ATL1a
      case('IBG22')
          inj_ptr=>inj_IBG22
      case('IBG22r')
          inj_ptr=>inj_IBG22r  
      case('LinReg')
          inj_ptr=>inj_LinReg
      case('LinRegS')
          inj_ptr=>inj_LinRegS
      case('PQ')
          inj_ptr=>inj_PQ_inj
      case('LinRegNs')
          inj_ptr=>inj_LinReg_noScale
      case('BESS2')
          inj_ptr=>inj_BESS2
      case('BESS3')
          inj_ptr=>inj_BESS3
      case('BESS3a')
          inj_ptr=>inj_BESS3a
      case('IBG3')
          inj_ptr=>inj_IBG3
      case('IBG3i')
          inj_ptr=>inj_IBG3i
      case('IBG3a')
          inj_ptr=>inj_IBG3a
      case('IBG3s')
          inj_ptr=>inj_IBG3s
      case('IBG22rl')
          inj_ptr=>inj_IBG22rl
      case('IBG22h')
          inj_ptr=>inj_IBG22h
      case('IBG22ra')
          inj_ptr=>inj_IBG22ra
      case('IBG3l')
          inj_ptr=>inj_IBG3l
      case('SVC') 
          inj_ptr=>inj_SVC
   end select

end subroutine assoc_inj_ptr
