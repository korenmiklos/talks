---?image=https://github.com/korenmiklos/talks/raw/pydata/decal.png&size=auto

---
## Kik vagyunk?
- A CEU Közgazdaságtan és Üzleti Gazdaságtan Tanszékének kutatócsoportja.
- Vállalati és dolgozói mikroadatokat elemzünk a gazdasági hálózatok és a tudásáramlás megértéséhez.
- 2012 óta. 

---
## Csapat
- Eddig 45 kutató, elemző, diák, fejlesztő fordult meg a MicroDatában.
+++?image=https://github.com/korenmiklos/talks/raw/pydata/team.png&size=auto

---
# Projektek
+++?image=https://github.com/korenmiklos/talks/raw/pydata/kozbeszerzes3.png&size=auto
+++?image=https://github.com/korenmiklos/talks/raw/pydata/suppliersurvey.png&size=auto


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

+++
## Kézműves eszközök
- címparszoló
- magyarnév-parszoló
- cégkereső
- szervezetkereső

---
## Cégkereső

+++
## Néhány tipikus cégnév
- VASI PEGAZUS Személyszállító, Áruszállító és Távközlési Betéti Társaság
- Dr. Ecsedi és Társa Háziorvosi Betéti Társaság
- SEC Trading Kft.
- LUBAVI Korlátolt Felelősségű Tárasaság
- PARADISO VENDÉGLÁTÓ Korlátolt Felelősségű Társaság "kényszertörlés alatt"

+++
### Cégforma
```
_KFT = T('korlátolt felelősségű társaság') + T('kft')
_BT = T('betéti társaság') + T('bt')
_KHT = T('közhasznú társaság') + T('kht')
_KKT = T('közkereseti társaság') + T('kkt')
_VEGREHAJTO = T('végrehajtó iroda') + T('végrehajtói iroda') + T('vh iroda')
_KOZJEGYZO = T('közjegyző iroda') + T('közjegyzői iroda')
_VGT = T('vízgazdálkodási társulat') + T('vgt')
```

+++
### Az első betűk fontosabbak
```
for i in range(1, len(name_parts) + 1):
        head = ''.join(name_parts[:i])
        yield head
        if len(head) >= MAX_HEAD_LENGTH:
            break
```

---
## Szervezetkereső

+++
## Néhány tipikus szervezetnév
- Budapest V. Kerület Belváros-lipótváros Önkormányzat Napközi Otthonos Óvoda
- Általános Iskola
- "Baglyaskő" Idősek Otthona
- Halásztelki Bolgár Nemzetiségi Önkormányzat
- Általános Iskola És Napköziotthonos Ovoda Közös Igazgatásu Közoktatási Intézmény Dunaszentbenedek

+++
### Szervezettípusok
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

+++
### Települések
```
    # spectacular and important exceptions
    _map_variant(u'egri', u'eger')
    # as of 2015 udvar/udvari is the only collision
    # work around it by adding 'udvari' by hand
    _map_variant(u'udvari', u'udvari')

    for s in settlements:
        _map_variant(s, s)
        normalized = simplify_accents(s.lower())
        _map_variant(normalized, s)
        _map_variant(normalized + u'i', s)
        _map_variant(_replacetail(normalized, u'háza', u'házi'), s)
        _map_variant(_replacetail(normalized, u'halom', u'halmi'), s)
        _map_variant(_replacetail(normalized, u'falva', u'falvi'), s)
```


---
# Elérhetőség
- github.com/ceumicrodata
- facebook.com/CEUMicroData
