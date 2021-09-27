!! Worm/mod
!! mod_gameData; MODULE
!! game parameters
module mod_gameData
  
  implicit none

#include "../worm.h"

  integer :: game_status
  
  character(12), parameter, dimension(1:NUM_STAT) :: SPECIAL_NAME = &
                                (/"STRENGTH    ",&
                                  "PERCEPTION  ",&
                                  "ENDURANCE   ",&
                                  "CHARISMA    ",&
                                  "INTELLIGENCE",&
                                  "AGILITY     ",&
                                  "LUCK        "/)
  character(10), parameter, dimension(1:NUM_SKILL) :: SKILL_NAME = &
                                (/"EXPLOSIVES",&
                                  "GUNS      ",&
                                  "LOCKPICK  ",&
                                  "MELEE     ",&
                                  "PICKPOCKET",&
                                  "REPAIR    ",&
                                  "SCIENCE   ",&
                                  "SNEAK     ",&
                                  "SPEECH    ",&
                                  "STENCH    ",&
                                  "SURVIVAL  ",&
                                  "WISDOM    "/)
    
  character( 5), parameter, dimension(1:NUM_CLASS) :: CLASS_NAME = &
                                (/"JIMMO",&
                                  "CAMMO",&
                                  "ETHAN",&
                                  "WINKY",&
                                  "BENNY"/)

end module mod_gameData
