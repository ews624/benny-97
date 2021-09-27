!! Worm
!! Worm_updateSkills(game_status,player_action) ; SUBROUTINE
!! Updates player skills based on
!! SPECIAL stats and other information.
subroutine Worm_updateSkills(current_status,player_action)
  
  use mod_playerData, only: player_main
  use mod_gameData,   only: CLASS_NAME
  implicit none

#include "worm.h"
#include "actions.h"
  
  integer, intent(in) :: current_status, player_action
  
  integer :: i
  
  ! game_status
  !   This integer will dictate where
  !   the player is in the game.
  !     A value of '0' means that they
  !     have just started.
  ! 
  ! There will be intermediate steps to indicate
  ! temporary effects based on choices.
  if ((current_status .eq. 0) .and. &
      (player_action .eq. STARTUP)) then
    ! BASE SKILL = 2 + (2 x STAT) + (L/2)
    ! Explosives
    player_main%PLAYER_SKILL%SKILL(EXL) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(S)) + & 
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Guns
    player_main%PLAYER_SKILL%SKILL(GUN) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(P)) + & 
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Lockpick
    player_main%PLAYER_SKILL%SKILL(LOC) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(I)) + & 
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! MELEE
    player_main%PLAYER_SKILL%SKILL(MEL) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(S)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Pickpocket
    player_main%PLAYER_SKILL%SKILL(PIC) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(A)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Repair
    player_main%PLAYER_SKILL%SKILL(REP) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(P)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Science
    player_main%PLAYER_SKILL%SKILL(SCI) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(I)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Sneak
    player_main%PLAYER_SKILL%SKILL(SNK) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(A)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Speech
    player_main%PLAYER_SKILL%SKILL(SPE) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(C)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Stench
    player_main%PLAYER_SKILL%SKILL(STN) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(E)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Survival
    player_main%PLAYER_SKILL%SKILL(SUR) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(E)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! Wisdom
    player_main%PLAYER_SKILL%SKILL(WIS) = 2 + &
      (2*player_main%PLAYER_SPECIAL%SPECIAL(I)) + &
      (player_main%PLAYER_SPECIAL%SPECIAL(L)/2)
    ! ****************************************
    ! *            Apply Bonuses             *
    ! *       Based on Skill Attibute        *
    ! ****************************************
    do i = 1, NUM_SKILL
      if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MAJOR") &
        player_main%PLAYER_SKILL%SKILL(i) = player_main%PLAYER_SKILL%SKILL(i) +15
      if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MINOR") &
        player_main%PLAYER_SKILL%SKILL(i) = player_main%PLAYER_SKILL%SKILL(i) +10
      if (player_main%PLAYER_SKILL%SKILL_ATRIB(i) .eq. "MISC.") &
        player_main%PLAYER_SKILL%SKILL(i) = player_main%PLAYER_SKILL%SKILL(i) + 5
    end do
    ! ****************************************
    ! *            Apply Bonuses             *
    ! *        Based on Player Class         *
    ! ****************************************
    do i = 1, NUM_CLASS
      if (CLASS_NAME(i) .eq. player_main%PLAYER_CLASS%CLASS_NAME) then
        if      (i .eq. JIMMO) then
          ! BONUS FOR JIMMO
          player_main%PLAYER_SKILL%SKILL(SUR) = & 
            player_main%PLAYER_SKILL%SKILL(SUR) + 5
          player_main%PLAYER_SKILL%SKILL(GUN) = &
            player_main%PLAYER_SKILL%SKILL(GUN) +10
        else if (i .eq. CAMMO) then
          ! 
        else if (i .eq. ETHAN) then
          ! 
        else if (i .eq. WINKY) then
          ! 
        else if (i .eq. BENNY) then
          !
        end if
      end if
    end do
    ! ****************************************
    ! *  Set the Temp Arrays Equal           *
    ! *                 to the Original      *
    ! ****************************************
    player_main%PLAYER_SPECIAL%SPECIAL_MOD = player_main%PLAYER_SPECIAL%SPECIAL
    player_main%PLAYER_SKILL%SKILL_MOD = player_main%PLAYER_SKILL%SKILL
    
  end if  ! game_status = 0 & STARTUP


end subroutine Worm_updateSkills
