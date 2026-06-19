---
type: system
title: Architecture
tags: [architecture]
created:
modified:
---

# Architecture

The overarching shape of the product as a built system. One per product, at the product root as `Architecture.md`. When the detail outgrows a single file, expand into an optional `Arch/` folder and keep this doc as the map that points into it.

This doc is suggestive, not prescriptive. The sections below are recommended. Keep what serves the product, drop what does not yet apply, add what is missing.

> Delete this guidance block and the italic prompts as you fill the doc in.

## Shape

_The system in one breath: the major pieces and how they fit. A paragraph or a simple sketch. Enough that a newcomer can hold the whole in their head before reading any spec._

## Components

_The named parts and what each is responsible for. One line to a short paragraph each. Boundaries matter more than internals here; this is the map, not the territory._

## Data and flow

_What moves through the system and where it lives. The path a request, a record, or an event takes from edge to store and back._

## Boundaries and dependencies

_Where this system ends and others begin. Outside services, platforms, and integrations it leans on. The seams where it could break or be swapped._
