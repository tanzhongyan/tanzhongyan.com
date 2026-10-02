<!-- AUTO-GENERATED MANAGED BLOCK — edit AGENTS.md instead -->
<!-- RULES-START -->

# ghost — Agent Invariants

> Bootstrapped from central `docs/workflow/`. Universal rules; repo-specific values below. Canonical reference: `docs/workflow/AGENTS.md` (sibling store) — this file stays self-sufficient.

## 0. Start lean

- Read this file alone. Load one file per trigger; never front-load.
- No code without a linked plan. Spec → plan → code.
- Memory recall (central docs sibling present): `search_docs` task keywords → `get_doc` top hits before planning. No MCP in your harness? `cd ../docs && python personal-memory/sync-memory.py --dry-run`, grep `INDEX.md`, follow `related:` links.

### Triage override over Skills (binding)

`triage.mjs` verdicts outrank skill defaults, including Superpowers planning skills:

| Triage verdict | Skill behavior |
|---|---|
| `plan-gate` fast-lane (trivial change — skip plan-gate/SDD) | Skip all planning ceremony |
| `plan-gate` exit 0 (`proceed-bounded`) | Implement directly; DO NOT invoke brainstorming/writing-plans |
| `plan-gate` exit 6 (`write-spec-first`, architectural) | Invoke planning skills before code |

### Bimodal workflow

- **Fast Lane** — trivial changes (≤1 file: typo, single-line config, comment/link fix): edit → verify → done, no SDD.
- **Lean Lane** — exit 0: implement + verify directly, no brainstorming or written plan.
- **Architectural Lane** — exit 6: full spec → plan → code with planning skills.

## 1. Triggers

| Trigger | Load |
|---|---|
| Failure / pain-point match | `.agents/LESSONS.md` |
| New file/class/schema, reuse lookup | `.agents/CONTEXT.md` |
| Unfamiliar API, version bump, unknown signature | Official docs first — never guess signatures |

## 2. Execute

- Map callers + callees before editing; reuse `CONTEXT.md` registry; max 3–5 files per turn.
- Docs-first is a hard block: unverified API → fetch official docs before opening code; re-verify patch against reference before slow builds.
- Main session holds plan + roadmap; one fresh subagent per task with a verbatim brief; reports `DONE` / `DONE_WITH_CONCERNS` / `NEEDS_CONTEXT` / `BLOCKED`.
- Unattended ("gone", "autonomous", "overnight"): proceed, isolate failures, batch true blockers (secrets, spend, frontier escalation) into one report.
- Triage via `node ../docs/triage.mjs` (`classify` after commands, `docs-gate` before unverified APIs). Missing keys → auto-bypass to procedural; never blocked on setup.

## 3. Anti-slop

No pass-through wrappers, `v2`/`legacy` shims, zombie code, or hardcoded business limits (typed config; fail boot on missing keys). Validate untrusted input at boundaries. Current docs describe current design; history lives in git.

## 4. Gates (`docker compose config`)

Typecheck, lint, tests, config validation — all green before commit/claim. Fix in pipeline order.

## 5. Architecture & Operations

- **Stack**: Ghost CMS (`:2368`), MySQL database, Caddy reverse proxy (`:80`/`:443`), optional Tinybird analytics (`--profile=analytics`) & ActivityPub (`--profile=activitypub`).
- **Configuration**: Driven by `.env`. Ghost config format: `section__subsection__key=value`. Data persistent in `./data/ghost` and `./data/mysql`.
- **Validation**: `docker compose config` before changes; `docker compose up -d` to run.

## 6. Learn

One row per new failure into `.agents/LESSONS.md` before closing. Plans high-level in `docs/plans/`; execution detail in `docs/specs/`.

<!-- RULES-END -->
