CC=g++
#
# Doc build settings
#
DOCDIR = doc

#
# Test build settings
#
TESTDIR = test

#
# Executable build settings
#
CFLAGS = -Wall
SRCDIR = src
INCDIR = include
LIBDIR = lib
BINDIR = bin
EXE = vxlan-agent

#
# Debug build settings
#
DEBUGDIR = debug
DEBUGFLAGS = -g -Wall
DEBUGEXE = $(DEBUGDIR)/$(EXE)

#
# Binary rules
#
exe: $(EXE)

$(EXE): $(wildcard $(BINDIR)/*.o)
	$(CC) $(CFLAGS) -o $(EXE) $^

$(BINDIR)/%.o: $(INCDIR/%.h) $(SRCDIR/%.c)
	$(CC) -c $(CGLAGS) -o $@ $<

#
# Debug build rules
#
debug: $(DEBUGEXE)

$(DEBUGEXE): $(wildcard $(DEBUGDIR)/*.o)
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -o $(DEBUGEXE) $^

$(DEBUGDIR)/%.o: $(INCDIR/%.h) $(SRCDIR/%.c)
	$(CC) -c $(CFLAGS) $(DEBUGFLAGS) -o $@ $<

clean: 
	rm -rf $(BINDIR)/*
	rm -rf $(DEBUGDIR)/*

