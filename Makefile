         CXX       = g++ 
		 AR        = ar rv
		 STDFLAGS  = -Wall -c
override FLAGS    := $(STDFLAGS) $(FLAGS)
override CXXFLAGS := $(FLAGS) $(CXXFLAGS)
override CFLAGS   := $(FLAGS) $(CFLAGS)
         SOURCE    = sleepy_discord
         INCLUDE   = include/sleepy_discord include/sleepy_discord/IncludeNonexistent deps/include
         TARGET    = libsleepy_discord
		 SUFFIX    = .a
		 OUTPUT    = $(TARGET)$(SUFFIX)

all: ${TARGET}.o ar

$(TARGET).o: 
	$(CXX) $(CXXFLAGS) $(SOURCE)/*.cpp $(SOURCE)/json.c $(foreach dir, $(INCLUDE), -I $(dir))
	@# > for some compilers
	@# no bud its called specifying the source file you fucking idiot
ar:
	$(AR) $(OUTPUT) *.o
	$(RM) *.o

