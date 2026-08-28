# Words — Frontend

Angular SSR client for **Words**, a vocabulary-learning app. This repo is the **frontend half** of the Words project — it talks to the microservices backend in the companion [Words-Backend](https://github.com/DanilProggg/Words-Backend) repo over its `/api/v1/*` gateway.

## What it does

- **Preview** — a landing/entry screen shown at the root route.
- **Dictionary** module, with its own sub-routes:
  - **List** — browse the signed-in user's saved words.
  - **Add** — add a new word (translation, transcription, notes) to the dictionary.
  - **Learn** — the spaced-learning flow: fetches the next word due for review from the backend and lets the user grade their recall, which updates the word's knowledge level server-side.
  - **Repeat** — a review/drill pass over already-seen words.
- A shared navbar component scoped to the dictionary module for switching between list/add/learn/repeat.

## Tech stack

- Angular 19, standalone components, lazy-loaded feature routes
- Angular Universal SSR (`@angular/ssr`) with an Express server (`src/server.ts`) for server-rendered pages
- RxJS, SCSS
- Karma/Jasmine for unit tests

## Running locally

A `docker-compose.yml` and `Dockerfile` are provided (the source repo ships without one): a Node 20 build stage runs `npm ci && npm run build`, then the SSR server is started with `node dist/words/server/server.mjs`.

```bash
docker compose up --build
```

The app is served on `:4000`. It expects the Words backend gateway (`Words-Backend`, port `8090`) to be reachable as its API origin.
