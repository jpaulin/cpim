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
   - a change to the simple DSF storage format
   - we need to thoroughly think the format
   - proposal:
      1. Keep all lines nevertheless conformant to BASE64
         (readable ASCII)
	 Specs generally at
	 [Base64 Wikipedia](https://en.wikipedia.org/wiki/Base64)
      2. Group lines of tasks using a suitably long hash
         6 bits per character
	 If 64K tasks are desired as maximum number, and we want
	 to support up to 64-line tasks, then 4 characters would
	 suffice as hash length.
	 Group id : 3*6 = 18 bits
	 Line  id : 6 bits (2^6 = 64)
	 	 
   - a 'cat | sort -n' piping will not do the trick
     - instead have code to handle the items
     - bring internally the supporting functions to add, remove, edit
       contents of an item
       - this is kind of forward-looking investment since we'll
         be using the format in future versions
     - generally the design should consider 'sorting' as a algorithm
       that can work based on a priority key
       - execution group, raw manual priority level, etc.
   
0.2 General format for lines: three fields

[flags] | 4charHash | <Payload>
- flags account for
  - due Date field
  - priority number
- using '|' as field separator
- with max line length = 78, <Payload> gets approximately max. 66 chars
- example:

- extension can be thought out via linking
  - where the [flags] field, instead of containing raw data, would contain
    a link ID to the data
    - data would reside either in the same DSF file, or in another file

---

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
