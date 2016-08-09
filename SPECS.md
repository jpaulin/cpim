Childish easy PIM -- SPECS.md
=============================

The SPECS file

Note:
 - the Development Roadmap section is kept in README.md

This file contains the details, and complements README.md in being
the 'Missing manual for developers'. As the README.md keeps things
short and FAQ -like for general audience, SPECS.md explicitly tells
the story behind new terminology and implementation details for
each version of the software.

0.1 MVP - minimum viable product
    Not much to tell about this early version. When it got pushed
    to Github, the cpim.sh was 105 lines of bash script

0.2 Tagged tasks: support multiline items in Data Storage File
   - change to the DSF storage format
   - we need to thoroughly think the format
   - a 'cat | sort -n' piping will not do the trick
     - instead have code to handle the items
     - bring internally the supporting functions to add, remove, edit
       contents of an item
       - this is kind of forward-looking investment since we'll
         be using the format in future versions
     - generally the design should consider 'sorting' as a algorithm
       that can work based on a priority key
       - execution group, raw manual priority level, etc.
     
0.3 WIP: Not yet thoroughly planned
  - interactive mode introduced to The Software
    => now user can issue keyboard commands and work more efficiently
    - before interactive mode, the only way to run The Software 
      was a non-interactive shell execution.
    - interactive has 3 main operations
      d - show dashboard
      t - show tasks view 
      c - show calendar 

0.4 WIP   
  + adding calendar functionality: browse by week
  - from NOW, enable showing what is the date
    1 calendar week ago
    N calendar weeks ago
    - the same, but into future
    What date will it be 1 calendar week from NOW
    What date will it be N calendar weeks from NOW
    
  - calculate the amount of whole calendar weeks between
    two points in time

2.0 Major:
  - 'search' plugin introduced
    - "The world is a supermarket of things that are available
       through information search costs."
    - searching is a static scraping + API support for getting
      more information regarding tasks
      - helps estimate better
      - information consumed by User, no programmatic intelligence
        yet

-----

Underlying technical components

- calendar [not yet implemented, relying on just 'ncal' tool]

- editing (refreshing) a file, in-place [WIP]
  - for doing prioritization
    - in cases the simple format is used
    
-----

DSF - The data storage file

DSF exists in the versions of The Software where data is stored
statically in a local file. This is the data storage file. In
0.1 release the file format was simple; a number followed by
<space> followed by a string of text. Thus each line
described a task with a priority number.
