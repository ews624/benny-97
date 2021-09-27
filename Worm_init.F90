!! Worm
!! Worm_init(); SUBROUTINE
!! Grab user input and being the game.
subroutine Worm_init()
  
  use mod_playerData, only: player_main
  use mod_gameData,   only: game_status
  implicit none

#include "worm.h"
#include "actions.h"
  
  ! set game_status equal to 0
  ! to indicate the game has just started
  game_status = 0
  
  ! read user input 
  call Worm_readPar()
  ! test for cheating
  call Worm_initCheating()
  ! Initialize class (This subroutine is at 
  ! the bottom of this file)
  call Worm_initClass()
  ! calculate base skills and initial effects
  call Worm_updateSkills(game_status,STARTUP)
  
  player_main%PLAYER_NAME%FULLNAME = &
    TRIM(player_main%PLAYER_NAME%NAME1) //" "// &
    TRIM(player_main%PLAYER_NAME%NAME2) //" "// &
    TRIM(player_main%PLAYER_NAME%NAME3)
  
  print '(A6,1X,A,A1)', "Hello,",TRIM(player_main%PLAYER_NAME%FULLNAME),'.'
  call sleep(SHORT)
  print '(2X,A)', "Welcome to the game, I hope you have"
  print '(2X,A)', "as much fun playing as I do gooning."
  
end subroutine Worm_init

subroutine Worm_initCheating()
  
  use mod_playerData, only: player_main
  
  implicit none
  
#include "worm.h"
  
  integer :: i, TEST_SUM, TEST_MAJOR, TEST_MINOR, TEST_MISC
  
  ! ****************************************************
  ! *       Test for cheating in SPECIAL stats         *
  ! ****************************************************
  TEST_SUM = 0.d0
  do i = 1, NUM_STAT
    TEST_SUM = TEST_SUM + player_main%PLAYER_SPECIAL%SPECIAL(i)
    ! check for stats .gt. 10 along the way (or less than 1)
    if ((player_main%PLAYER_SPECIAL%SPECIAL(i) .gt. 10) .OR. &
        (player_main%PLAYER_SPECIAL%SPECIAL(i) .lt. 1 )      &
       ) then
      print '(A)', "There is an error in your SPECIAL stats."
      print '(A)', "Please correct the error and try again."
      stop
    end if
  end do
  if ((TEST_SUM .GT. 40) .OR. (TEST_SUM .LT. 35)) then
    print '(A)', "There is an error in your SPECIAL stats."
    print '(A)', "Please correct the error and try again."
    stop
  end if
  ! ****************************************************
  ! *            Test for cheating in skills           *
  ! ****************************************************
  TEST_MAJOR = 0.
  TEST_MINOR = 0.
  TEST_MISC  = 0.
  do i = 1, NUM_SKILL
    if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MAJOR") &
      TEST_MAJOR = TEST_MAJOR + 1
    if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MINOR") &
      TEST_MINOR = TEST_MINOR + 1
    if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MISC.") &
      TEST_MISC  = TEST_MISC  + 1
  end do
  if      (TEST_MAJOR .GT. 2) then
    print '(A)', "There is an error in your skills."
    print '(A)', "Error thrown in major skill limit."
    print '(A)', "Please correct the error and try again."
    stop
  else if (TEST_MINOR .GT. 3) then
    print '(A)', "There is an error in your skills."
    print '(A)', "Error thrown in minor skill limit."
    print '(A)', "Please correct the error and try again."
    stop
  else if (TEST_MISC  .GT. 4) then
    print '(A)', "There is an error in your skills."
    print '(A)', "Error thrown in misc. skill limit."
    print '(A)', "Please correct the error and try again."
    stop
  end if
  ! ****************************************************
  ! *              END OF CHEATING TESTS               *
  ! ****************************************************

end subroutine Worm_initCheating

subroutine Worm_initClass()
  use mod_playerData, only: player_main
  use mod_gameData,   only: CLASS_NAME
  implicit none
#include "worm.h"
#include "items.h"
#include "moves.h"
  ! this is to set special flags or items based
  ! on character class.
  integer :: i
  do i = 1, NUM_CLASS
    if (CLASS_NAME(i) .eq. player_main%PLAYER_CLASS%CLASS_NAME) then
      ! assign player class number
      player_main%PLAYER_CLASS%CLASS_NUMBER = i
      ! ****************************************
      ! *       Add Items & Assign Moves       *
      ! *        Based on Player Class         *
      ! ****************************************
      if      (i .eq. JIMMO) then
        player_main%PLAYER_POCKET%POCKET_ID(1) = CARABINER
        player_main%PLAYER_POCKET%POCKET_ID(2) = GLASSES
        player_main%PLAYER_POCKET%POCKET_NAME(1) = 'CARABINER'
        player_main%PLAYER_POCKET%POCKET_NAME(2) = 'GLASSES'
        player_main%PLAYER_MOVES%MOVE_ID(1) = YELL
        player_main%PLAYER_MOVES%MOVE_ID(2) = CUM
        player_main%PLAYER_MOVES%MOVE_NAME(1) = 'YELL'
        player_main%PLAYER_MOVES%MOVE_NAME(2) = 'CUM'
      else if (i .eq. CAMMO) then
      else if (i .eq. ETHAN) then
      else if (i .eq. WINKY) then
      else if (i .eq. BENNY) then
      end if
      
    end if
  end do
  
  
end subroutine Worm_initClass
