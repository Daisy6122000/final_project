# Generate Report
report.html: code/06_render_report.R report.Rmd output/data_clean.rds output/table_one.rds output/logistic_regression_table.rds output/odds_ratio_table.rds output/barchart.png output/violinplot.png output/histogram.png
	Rscript code/06_render_report.R

# Generating Clean Data
output/data_clean.rds: code/00_clean_data.R raw_data/heart.csv
	Rscript code/00_clean_data.R

# Make Table1	
output/table_one.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

# Make Regression Table
output/logistic_regression_table.rds: code/02_models.R output/data_clean.rds
	Rscript code/02_models.R

# Make OR Table
output/odds_ratio_table.rds: code/02_models.R output/data_clean.rds
	Rscript code/02_models.R

# Make Barchart	
output/barchart.png: code/03_bar_chart.R output/data_clean.rds
	Rscript code/03_bar_chart.R

# Make Violin Plot
output/violinplot.png: code/04_violin_plot.R output/data_clean.rds
	Rscript code/04_violin_plot.R

# Make Histogram
output/histogram.png: code/05_histogram.R output/data_clean.rds
	Rscript code/05_histogram.R
	
# clean output files
.PHONY: clean 
clean: 
	rm -f output/*.rds && rm -f output/*.png && rm -f report.html

# Sync Packages
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
	
	
# Docker rules
PROJECTFILES = report.Rmd code/00_clean_data.R code/01_make_table1.R code/02_models.R code/03_bar_chart.R code/04_violin_plot.R code/05_histogram.R code/06_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# Building an image
docker_image: $(PROJECTFILES) $(RENVFILES) Dockerfile
	docker build -t final_project .
	touch $@

# Running a container
final_report/report.html:
	docker run -v "/$$(pwd)"/final_report:/project/final_report final_project || docker run -v "$$(pwd)"/final_report:/project/final_report daisy612/final_project
