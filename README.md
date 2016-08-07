Childish easy PIM
=================

0.1 MVP - minimum viable product
- Rudimentary single script-based product
   - has 2 files: the script (executable) and a data storage file
   
 - User can run a shell script
   - script checks for existence of data storage file
   - if file exists, 'cat' file and "sort -n"
   - format for data storage file
     - how the date is stored so that sorting is natural, via the
       Unix 'sort' ?
   - location of the DSF can be set within the main cpim.sh script
   - editing of items happens manually, to the Data Storage File

0.2 Tagged tasks: blocks of text
   - change to the DSF storage format
     - fundamentally shifting from a line-by-line to a
       structural format
     - immediate benefits:
       - moving of multiline tasks
       - encapsulation of "non-intelligent" content from
         data headers

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
 1 sprint
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

Free-floating plugin concepts

- plot PPF
  - take the tasks
  - permute execution order
  - calculate what's possible, what's "Good" (optimizer)
  - ppf meaning production possibility frontier (economics term)

-----

Underlying technical components

- calendar
- editing (refreshing) a file, in-place
  - for doing prioritization
    - in cases the simple format is used
    
-----

DSF - The data storage file

DSF exists in the versions of The Software where data is stored
statically in a local file. This is the data storage file. In
0.1 release the file format was simple; a number followed by
<space> followed by a string of text. Thus each line
described a task with a priority number.

-----

The PIM contains an easy interface for daily use.
User can either check the Dashboard one-time via shell, just by
running the cpim, or start interacting with the software
for longer periods of time.

Adding and editing items is possible via command line parameters,
reading lists from ASCII text files,


Future development roadmap
==========================

* 'checkup' plugin 
  Control the progress of your plans
  - requires the categorization (binning) of plans
  - single key, single metric?
  - drill down with another key (or command line switch, accordingly)

* enable recipes for fulfilling tasks. Recipes contain
  intelligence that aids the Win-Holistic Intelligent Priority
  engine (WHIP) giving your sound advice and automating things

* adding server functionality. Currently the cpim is a client-side
  script only. A server brings benefits of roaming (mobile interface
  possible) and sharing schedules / other PIM information
  between multiple persons
  
* mobile device support (once server is set up and running)
  - serves the app as a SPA (single page mobile app)

* GIS support on mobile devices

* once server functionality exists, there is possible:
  - add group optimizations
  - add ridesharing scheduling

* In the future, interaction with Apple's PIM format will be added
  Enables easy integration to iPhone, iPad, Mac and other Apple
  products
