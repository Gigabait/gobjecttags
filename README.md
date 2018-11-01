![alt text](https://raw.githubusercontent.com/TibbaRrule/gobjecttags/master/gobjecttagslogo.png)

# gobjecttags
A user-driven solution for tagging players with data. Feel free to use under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/legalcode) [Full Code](https://creativecommons.org/licenses/by-nc/4.0/legalcode)

Similar to a flagging system but limited to strings, entities are given tags. This tag saves to a local SQL database, MySQL webserver or text files in the data folder. When the player joins it loads from these places, and it
has the functionality to look through multiple sets of data if you decide to switch from one to another.

Feature List
- !addtag <user> <flag> and !removetag <user> <flag> to add&remove string tags from people
- Saving to SQL, Text & MySQL (Using [MySQLOO](https://github.com/FredyH/MySQLOO))

Use Case:
- Set someone as VIP without setting them as donator
- Set someone as donator without needing to make a administration usergroup for them.
- Please seperate VIP and Donator away from admin permissions.

Suggestions:
- Let everyone work toward VIP
- Give donator as a bragging rights stick for the server

Implementation:
- You would use these tags as a basis for implementing UI such as scoreboard colors if they have a tag
- You may want to restrict the player based on a faction they chose, allowing you to split the game mode up easily
- You can use this system for entities, you would just have to sort out where to retrieve the data from.

Known Implementation:
- Server Crossover Communication, add a tag; save and send the player to the second server. This allows the second server to know that the player traveled from the previous server
allowing you to do something like "Enter the Tunnel" > Switch Server > "Exit Tunnel". My gamemode allowed you to travel between servers using this tag system as messengers.
- If you need someone to be a VIP without having the donator admin rank you can add a tag and implement into your gamemode/server that whatever you would like to be restricted to VIP's requires
the tag. Vice versa with whatever tag you want.

