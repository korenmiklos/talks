# Források és szerkesztési jegyzetek

## Felépítés

12 fólia a címoldallal együtt, 15 percre. A munkakörnyezet és a nyitókérdés fóliáján szándékosan nincs exhibit. A koncentráció-közelség rész és a modellméret-példák kimaradtak.

A forrás a README.md. Fordítás ebben a könyvtárban: make. A közös megjelenést a repozitórium preamble-slides.tex fájlja adja. Az idővonal szerkeszthető TikZ-forrása a figures/stata-timeline.tex.

## Költségábra

Az eredeti kép változtatás nélkül, a 2026-10-16-mlbkt/img/price-of-intelligence.png fájlból. A fólián a LaTeX a diagramot mutatja nagyítva, a hosszú eredeti cím és módszertani lábjegyzet nélkül. A forrásmegjelölés látható marad, a módszertani korlátok itt szerepelnek.

- Korábbi előadás: https://github.com/korenmiklos/talks/blob/master/2026-10-16-mlbkt/slides30.pdf
- Luke Emberson és David Roodman (2026. szeptember 22.), The plunging price of thought: https://epoch.ai/publications/the-plunging-price-of-thought

Azonos benchmark-teljesítmény inferenciaköltsége. Nem a kész szoftver teljes fejlesztési költsége. A benchmarkok nem fedik le a hasznos munkát teljes egészében.

## Stata és Pandas

Az eredeti HTML kódösszehasonlításának böngészőből rögzített képe, újraszedés nélkül. A kivágás a két oszlopot és fejlécüket tartalmazza, a régi főcímet nem.

- Eredeti: https://cdn.thnk.ng/html/JuliaCon2024/#what-is-stata
- Dátum: 2024. július 12., JuliaCon, Eindhoven
- Szerzők a fóliákon: Koren Miklós, Kiss Gergely Attila

A régi példa a szintaxis tömörségét szemlélteti. A két regressziós sor nem azonos standardhiba-korrekciót használ: Stata robust és statsmodels HC3. A Pandas-példa sortörése sem futtatható változtatás nélkül. Az eredeti screenshotot a kérésnek megfelelően megőriztük, ne futtatható vagy numerikusan azonos implementációk tesztjeként használd.

## Nyelvhasználat

A 2024-07-12-juliacon/figures/languages.svg ábrája változtatás nélkül. A PDF ugyanennek a vektoros konverziója.

Ez oszlopdiagram, nem idősor. Csomagszámokat mutat, nem mai felhasználói részesedést. A saját adatállomány (data/gh-list.csv) nincs verziókezelés alatt, így a 80%-ot ebből a repóból nem lehet ellenőrizni. Ezért a fólián nem szerepel százalékos állítás. A forrásprogram: 2024-07-12-juliacon/src/github.jl.

## Idővonal

Négy esemény, két párosított íves nyíllal.

| Esemény | Dátum | Forrás |
| --- | --- | --- |
| Joel Spolsky Unicode-blogposztja | 2003. október 8. | https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/ |
| Unicode-támogatás a Stata 14-ben | 2015. április 7. | https://blog.stata.com/2015/04/07/stata-14-announced-ships/ |
| Parquet 1.0 első kiadása | 2013. július | https://www.loc.gov/preservation/digital/formats/fdd/fdd000575.shtml |
| StataNow natív Parquet-import | 2025. november 13. | https://blog.stata.com/2025/11/13/a-new-update-to-statanow-has-just-been-released-2/ |

A nyilak 11,5 és 12 évet mutatnak kerekítve. A blogposzt dátuma nem a Unicode megjelenése. A Parquet első kiadása nem a tömeges elterjedés dátuma. A két példa a késői átvételt szemlélteti, nem minden Stata-funkcióra vonatkozó általános 12 éves becslés.

## A kézi adatátadás példája

Az előadó saját, anonim szerkesztői tapasztalata: egy Stata-eredményt kézzel írtak át MATLAB-ba. A 3,17 illusztratív, emlékezetből idézett szám. Nem azonosítottunk cikket vagy szerzőt, és a példa nem becslés a hibák gyakoriságára.

## Open source

Koren, M., Békés, G., Hinz, J., és Lohmann, A. (2026), Vibe Coding Kills Open Source, v2.

- https://koren.mk/publications/vibe-coding
- https://doi.org/10.5281/zenodo.19374601

Az AI-közvetítés a modellben gyengítheti a fenntartók felhasználói kapcsolaton alapuló megtérülését. A csak ilyen módon monetizált környezetben visszaszorulhat a belépés és megosztás. A kevés megmaradó programnyelv vagy a Stata eróziója külön előrejelzés.

## Dodo

- https://getdodo.dev/
- DTA: Stata .dta olvasása és írása DuckDB-ből.
- Dodo: készülő .do-futtatási irány.
- A Studio és az új interfész konkrét terve nem szerepel.

## Hátralévő szerkesztés

1. Saját Stata / RStudio screenshot a munkakörnyezet fóliájára.
2. A további küldött források és exhibitek beillesztése.
3. A zárófólia finomítása az előadó hangsúlyai szerint.
4. Ha kell százalék: a 2024-es nyelvhasználati minta nevezőjének visszakeresése.
