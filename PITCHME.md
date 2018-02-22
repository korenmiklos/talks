![CEU MicroData](https://github.com/korenmiklos/talks/raw/pydata/decal.png)

---
## Kik vagyunk?
- A CEU Közgazdaságtan és Üzleti Gazdaságtan Tanszékének kutatócsoportja.
- Vállalati és dolgozói mikroadatokat elemzünk a gazdasági hálózatok és a tudásáramlás megértéséhez.
- 2012 óta. 

---
## Csapat
- Eddig 45 kutató, elemző, diák, fejlesztő fordult meg a MicroDatában.
+++
![](https://github.com/korenmiklos/talks/raw/pydata/team.png)

---
# Projektek
+++
![kozbeszerzes.ceu.hu](https://github.com/korenmiklos/talks/raw/pydata/kozbeszerzes3.png)
+++
![Supplier Survey](https://github.com/korenmiklos/talks/raw/pydata/suppliersurvey.png)


---
# Eszközök
+++
## Kezdetben
- postgres
- /db
- saját orchestration eszköz

+++
## Manapság
- csv
- python: `['pandas', 'petl', 'numpy', 'csvtools / csvkit', 'Bs4' 'matpotlib', 'scikit-learn', 'networkx', 'parsley']` + sok saját fejlesztés
- statisztikai elemzés: Stata, R
- kísérlet: docker, neo4j, spark

---
## Kézműves eszközök
- címparszoló
- magyarnév-parszoló
- cégkereső
- szervezetkereső

+++
## Néhány tipikus cégnév
- `VASI PEGAZUS Személyszállító, Áruszállító és Távközlési Betéti Társaság`
- `Dr. Ecsedi és Társa Háziorvosi Betéti Társaság`
- `SEC Trading Kft.`
- `LUBAVI Korlátolt Felelősségű Tárasaság`
- `PARADISO VENDÉGLÁTÓ Korlátolt Felelősségű Társaság "kényszertörlés alatt"`

+++
## Néhány tipikus szervezetnév
- `Budapest V. Kerület Belváros-lipótváros Önkormányzat Napközi Otthonos Óvoda`
- `Általános Iskola`
- `"Baglyaskő" Idősek Otthona`
- `Halásztelki Bolgár Nemzetiségi Önkormányzat`
- `Általános Iskola És Napköziotthonos Ovoda Közös Igazgatásu Közoktatási Intézmény Dunaszentbenedek`

+++
### `pir_search`
```
ORG_TYPE = any_of(
    group(
        'bolcsode',
        WORD_START + 'bölcsőd[eé]'),
    group(
        'ovoda',
        any_of(
            'napközi ?otthonos óvod[aá]',
            'óvod[aá]')),

    group(
        'altalanosiskola',
        any_of(
            'általános iskol',
            'általános és' + JUNK_WORDS + 'iskol')),...
```
---
# Elérhetőség
- github.com/ceumicrodata
- facebook.com/CEUMicroData
