!! Worm
!! Worm_readPar(); SUBROUTINE
!! Read worm.par
!! https://www.tutorialspoint.com/fortran/fortran_file_input_output.htm
subroutine Worm_readPar

  use mod_playerData, only: player_main

  implicit none

#include "worm.h"

  character(len=100) :: buffer, label
  integer :: pos
  integer, parameter :: fh = 99
  integer :: ios = 0
  integer :: line = 0

  open(fh, file='worm.par')
  
  do while (ios == 0)
    read(fh, '(A)', iostat=ios) buffer
    if (ios == 0) then
      line = line + 1

      ! Find the first instance of whitespace.  Split label and data.
      pos = scan(buffer, '  ')
      label = buffer(1:pos)
      buffer = buffer(pos+1:)
      
      select case (label)
      ! NAME, AGE, CLASS
      case('NAME1')
        read(buffer, *, iostat=ios) player_main%PLAYER_NAME%NAME1
      case('NAME2')
        read(buffer, *, iostat=ios) player_main%PLAYER_NAME%NAME2
      case('NAME3')
        read(buffer, *, iostat=ios) player_main%PLAYER_NAME%NAME3
      case('AGE')
        read(buffer, *, iostat=ios) player_main%AGE
      case('CLASS')
        read(buffer, *, iostat=ios) player_main%PLAYER_CLASS%CLASS_NAME
      ! SPECIAL
      case('S')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(S)
      case('P')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(P)
      case('E')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(E)
      case('C')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(C)
      case('I')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(I)
      case('A')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(A)
      case('L')
        read(buffer, *, iostat=ios) player_main%PLAYER_SPECIAL%SPECIAL(L)
      ! SKILL ATRIB
      case('EXL')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(EXL)
      case('GUN')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(GUN)
      case('LOC')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(LOC)
      case('MEL')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(MEL)
      case('PIC')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(PIC)
      case('REP')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(REP)
      case('SCI')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(SCI)
      case('SNK')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(SNK)
      case('SPE')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(SPE)
      case('STN')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(STN)
      case('SUR')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(SUR)
      case('WIS')
        read(buffer, *, iostat=ios) player_main%PLAYER_SKILL%SKILL_ATRIB(WIS)
      
      end select
    end if
  end do

end subroutine Worm_readPar
