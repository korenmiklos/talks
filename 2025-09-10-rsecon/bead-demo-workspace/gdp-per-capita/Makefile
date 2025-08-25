.PHONY: all clean

all: output/gdp_per_capita.csv

output/gdp_per_capita.csv:
	mkdir -p output
	@echo "Creating sample GDP per capita data..."
	@echo "Country,Year,GDP_per_capita_USD" > output/gdp_per_capita.csv
	@echo "United States,2019,65094.8" >> output/gdp_per_capita.csv
	@echo "United States,2020,63027.7" >> output/gdp_per_capita.csv
	@echo "United States,2021,69287.5" >> output/gdp_per_capita.csv
	@echo "Germany,2019,46258.9" >> output/gdp_per_capita.csv
	@echo "Germany,2020,45723.6" >> output/gdp_per_capita.csv
	@echo "Germany,2021,50801.8" >> output/gdp_per_capita.csv
	@echo "United Kingdom,2019,42354.4" >> output/gdp_per_capita.csv
	@echo "United Kingdom,2020,40284.6" >> output/gdp_per_capita.csv
	@echo "United Kingdom,2021,47334.4" >> output/gdp_per_capita.csv
	@echo "China,2019,10143.8" >> output/gdp_per_capita.csv
	@echo "China,2020,10434.8" >> output/gdp_per_capita.csv
	@echo "China,2021,12556.3" >> output/gdp_per_capita.csv
	@echo "India,2019,2100.8" >> output/gdp_per_capita.csv
	@echo "India,2020,1913.1" >> output/gdp_per_capita.csv
	@echo "India,2021,2256.6" >> output/gdp_per_capita.csv
	@echo "World,2019,11435.0" >> output/gdp_per_capita.csv
	@echo "World,2020,10925.7" >> output/gdp_per_capita.csv
	@echo "World,2021,12236.6" >> output/gdp_per_capita.csv
	@echo "Data saved to output/gdp_per_capita.csv"

clean:
	rm -f output/gdp_per_capita.csv