# Ilya Tours & Safaris — website

En enkel, responsiv one-page nettside for Ilya Tours & Safaris (Tanga,
Tanzania), bygget i [Jekyll](https://jekyllrb.com/). Siden bygges lokalt
til statisk HTML og lastes opp til det eksisterende webhotellet
(proisp.no) via FTP/SFTP — se [Publisere til webhotellet](#publisere-til-webhotellet)
under. Dette GitHub-repoet brukes til versjonskontroll/backup av
kildekoden, ikke til selve hostingen.

## Innhold på siden

- **Hero** — bakgrunnsbilde, tagline og to knapper (se turer / kontakt)
- **About** — kort tekst om selskapet, hentet fra den gamle siden
- **Tours** — 5 eksempelturer (safari, Kilimanjaro, Usambara, strand,
  kultur/Maasai), styrt fra [`_data/tours.yml`](_data/tours.yml)
- **Why Us** — fire korte fordeler
- **Contact** — telefon, e-post og Google Maps-embed (ingen skjema,
  siden det ikke er noen server å sende det til)

Bilder er hentet fra den gamle websiden (ilyatours.com) og ligger i
[`assets/images/`](assets/images). Logoen er den samme
(`assets/images/logo.png`). Filene som starter med `extra-` (hyene,
kystlandsby, teltleir på Kilimanjaro) er ekstra reservebilder som ikke
brukes i layouten ennå, i tilfelle dere vil bytte ut et av kortene.

## Rediger innhold

- **Tekst i seksjonene:** [`index.html`](index.html)
- **Eksempelturer:** [`_data/tours.yml`](_data/tours.yml) — legg til,
  fjern eller endre turer her uten å røre HTML
- **Kontaktinfo, firmanavn:** [`_config.yml`](_config.yml) under `company:`
- **Farger/design:** [`assets/css/style.css`](assets/css/style.css),
  fargene ligger som CSS-variabler øverst i filen

## Se siden lokalt før du publiserer

```bash
gem install --user-install jekyll
jekyll serve
```

Eller bruk `.claude/run-jekyll.sh`, som i tillegg setter opp riktig
PATH for Jekyll-installasjonen på denne maskinen (se
[build.sh](build.sh) for samme oppsett brukt til selve bygget).

Åpne <http://localhost:4000> i nettleseren. Siden oppdateres automatisk
når du lagrer endringer.

## Publisere til webhotellet

Siden hostes på det eksisterende webhotellet hos proisp.no (der
e-posten `@ilyatours.com` også ligger) — ikke på GitHub Pages.

1. Bygg siden lokalt:
   ```bash
   ./build.sh
   ```
   Dette genererer en `_site/`-mappe med ferdig statisk HTML/CSS/bilder.
2. Koble til webhotellet med FTP/SFTP (eller SSH + `rsync` om
   tilgjengelig) og last opp **innholdet** i `_site/` (ikke selve
   `_site`-mappen) til rot-mappen der nettsiden skal ligge
   (`public_html` e.l.).
3. Siden den gamle siden er bygget med et helt annet system (TYPO3,
   med mapper som `typo3/`, `typo3conf/` osv.), bør de gamle filene
   slettes fra webhotellet først — ellers kan de bli liggende igjen og
   skape rot.
4. DNS for `ilyatours.com` trenger ingen endring — den peker allerede
   dit den skal.
5. HTTPS/Let's Encrypt-sertifikatet håndteres av proisp.no sitt eget
   kontrollpanel, akkurat som for den gamle siden.

Gjenta steg 1–2 hver gang dere gjør innholdsendringer.

### GitHub-repoet

Brukes kun til versjonskontroll/backup av kildekoden — `git add`,
`git commit`, `git push` som normalt. GitHub Pages er ikke i bruk.

## Ting dere bør sjekke/fylle inn selv

- **Facebook-lenke** er ikke lagt inn (fantes ikke en direkte URL på
  den gamle siden) — legg gjerne til en lenke i `_includes/footer.html`
  om dere har en Facebook-side.
- Bildene er lave i oppløsning (780×200 px, hentet fra det gamle
  bildekarusell-elementet) og fungerer greit som kort-bilder, men vil
  se noe uskarpe ut i full bredde på store skjermer. Bytt gjerne ut
  med bilder i høyere oppløsning når dere har dem tilgjengelig.
