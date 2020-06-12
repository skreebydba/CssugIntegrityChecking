# CssugIntegrityChecking
### Scripts and slides for CSSUG Integrity Checking Presentation
This repository contains two Jupyter notebooks:
* IntegrityCheckingIndex - contains steps for creating three databases to demonstrate the effect of the PAGE_VERIFY setting and DBCC CHECKDB repair options on a corrupted index column
* IntegrityCheckingNonIndex - contains steps for creating three databases to demonstrate the effect of the PAGE_VERIFY setting and DBCC CHECKDB repair options on a corrupted nonindex column

## **NOTE - DBCC WRITEPAGE CHANGES A DATA PAGE, CORRUPTING THAT PAGE.  TO QUOTE PAUL RANDAL, "Any problem, corruption, damage, or loss you cause by using the information presented here is entirely your own responsibility. Use at your own risk. Danger of death."**
## **TO PUT IT ANOTHER WAY, UNDER NO CIRCUMSTANCES SHOULD THIS CODE BE USED ON ANYTHING RESEMBLING A PRODUCTION SYSTEM, OR ANY OTHER SYSTEM YOU CARE ABOUT IN ANY WAY.  EVEN PLATONICALLY.**
