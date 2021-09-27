# #GFORTRAN LINUX DISTRIBUTION - UBUNTU ###
FC = gfortran
FFLAGS = -m64 -fdefault-real-8 
# #FFLAGS = -m64 -O3 -fdefault-real-8 -fbounds-check # -fcheck=all
# TARGET_ARCH =
LDFLAGS = -m64
# LIBS = 

##################
EXE   = worm
VPATH = mod

.SUFFIXES:      
.SUFFIXES: .F90 .o

GRAFIC_HEADER =

SRCMOD =											\
					mod_classes.F90			\
          mod_gameData.F90		\
					mod_playerData.F90	\

SRCMAIN =													\
					Worm.F90								\
					Worm_chapter1.F90				\
					Worm_init.F90						\
					Worm_readPar.F90				\
          Worm_updateSkills.F90		\



OBJMAIN = ${SRCMAIN:.F90=.o}

OBJMOD = ${SRCMOD:.F90=.o}

OBJ = $(OBJMOD) $(OBJMAIN)

$(EXE): $(OBJ)
	$(FC) $(LDFLAGS) $(OBJ) $(LIBS) -o $(EXE)

%.o  : %.F90 
	$(FC) $(FFLAGS) -c $<

# Define dependencies for modules
$(OBJMAIN): $(OBJMOD)



