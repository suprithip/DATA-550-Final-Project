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
	rm -f output/*.rds && rm -f report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"