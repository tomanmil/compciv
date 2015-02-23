####*Draft Proposal of final project*

My proposed project is tracking changes in Supreme Court opinions. I will get my data from the SCOTUS-SERVO linked on the Compciv final project page and from supremecourt.gov. 

####What can be analyzed:
The types of changes that can be made to SCOTUS opinions can be broken down into either purely procedural changes or substantive changes. I will analyze the universe of opinion changes: are they procedural, non-substantive changes – such as typos or getting the case name wrong – or a substantive change – such as adding an additional sentence or citing an additional case to strengthen the argument or deleting a case that was wrong. 

Theory: Substantive changes are more likely to occur when the court is divided. You can look to the decision and what the vote is. When it’s a 5-4 decision (aka a divided court) you’re most likely to see substantive changes. 
Questions: Are there more substantive changes in the 5-4 versus the unanimous opinions. If it’s a 5-4 opinion and the court was extremely divided, at the end the may need to make changes to get the justice to sign onto their majority. I will look at the opinions to see whether there’s a pattern to substantive versus non-substantive changes. I’d assume that non-substantive changes would occur no matter what the vote is, because one is always correcting typos. But substantive changes may tend to occur more when the court is divided.

Next I could look at particular Justices and their opinions over the course of the year. Different justices write the court's opinion for each case. I can look at the divide between substantive and non-substantive changes among the Justices. I will look at how many changes get made to a certain Justice’s opinion and look at the patterns that emerge: whether more changes are made to the opinions of certain justices and whether fewer changes are made to a particular Justice’s opinion (perhaps because he’s a meticulous perfectionist). Is there any correlation between number of changes and their years of service? If they’re on the court longer do they get better or sloppier? Is there any correlation between the law schools they attended and how many changes are made to their opinions? 

I’ll look at the majority opinions. 
*Thesis*: Majority opinions will probably have fewer changes because you have to get all the Justice’s on board because that’s the law of the land. 

Next I will look at the Concurring, Dissenting opinions. 
*Thesis*: These probably get far more changes in the dissenting and concurring opinons than in majority opinions because they’re not the law of the land Justices may feel far more at liberty to make modifications. 

Have more made changes been made to the text of the opinions or in the footnotes?
*Thesis*: Changes are far more likely to be substantial in the text than in the footnote. 

When may you expect to see the most changes in opinions? I would think in June before the court adjourns because the Justices are rushing opinions out the door to be able to adjourn. Compare this to an opinion out in January when they still have 5 months before they adjourn. If an opinion is released in January they would probably hold onto it for a few extra days. What percentage of all changes come in which months? Is there a correlation?

General workings of my program include creating a scraper that downloads the pdfs from supremecourt.gov I will want to curl the opinions periodically to see what is being changed. I'll want to curl the splash page, the 2014 opinions page. There's a table so I'll want to curl those individual links in the table since those are the links to the opinions. I could use the command line PDF to text on my archive files to log any changes that I see. As a technical question, I'm going to read up about FarmShare and Cron Jobs to see if I can run Cron Jobs on Corn. I will compare them to the currently existing PDFs from the same files and note any changes. Either I will run the scraper as a Cron job and build a shell script to do that. Otherwise I could do it myself every so often by bashing my shell script. 
