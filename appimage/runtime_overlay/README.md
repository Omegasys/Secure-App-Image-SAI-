# SAI Runtime Overlay

This directory contains runtime modifications applied at execution time.

## Purpose

- Temporary writable layer
- Runtime caching
- Isolated app state storage

## Security Rule

This directory is:
- NOT persistent
- NOT shared with host system
- DESTROYED after execution
