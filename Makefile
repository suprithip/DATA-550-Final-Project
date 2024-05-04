#report associated rules (docker container)
report.pdf: Final-Project-Report.Rmd code/04_RenderReport.R table graph_alv graph_pa
	Rscript code/04_RenderReport.R

table:
	Rscript code/01_MakeTable.R
	
graph_alv:
	Rscript code/02_MakeAlvGraph.R
	
graph_pa:
	Rscript code/03_MakePAGraph.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Final-Project-Report.pdf
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
	
#docker associated rules (local machine)
PROJECTFILES= Final-Project-Report.Rmd code/01_MakeTable.R code/02_MakeAlvGraph.R code/03_MakePAGraph.R code/04_RenderReport.R Makefile
RENVFILES= renv.lock renv/activate.R renv/settings.json

#rule to build image
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t data550_finalproject .
	touch $@

#rule to auto build report in container
final_report.pdf:
	docker run -v "$$(pwd)"/report:/final_project/report suprithip/data550_finalproject