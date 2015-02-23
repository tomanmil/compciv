*Draft Proposal of final project*

My proposed project is about tracking changes in Supreme Court opinions. I will get my data from the SCOTUS-SERVO linked on the Compciv final project page. 

The types of changes that can be made to SCOTUS opinions are either purely procedural – such as typos – or substantive changes such as beefing up the argument here or there with an added sentence. I will analyze the universe of opinion changes – are they purely procedural, non-substantive change – getting the case name wrong, or a substantive change – such as adding an addition sentence or citing an additional case to strengthen the argument or deleting a case that was wrong. 

Are there more substantive changes in the 5-4 versus the unanimous opinion. If it’s a 5-4 opinion and the court was as divided as it can be, at the end you have to make changes to get the justice to sign onto your majority. I will look at the opinions to see whether there’s a pattern to substantive versus non-substantive changes. I’d assume that non-substantive changes would occur no matter what the vote is, because one is always correcting typos. But substantive changes may occur when the court is divided. 
Theory: You can look to the decision and what the vote is. When it’s a 5-4 decision (aka a divided court) you’re most likely to see substantive changes. Thesis: Substantive changes are more likely to occur when the court is divided. 

A different justice will write the court's opinion each time. We can look at the patterns of whether more changes are made to the opinion of a certain justice and whether fewer changes are made to another Justice’s opinion because he’s a meticulous perfectionist. I can look at the divide between substantive and non-substantive changes among the Justices. 

I will look at how many changes get made to a certain Justice’s opinion. Is there any correlation between number of changes and their length of service? Is there any correlation according to years of service? If they’re on the court longer do they get better or sloppier? Is there any correlation between the law schools they attended and how many changes are made to their opinions. Does Harvard train its justices so meticulously that the 

First I’ll look at the majority opinions. 
Thesis: Majority opinions will probably have fewer changes because you have to get all the Justice’s on board because that’s the law of the land. 

Next I will look at the Concurring, Dissenting opinions. 
Thesis: These probably get far more changes than majority opinions because they’re not the law of the land. You’ll get far more changes in the dissenting and concurring opinions. 
You’ll get far more substantive changes in the dissenting and concurring opinions, too. You’ll get more substantive changes probably in the dissenting opinion since Justices feel far more at liberty to change it since it’s not the law. 

Have more made changes been made to the text or the footnote?
Thesis: Changes are far more likely to be substantial in the text than in the footnote. 

When may you expect to see the most changes in opinions? In June before the court adjourns because the Justices are rushing them out the door to be able to adjourn as opposed to if they get an opinion out in January they still have 5 months before they adjourn, so if an opinion is released in January they would probably hold onto it for a few extra days. As the term progresses, you get the most changes. What percentage of all changes come in which months? Is there a correlation?

Next I could look at particular Justices and their opinions over the course of the year. 

General workings include creating a scraper that downloads the pdfs from supremecourt.gov I will want to curl the opinions periodically to see what is being changed. I'll want to curl the splash page, the 2014 opinions page. There's a table so I'll want to curl those individual links in the table since those are the links to the opinions. I could use the command line PDF to text on my archive files to log any changes that I see. As a technical question, I'm going to read up about FarmShare and Cron Jobs to see if I can run Cron Jobs on Corn. I will compare them to the currently existing PDFs from the same files and note any changes. Either I will run the scraper as a Cron job and build a shell script to do that. Otherwise I could do it myself every so often by bashing my shell script. 
