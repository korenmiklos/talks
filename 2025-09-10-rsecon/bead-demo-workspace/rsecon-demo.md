# bead: A Data Provenance Tool for Diverse Teams

**RSECon 2025 Workshop**  
Event: https://virtual.oxfordabstracts.com/event/75166/submission/39

## What is bead?

`bead` is a lightweight tool for managing data dependencies and ensuring reproducibility in computational research. It packages data with its processing code and metadata into self-contained units called "beads" that can be shared and reused across projects.

## Installation

### Prerequisites
- Python 3.6 or higher
- pip

### Install bead

```bash
pip install bead
```

For more installation options, visit: https://bead.zip/install

## Pre-Workshop Setup

1. **Install bead** following the instructions above
2. **Create a workspace folder** for the demo
3. **Download the workshop materials** from https://bead.zip/RSECon

## Workshop Demo Instructions

### Part 1: Setting Up Your Bead Box

A bead box is a repository where beads are stored and shared.

```bash
# Create a new bead box for storing our beads
bead box create demo-box ./bead-box
```

### Part 2: Using Pre-made Data Beads

For this workshop, we've prepared two data beads:
- `life-expectancy`: Life expectancy data from Our World in Data
- `gdp-per-capita`: GDP per capita from World Bank

Download these beads from https://bead.zip/RSECon and place them in your bead box folder.

### Part 3: Creating an Analysis Bead

Now we'll create a new bead that combines these datasets to analyze the relationship between GDP and life expectancy.

```bash
# Create a new bead for our analysis
bead new figure1
cd figure1

# Add the data beads as inputs
bead input add life-expectancy
bead input add gdp-per-capita
```

### Part 4: Writing Analysis Code

Create a simple analysis script using DuckDB SQL:

```bash
cat > analyze.sql << 'EOF'
-- Join life expectancy and GDP data
SELECT 
    l.Entity as Country,
    l.Year,
    l."Life expectancy" as Life_Expectancy,
    g.GDP_per_capita_USD
FROM 
    read_csv_auto('input/life-expectancy/life_expectancy.csv') l
JOIN 
    read_csv_auto('input/gdp-per-capita/gdp_per_capita.csv') g
ON 
    l.Entity = g.Country 
    AND l.Year = g.Year
WHERE 
    l.Year = 2021
ORDER BY 
    g.GDP_per_capita_USD DESC;
EOF
```

For a simple ASCII visualization, we can use DuckDB's bar chart:

```bash
cat > visualize.sql << 'EOF'
-- Create ASCII bar chart of GDP vs Life Expectancy
SELECT 
    Country,
    bar(Life_Expectancy, 0, 100, 30) as Life_Exp_Chart,
    printf('%.0f years', Life_Expectancy) as Life_Exp,
    printf('$%.0f', GDP_per_capita_USD) as GDP_per_Capita
FROM (
    SELECT 
        l.Entity as Country,
        l."Life expectancy" as Life_Expectancy,
        g.GDP_per_capita_USD
    FROM 
        read_csv_auto('input/life-expectancy/life_expectancy.csv') l
    JOIN 
        read_csv_auto('input/gdp-per-capita/gdp_per_capita.csv') g
    ON l.Entity = g.Country AND l.Year = g.Year
    WHERE l.Year = 2021
    ORDER BY g.GDP_per_capita_USD DESC
    LIMIT 10
);
EOF
```

### Part 5: Saving Your Analysis Bead

```bash
# Save the bead with all inputs and code
bead save

# Check what's inside the bead
ls -la
# You'll see:
# - input/ (linked data from other beads)  
# - output/ (your results)
# - Your analysis scripts
# - .bead-meta/ (metadata and provenance)
```

### Part 6: Updating Data Dependencies

Now imagine the data curator has updated the life expectancy data with 2022 values:

```bash
# In a real scenario, someone would update the life-expectancy bead
bead develop -x life-expectancy
cd life-expectancy

# Make changes to the data (add 2022 data)
echo "World,2022,71.3" >> output/life_expectancy.csv

# Save the updated bead
bead save
cd ..
```

Back in our analysis bead:

```bash
cd figure1

# Update to the latest version of life-expectancy
bead input update life-expectancy

# Re-run analysis with updated data
duckdb < analyze.sql > output/results.csv

# Save the updated analysis
bead save
```

### Part 7: Understanding Bead Benefits

When you use `bead save`, the tool:
- Records exact versions of all input data
- Captures your code and environment
- Creates a self-contained, shareable package
- Maintains complete provenance chain

When you `bead zap`:
- Removes the workspace but keeps the bead
- Can recreate exact environment later with `bead develop`

## Key Concepts

1. **Beads are immutable**: Once saved, a bead's contents don't change
2. **Inputs are tracked**: Every bead knows exactly which version of data it used
3. **Reproducible by design**: Anyone can recreate your exact analysis
4. **Lightweight**: Only stores references to input beads, not copies

## Common Commands Reference

```bash
bead new <name>           # Create a new bead
bead input add <bead>     # Add an input dependency
bead input update <bead>  # Update to latest version
bead save                 # Save current state as a bead
bead develop <bead>       # Open a bead for editing
bead zap                  # Clean up workspace (keeps bead)
bead box list            # List available bead boxes
```

## Resources

- Documentation: https://bead.zip
- GitHub: https://github.com/e3krisztian/bead
- Workshop materials: https://bead.zip/RSECon

## Contact

For questions during the workshop, please ask the instructors or post in the workshop chat.