# bead Demo Script - RSECon 2025

## Step 1: Setup - Creating a Bead Box

First, we need a place to store our beads:

```bash
$ bead box create demo-box ./bead-box
Created box demo-box at /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box
```

## Step 2: Download Pre-made Data Beads

For this demo, we have two data beads ready:
- `life-expectancy_20250825T180056272512+0200.zip` 
- `gdp-per-capita_20250825T180149624424+0200.zip`

Place these in your bead-box folder.

```bash
$ ls -la bead-box/
total 512
drwxr-xr-x@ 6 koren  staff     192 Aug 25 18:01 .
drwxr-xr-x@ 6 koren  staff     192 Aug 25 18:01 ..
-rw-r--r--@ 1 koren  staff    2728 Aug 25 18:01 gdp-per-capita_20250825T180149624424+0200.zip
-rw-r--r--@ 1 koren  staff  124829 Aug 25 18:00 life-expectancy_20250825T180056272512+0200.zip
```

## Step 3: Create a New Analysis Bead

Now let's create a bead that will use these datasets:

```bash
$ bead new figure1
Created "figure1"

$ cd figure1
```

## Step 4: Add Input Dependencies

```bash
$ bead input add gdp-per-capita
Verifying archive /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/gdp-per-capita_20250825T180149624424+0200.zip ... OK
Loading new data to gdp-per-capita ... Done

$ bead input add life-expectancy
Verifying archive /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/life-expectancy_20250825T180056272512+0200.zip ... OK
Loading new data to life-expectancy ... Done
```

## Step 5: Explore the Workspace Structure

```bash
$ ls -la
total 8
drwxr-xr-x@ 7 koren  staff  224 Aug 25 18:03 .
drwxr-xr-x@ 7 koren  staff  224 Aug 25 18:03 ..
drwxr-xr-x@ 4 koren  staff  128 Aug 25 18:03 .bead-meta
dr-xr-xr-x@ 4 koren  staff  128 Aug 25 18:03 input
drwxr-xr-x@ 3 koren  staff   96 Aug 25 18:03 output
drwxr-xr-x@ 2 koren  staff   64 Aug 25 18:03 temp
```

Notice the `input/` folder is read-only - bead protects your inputs from accidental modification!

## Step 6: Create Analysis Code

We'll use DuckDB SQL to analyze the relationship between GDP and life expectancy:

```bash
$ cat > analyze.sql << 'EOF'
-- Simple ASCII visualization of GDP vs Life Expectancy relationship
WITH data AS (
    SELECT 
        'USA' as country, 69287.5 as gdp_pc, 76.3 as life_exp
    UNION ALL SELECT 'Germany', 50801.8, 81.3
    UNION ALL SELECT 'UK', 47334.4, 81.3
    UNION ALL SELECT 'China', 12556.3, 77.1
    UNION ALL SELECT 'World', 12236.6, 71.0
    UNION ALL SELECT 'India', 2256.6, 69.7
)
SELECT 
    printf('%-10s', country) as Country,
    printf('$%7.0f', gdp_pc) as "GDP/capita",
    printf('%4.1f', life_exp) as "Life Exp",
    bar(life_exp, 60, 85, 25) as "Life Expectancy Chart"
FROM data
ORDER BY gdp_pc DESC;
EOF
```

## Step 7: Run the Analysis

```bash
$ duckdb < analyze.sql
┌────────────┬────────────┬──────────┬───────────────────────────┐
│  Country   │ GDP/capita │ Life Exp │   Life Expectancy Chart   │
│  varchar   │  varchar   │ varchar  │          varchar          │
├────────────┼────────────┼──────────┼───────────────────────────┤
│ USA        │ $  69288   │ 76.3     │ ████████████████▎         │
│ Germany    │ $  50802   │ 81.3     │ █████████████████████▎    │
│ UK         │ $  47334   │ 81.3     │ █████████████████████▎    │
│ China      │ $  12556   │ 77.1     │ █████████████████         │
│ World      │ $  12237   │ 71.0     │ ███████████               │
│ India      │ $   2257   │ 69.7     │ █████████▋                │
└────────────┴────────────┴──────────┴───────────────────────────┘
```

## Step 8: Save Results and Create Bead

```bash
$ mkdir -p output
$ duckdb < analyze.sql > output/figure1.txt

$ bead save demo-box
Successfully stored bead at /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/figure1_20250825T180346055076+0200.zip.
```

## Step 9: Update Data (Editor Request Scenario)

Now imagine the data curator updates the life expectancy data with 2022-2023 values:

```bash
$ cd ..
$ bead develop -x life-expectancy
Verifying archive ... OK
Extracted source into /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/life-expectancy

$ cd life-expectancy
$ echo "World,2022,71.3" >> output/life_expectancy.csv
$ echo "World,2023,71.5" >> output/life_expectancy.csv

$ bead save demo-box
Successfully stored bead at /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/life-expectancy_20250825T180416025424+0200.zip.
```

## Step 10: Clean Up Workspace (bead zap)

The `bead zap` command removes the workspace but preserves the bead:

```bash
$ bead zap
Deleted workspace /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/life-expectancy

$ cd ..
$ ls
bead-box/    figure1/    gdp-per-capita/    rsecon-demo.md
```

Notice the `life-expectancy` folder is gone, but the bead is still in the box!

## Step 11: Update Analysis with New Data

```bash
$ cd figure1
$ bead input update life-expectancy
Verifying archive /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/life-expectancy_20250825T180416025424+0200.zip ... OK
Removing current data from life-expectancy
Loading new data to life-expectancy ... Done
```

## Step 12: Re-run Analysis and Save

```bash
$ duckdb < analyze.sql > output/figure1.txt
$ bead save demo-box
Successfully stored bead at /Users/koren/Tresorit/Mac/teaching/talks/2025-09-10-rsecon/bead-demo-workspace/bead-box/figure1_20250825T180443082049+0200.zip.
```

## Key Takeaways

1. **Beads are immutable**: Each save creates a new version with a timestamp
2. **Inputs are tracked**: The `.bead-meta/` folder tracks exact versions of all inputs
3. **Reproducible**: Anyone can recreate your exact analysis from a bead
4. **Safe cleanup**: `bead zap` removes workspace but keeps the bead
5. **Easy updates**: `bead input update` pulls in the latest version of dependencies

## Checking What's in the Box

```bash
$ ls -la bead-box/
total 768
drwxr-xr-x@ 8 koren  staff     256 Aug 25 18:04 .
drwxr-xr-x@ 6 koren  staff     192 Aug 25 18:04 ..
-rw-r--r--@ 1 koren  staff    2728 Aug 25 18:01 gdp-per-capita_20250825T180149624424+0200.zip
-rw-r--r--@ 1 koren  staff  124829 Aug 25 18:00 life-expectancy_20250825T180056272512+0200.zip
-rw-r--r--@ 1 koren  staff  125831 Aug 25 18:04 life-expectancy_20250825T180416025424+0200.zip
-rw-r--r--@ 1 koren  staff    3754 Aug 25 18:03 figure1_20250825T180346055076+0200.zip
-rw-r--r--@ 1 koren  staff    3754 Aug 25 18:04 figure1_20250825T180443082049+0200.zip
```

Each timestamped file is an immutable snapshot of your work!