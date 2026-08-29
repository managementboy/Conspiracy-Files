# ADR-0001 — Lua-first modular monolith

**Status:** Accepted

## Context
Conspiracy-Files needs deep PZ integration but many capabilities are still unproven. Introducing Java/ZombieBuddy as the default would add distribution and maintenance cost before need is demonstrated.

## Decision
Use a Lua-first modular monolith. The domain core is PZ-free plain Lua 5.1. PZ APIs/events are isolated behind integration adapters. A narrow Java/ZombieBuddy bridge may be introduced only for missing API access, measured performance problems, or persistence/data-processing complexity.

## Consequences
- Domain logic can be unit-tested outside PZ.
- We can replace an integration mechanism without rewriting story/evidence rules.
- Spikes, not preference, decide whether Java becomes necessary.
