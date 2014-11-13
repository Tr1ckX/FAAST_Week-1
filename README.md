FAAST
=====
Briefing

The Challenge was to design an underground train network.

Expectations:
-------------------
The system must contain trains

Trains travel from station to station

Inside the stations, passengers must be able to alight and board the train

A passenger must 'touch in' and 'touch out' of their station

Each coach maximum capacity is 40 passenger

Each train has a number of coaches (not explicitly fixed)

As a bonus - charging system -> passengers can touch in with more than £2 credit

-----------------------------

#### Class - Oyster

Responsiblities           | Collaborators
---------------           | -------------
Track credit's amount     |           


#### Class - Passenger

Responsiblities 								| Collaborators
--------------- 								| -------------
Buys & topups card              | Oyster
Touches in&out to/from station


#### Class - Coach

Responsiblities 								     | Collaborators
--------------- 								     | -------------
Transport passengers from/to staion  | 


#### Class - Station

Responsiblities                      | Collaborators
---------------                      | -------------
Enter/Exit passenger to/from station | Passenger
Board/Alight passenger to/form coach | Coach
Sends coach to next station       	 |
Deploy coach                         |


