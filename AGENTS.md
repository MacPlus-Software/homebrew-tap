# homebrew-tap — для агентов

Два разных места, не путать:

| Что | Где | Кто меняет |
|---|---|---|
| Наш tap | `MacPlus-Software/homebrew-tap`, `Casks/*.rb` | сессии выпуска (шаг в скилле `vypusk`) и эта сессия |
| Официальный Homebrew | `Homebrew/homebrew-cask`, PR из форка `gerasimsergey/homebrew-cask` | только по «делать» Сергея, один PR за раз |

Статус, очередь подачи и решения — [MAC-1158](https://linear.app/macplus/issue/MAC-1158). Выбор приложений — [MAC-1124](https://linear.app/macplus/issue/MAC-1124).

## Наш tap

- Все каски `sha256 :no_check`: адреса архивов без версии (`…/downloads/<Имя>.zip`), приложение обновляется через Sparkle.
- При выпуске меняется только `version`. Каск ищется по имени ленты: `grep -l '<Имя ленты, пробел как %20>.xml' Casks/*.rb`.
  Ловушка: Tab Finder 2 — лента `Tab%20Finder%202.xml`, а `Tab Finder.xml` отдаёт старую первую версию.
- В `main` только через PR из своей ветки; сессия вливает сама; `--delete-branch` никогда.
- Сверка: `curl -s "https://macplus-software.com/downloads/<Имя>.xml" | grep -oE 'shortVersionString(="|>)[^"<]+' | head -1` против `version` в каске.

## Официальный Homebrew/homebrew-cask

Уже там: `tree-outliner`, `activedock`, `command-tab-plus`, `dockview` (DockView 2). Версии поднимает бот Homebrew (BrewTestBot) по `livecheck` — руками не бампать.

### Порядок подачи нового каска

1. Есть «делать» Сергея (напрямую или цитатой с датой от штаба A). Открытых наших PR в homebrew-cask нет: `gh pr list -R Homebrew/homebrew-cask --author gerasimsergey`.
2. Токен — имя `.app` без номера версии, строчными через дефис (`Tab Finder 2.app` → `tab-finder`). Проверить, что токен свободен: `curl -s https://formulae.brew.sh/api/cask.json | jq -r '.[].token' | grep -x <token>`.
3. Каск по образцу принятых (`tree-outliner`, `dockview`): `version`, `sha256 :no_check`, `url`, `name`, `desc` (коротко, без названия приложения и рекламы), `homepage`, `livecheck` Sparkle `&:short_version`, `auto_updates true`, `depends_on macos:` по `minimumSystemVersion` ленты, `app`, `zap trash:`.
4. `zap` — только пути, найденные `brew generate-zap` после установки и запуска. Пользовательские документы (`~/Documents/…`) не включать.
5. Работать в локальном tap, а не в отдельном клоне — иначе `audit --new` и install не видят каск:
   `brew tap --force homebrew/cask`, затем в `$(brew --repository homebrew/cask)` — `git remote add fork https://github.com/gerasimsergey/homebrew-cask.git`, ветка `<token>` от `origin/main`, каск в `Casks/<первая буква>/<token>.rb`, push в `fork`.
   Проверки на Маке:
   - `brew style --fix <token>`
   - `brew audit --cask --online --new <token>`
   - `brew livecheck --cask <token>`
   - `HOMEBREW_NO_INSTALL_FROM_API=1 brew install --cask --appdir=<временная папка> <token>` — не в `/Applications`, чтобы не тронуть установленную копию Сергея
   - `brew uninstall --cask <token>`
   - **`brew uninstall --zap` не запускать никогда** — сносит данные пользователя. Gatekeeper не обходить.
6. Один коммит `<token> <версия> (new cask)`, автор — Сергей (git user `gerasimsergey`). **Без** строки `Co-Authored-By`: мейнтейнер bevanjkay просил убрать её в #298846.
7. PR по шаблону homebrew-cask; галочки только за реально выполненное. Абзац о помощи агента обязателен:
   «I'm the developer of <App>. An AI assistant drafted the cask and ran audit/style/install/uninstall on my Mac; I reviewed the cask, including the zap paths.»
8. На вопросы мейнтейнеров отвечает **Сергей сам, без AI** — это требование Homebrew. Агент может дать смысл ответа, текст пишет он.
9. Влит — комментарий в MAC-1158 и одна строка штабу A. Следующий каск — только после этого.

### Почему так

- [Responsible AI Usage](https://docs.brew.sh/Responsible-AI-Usage): коммит только от AI отклоняют; AI-помощь раскрывается в описании PR; не-мейнтейнер держит один открытый AI-PR.
- [Acceptable Casks](https://docs.brew.sh/Acceptable-Casks): только стабильные версии; приложение подписано и нотаризовано; для нового каска — известность (notability). Формулировкой её не поднять, поэтому описание короткое и сухое.
- [Cask Cookbook, Token reference](https://docs.brew.sh/Cask-Cookbook#token-reference): номер версии из токена убирают; новая основная линейка идёт без суффикса.
