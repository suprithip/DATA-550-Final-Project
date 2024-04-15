
# DATA 550 Final Project Repository
This repository holds the files to create a report based on the Resgensburg Pediatric Appendicitis dataset. 

------------------------------------------------------------------------

## Table of Contents
- [Description](#description)
- [File Structure](#file-structure)
- [How to Generate the Final Report](#how-to-generate-the-final-report)

------------------------------------------------------------------------

## Description
This data set contains information about children who were admitted to Children’s Hospital St. Hedwig in Regensburg, Germany, between 2016 and 2021 with abdominal pain and suspected appendicitis. The report compares the sensitivities of the Alvarado Score and Pediatric Appendicitis (PA) Score in correctly predicting an appendicitis diagnosis and how the severity of diagnosis can impact the score.

------------------------------------------------------------------------

## File Structure

Below is a brief explanation of the file structure and code location

- `app_data.xlsx`: MS Excel file containing tabular data on variables collected from all cases on the first tab (labelled 'All cases') and code book listing variable details, such as the names, descriptions, and outcome type, on the second tab (labelled 'Data Summary')

- `code/`: This folder contains the individual R scripts to generate the tables and figures for the report. [01_MakeTable.R](code/01_MakeTable.R) generates the table showing the overall sensitivities for the two scoring methods. [02_MakeAlvGraph.R](code/02_MakeAlvGraph.R) and [03_MakePAGraph.R](code/03_MakePAGraph.R) show how severity of confirmed appendicitis varies within the Alvarado and PA Score respectively. [04_RenderReport.R](code/04_RenderReport.R) renders the final report.

- `output/`: This folder contains saved `.rds` files of the figures and tables generated by the code that are imported into the final report.

- `Final-Project-Report.Rmd`: R markdown document used to show the report as a pdf.

- `Makefile`: Defines the set of tasks to be executed to generate the report.

------------------------------------------------------------------------

## How to Generate the Final Report

1. Clone the online repository to your local repository. Set the current working directory to the newly downloaded repository and check to ensure all contents are present.
2. Ensure all required packages are installed by `make install` in the terminal window of R studio.
3. Execute the Makefile by running the command `make report.pdf` in the terminal window of R studio.
4. Review the final report named `Final-Project-Report.pdf` in the local repository to see the analysis findings.
5. If you wish to make changes to the code or report, create and checkout a new branch and add all new commits and pushes along this branch. Submit a pull request if you wish to request for the original repository to incorporate these changes. Note: Request may be denied.
