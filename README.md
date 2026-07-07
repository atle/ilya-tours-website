# Ilya Tours & Safaris — website

En enkel, responsiv one-page nettside for Ilya Tours & Safaris (Tanga,
Tanzania), bygget i [Jekyll](https://jekyllrb.com/) for hosting på
[GitHub Pages](https://pages.github.com/).

## Innhold på siden

- **Hero** — bakgrunnsbilde, tagline og to knapper (se turer / kontakt)
- **About** — kort tekst om selskapet, hentet fra den gamle siden
- **Tours** — 5 eksempelturer (safari, Kilimanjaro, Usambara, strand,
  kultur/Maasai), styrt fra [`_data/tours.yml`](_data/tours.yml)
- **Why Us** — fire korte fordeler
- **Contact** — telefon, WhatsApp, e-post og Google Maps-embed (ingen
  skjema, siden GitHub Pages ikke har noe backend)

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

Raskeste vei, uten Bundler (unngår kjente versjonskonflikter mellom det
gamle `github-pages`-gemmet og nyere Ruby-versjoner):

```bash
gem install --user-install jekyll
jekyll serve
```

Åpne <http://localhost:4000> i nettleseren. Siden oppdateres automatisk
når du lagrer endringer.

`Gemfile` med `github-pages`-gemmet ligger fortsatt i repoet fordi
GitHub sin egen build-server bruker den til å garantere at siden bygges
med nøyaktig samme Jekyll-versjon som er live på GitHub Pages. Du
trenger den kun lokalt hvis du selv kjører `bundle exec jekyll serve`
— og da må Ruby-versjonen din matche det github-pages forventer (rundt
Ruby 2.7-3.x). Med nyere Ruby (3.4+/4.x) må du i så fall også legge til
`gem "csv"` og `gem "bigdecimal"` i Gemfilen, siden de er fjernet fra
standardbiblioteket.

## Publisere på GitHub Pages

1. Opprett et nytt repo på GitHub (f.eks. `ilya-tours-website`).
2. Push denne mappen til repoet:
   ```bash
   git init
   git add .
   git commit -m "Initial website"
   git branch -M main
   git remote add origin https://github.com/<brukernavn>/<repo>.git
   git push -u origin main
   ```
3. Gå til repoets **Settings → Pages**, velg branch `main` og mappe
   `/ (root)`, lagre.
4. GitHub bygger og publiserer siden automatisk (tar ofte 1-2 minutter).

### Eget domene (ilyatours.com)

Filen [`CNAME`](CNAME) i repoet er allerede satt til `ilyatours.com`,
så GitHub vet at siden skal peke mot det domenet. For at det skal
fungere må dere i tillegg gjøre dette hos domeneleverandøren (der
`ilyatours.com` er registrert):

- Legg til en **A-record** for roten (`@`) som peker til GitHub Pages'
  IP-adresser:
  ```
  185.199.108.153
  185.199.109.153
  185.199.110.153
  185.199.111.153
  ```
- (Valgfritt) Legg til en **CNAME-record** for `www` som peker til
  `<brukernavn>.github.io`.
- I repoets **Settings → Pages**, kryss av for **Enforce HTTPS** når
  GitHub har verifisert domenet (kan ta litt tid etter DNS-endringen).

## Ting dere bør sjekke/fylle inn selv

- **E-post og telefonnumre** i `_config.yml` er hentet fra den gamle
  siden (David Kimea, Managing Director) — bytt ut om dere ønsker en
  annen hovedkontakt.
- **Facebook-lenke** er ikke lagt inn (fantes ikke en direkte URL på
  den gamle siden) — legg gjerne til en lenke i `_includes/footer.html`
  om dere har en Facebook-side.
- Bildene er lave i oppløsning (780×200 px, hentet fra det gamle
  bildekarusell-elementet) og fungerer greit som kort-bilder, men vil
  se noe uskarpe ut i full bredde på store skjermer. Bytt gjerne ut
  med bilder i høyere oppløsning når dere har dem tilgjengelig.
