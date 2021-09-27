!! Worm/mod
!! mod_classes; mod_classes
!! OOP setup
module mod_classes
  
  implicit none
  
#include "../worm.h"
  
  ! set up object for stats
  type :: character_stat
          ! normal special stats
          integer, dimension(1:NUM_STAT) :: SPECIAL
          ! array for temporary modifications
          integer, dimension(1:NUM_STAT) :: SPECIAL_MOD
  end type
  
  ! set up object for skills
  type :: character_skill
          ! normal skills
          integer, dimension(1:NUM_SKILL) :: SKILL
          ! array to modify for special affects
          integer, dimension(1:NUM_SKILL) :: SKILL_MOD
          ! player skill attributes, i.e. MAJOR or MINOR
          character(5), dimension(1:NUM_SKILL) :: SKILL_ATRIB
  end type
  
  ! set up object for name
  type :: character_name
          character(DFLT) :: NAME1, NAME2, NAME3, &
                             FULLNAME
  end type
  
  ! set up object for class
  type :: character_class
          integer :: CLASS_NUMBER
          character(5) :: CLASS_NAME
  end type
  
  ! set up objects for containers
  type :: pocket
          integer,         dimension( 2) :: POCKET_ID
          character(DFLT), dimension( 2) :: POCKET_NAME
  end type
  type :: backpack
          integer,         dimension(10) :: BACKPACK_ID
          character(DFLT), dimension( 2) :: BACKPACK_NAME
  end type
  
  ! set up object for moves
  type :: moves
          integer,         dimension(2) :: MOVE_ID
          character(DFLT), dimension(2) :: MOVE_NAME
  end type
    
  ! set up object for a character
  type :: character_object
          ! player age
          integer :: AGE
          ! player class
          type(character_class) :: PLAYER_CLASS
          ! player name
          type(character_name) :: PLAYER_NAME
          ! player stats and skills
          type(character_stat ) :: PLAYER_SPECIAL
          type(character_skill) :: PLAYER_SKILL
          ! inventory
          type(pocket)   :: PLAYER_POCKET
          type(backpack) :: PLAYER_BACKPACK
          ! special moves
          type(moves) :: PLAYER_MOVES
  end type
  
end module mod_classes
