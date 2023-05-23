# Scottish-Cyber-Education

Scottish Cyber Security Education statistics

This Rmarkdown produces a statistical report in storyboard format based on a variety of open data sources, and is designed to be reproducible but not automatic.  The data changes once a year and often involves minor format changes.

TODO:

- correct the build process - it's best to build on a local machine and upload the resulting html because it's compute intensive to set up the required R environment.  Currently I'm deleting index.html from the gh-pages branch and uploading the new one, but github also appears to be running an action that tries to build a Jekyll site from the main branch.  Uploading the html to docs/ in main and writing an action to copy that over would be better.

- code rationalisation to make it easier to change later, like defining functions to reduce repetition

- it may be possible to derive a useful plot from the Scottish Funding Council College Statistics reporting, although the format of their Excel workbook varies so much from year to year that it would be a bit painful to do.

- we can generate a heat map for where qualifications are delivered as long as the education provider is part of the data in a way where we can get the locations or there is data for where they are within mappable bounds like local authorities, but not all web hosts will put them up.  If this is desired, need to look at why and where might be possible if this is desired.

-


