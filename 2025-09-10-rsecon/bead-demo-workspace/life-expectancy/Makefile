.PHONY: all clean

all: output/life_expectancy.csv

output/life_expectancy.csv:
	mkdir -p output
	@echo "Creating sample life expectancy data..."
	@echo "Country,Year,Life_expectancy" > output/life_expectancy.csv
	@echo "United States,2019,78.8" >> output/life_expectancy.csv
	@echo "United States,2020,77.0" >> output/life_expectancy.csv
	@echo "United States,2021,76.3" >> output/life_expectancy.csv
	@echo "Germany,2019,81.3" >> output/life_expectancy.csv
	@echo "Germany,2020,81.0" >> output/life_expectancy.csv
	@echo "Germany,2021,81.3" >> output/life_expectancy.csv
	@echo "United Kingdom,2019,81.3" >> output/life_expectancy.csv
	@echo "United Kingdom,2020,81.0" >> output/life_expectancy.csv
	@echo "United Kingdom,2021,81.3" >> output/life_expectancy.csv
	@echo "China,2019,76.9" >> output/life_expectancy.csv
	@echo "China,2020,77.0" >> output/life_expectancy.csv
	@echo "China,2021,77.1" >> output/life_expectancy.csv
	@echo "India,2019,69.7" >> output/life_expectancy.csv
	@echo "India,2020,69.0" >> output/life_expectancy.csv
	@echo "India,2021,69.7" >> output/life_expectancy.csv
	@echo "World,2019,72.6" >> output/life_expectancy.csv
	@echo "World,2020,71.0" >> output/life_expectancy.csv
	@echo "World,2021,71.0" >> output/life_expectancy.csv
	@echo "Data saved to output/life_expectancy.csv"

clean:
	rm -f output/life_expectancy.csv