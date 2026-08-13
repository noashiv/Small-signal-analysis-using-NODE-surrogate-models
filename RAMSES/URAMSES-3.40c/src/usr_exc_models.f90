subroutine assoc_exciter_ptr(modelname,exc_ptr)

   use MODELING

   implicit none

   character(len=20), intent(in):: modelname
   procedure(exciter), pointer, intent(out) :: exc_ptr
   external exc_ENTSOE_lim
   external exc_AC1A
   external exc_ST1A
   external exc_ST1A_IEEEST
   external exc_AC1A_IEEEST

   select case (modelname)

   case('exc_ENTSOE_lim')
       exc_ptr => exc_ENTSOE_lim
   case('AC1A')
       exc_ptr=>exc_AC1A
   case('ST1A')
       exc_ptr=>exc_ST1A
  case('ST1A_IEEEST')
       exc_ptr=>exc_ST1A_IEEEST
  case('AC1A_IEEEST')
       exc_ptr=>exc_AC1A_IEEEST

   end select

end subroutine assoc_exciter_ptr
