
report.html: code/06_render_report.R report.Rmd output/data_clean.rds output/table_one.rds output/logistic_regression_table.rds output/odds_ratio_table.rds output/barchart.png output/violinplot.png output/histogram.png
	Rscript code/06_render_report.R

output/data_clean.rds: code/00_clean_data.R raw_data/heart.csv
	Rscript code/00_clean_data.R
	
output/table_one.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

output/logistic_regression_table.rds: code/02_models.R output/data_clean.rds
	Rscript code/02_models.R
	
output/odds_ratio_table.rds: code/02_models.R output/data_clean.rds
	Rscript code/02_models.R
	
output/barchart.png: code/03_bar_chart.R output/data_clean.rds
	Rscript code/03_bar_chart.R

output/violinplot.png: code/04_violin_plot.R output/data_clean.rds
	Rscript code/04_violin_plot.R

output/histogram.png: code/05_histogram.R output/data_clean.rds
	Rscript code/05_histogram.R
	

.PHONY: clean 
clean: 
	rm -f output/*.rds && rm -f output/*.png && rm -f report.html