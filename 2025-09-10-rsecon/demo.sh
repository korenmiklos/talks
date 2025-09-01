## ⚡ Inspiration
#:- Data Journalism
#:- Human concept of story
#:  - Characters, setting, events, theme or message
#:  - Variable scope
#:  - Stories are composable
#:  - Helps us to make sense of the world

## 📐 Design
#:- ISBN / ISSN
#:  - Identification of books and series with code
#:- Task scope
#:- Local first
#:- Integrity

## 🎬 Demo
#:Conference session classification by title
#:
#:Inputs:
#:
#:- list of sessions
#:- session theme classification rules
#:
#:Output:
#:
#: - list of sessions extended with theme

## ⚙️ Workspace and Box
: workspace - where we work
mkdir /demo/workspace
cd /demo/workspace
: box - storage for beads
bead box list
mkdir /demo/bead-box
bead box add demo /demo/bead-box
bead box list

## 📁 Output: Plain data
bead new sessions
## Workspace {.top}
#:- name (*sessions*)
#:  - input
#:  - output
#:  - temp
#:
cd sessions
cat > output/sessions.csv <<EOF
title,speaker
Advances in Artificial Intelligence,Alice
Blockchain Basics,Bob
Sustainability in Business,Charlie
Future of Quantum Computing,Diane
Data Privacy and Security,Eric
Machine Learning 101,Fiona
AI Ethics and Impact,Grace
Green Tech Innovations,Henry
Distributed Ledger Technologies,Ian
Effective Team Communication,Julia
EOF
bead save
bead discard
cd ..
: quick look into the created archive
unzip -v /demo/bead-box/sessions_*.zip | tail -9
unzip -p /demo/bead-box/sessions_*.zip data/* | csvlook -
bead new theme-aliases
cd theme-aliases
cat > output/theme_aliases.csv <<EOF
alias,canonical_theme
artificial intelligence,artificial intelligence
machine learning,artificial intelligence
ai,artificial intelligence
blockchain,blockchain
distributed ledger,blockchain
sustainability,sustainability
green tech,sustainability
quantum computing,quantum computing
data privacy,data privacy
privacy,data privacy
EOF
bead save
bead discard
cd ..
## 🛠 Calculation 1: CSV to DuckDB
bead new sessions-db
cd sessions-db
bead input add sessions
bead input add theme-aliases
cat > run.sh <<EOF
duckdb output/sessions.db "
-- Load sessions
CREATE TABLE sessions AS
SELECT * FROM read_csv_auto('input/sessions/sessions.csv');

-- Load aliases
CREATE TABLE theme_aliases AS
SELECT * FROM read_csv_auto('input/theme-aliases/theme_aliases.csv');
"
EOF
bash run.sh
bead save
bead discard
cd ..
unzip -v /demo/bead-box/sessions-db_*.zip | tail -9
unzip -p /demo/bead-box/sessions-db_*.zip code/run.sh

## 🔗 Calculation 2: Match Themes
bead new sessions-by-themes
cd sessions-by-themes
bead input add sessions-db
cat > run.sh <<EOF
duckdb -readonly input/sessions-db/sessions.db "
COPY (
  SELECT
    s.title,
    s.speaker,
    LIST(DISTINCT a.canonical_theme) AS matched_themes
  FROM sessions s
  LEFT JOIN theme_aliases a
    ON LOWER(s.title) LIKE '%' || LOWER(a.alias) || '%'
  GROUP BY s.title, s.speaker
  ORDER BY s.speaker
) TO 'output/sessions_with_themes.csv' (HEADER, DELIMITER ',');
"
EOF
bash run.sh
bead save
csvlook output/sessions_with_themes.csv
bead discard
cd ..

## ✨ Versions: Inputs and Improvements
: Create a new, supposedly improved version of
: the theme-aliases bead. For now it will be
: just an unchanged clone, with a later save date
bead edit theme-aliases --review
cd theme-aliases
bead save
bead discard
cd ..
: Use the "improved" input to "recalculate" a dependent
bead edit sessions-db
cd sessions-db
cat run.sh
bead input load
bead input update theme-aliases
bash run.sh
bead save
bead discard
cd ..

# 🖼️ Visual Overview
rm /demo/bead-box/theme-aliases*
bead box index rebuild /demo/bead-box
bead web color png session-themes.png

#
#:![session-themes.png](images/session-themes.png)

# ⚙️ Internal Details
unzip -p /demo/bead-box/sessions-by-themes_*.zip meta/bead
unzip -p /demo/bead-box/sessions-by-themes_*.zip meta/manifest


# 🧩 Similar ideas

#:- kaggle notebook
#:   - https://www.kaggle.com/code#:~:text=New,-Notebook
#:- nix flake
#:   - https://nixos.wiki/wiki/Flakes#Flake_schema
#:- orderly2 (RSECON24 talk)
#:   - https://youtu.be/lkPgihFQbrk


# 🐙 Source
#:<style>
#:#qrgithub {
#:  position: absolute;
#:  top: 0;
#:  right: 50%;
#:}
#:</style>
#:https://github.com/e3krisztian/bead {{< qrcode https://github.com/e3krisztian/bead qrgithub width=300 height=300 >}}
