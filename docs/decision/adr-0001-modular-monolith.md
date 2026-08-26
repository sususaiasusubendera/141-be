# ADR 1: Start with a Modular Monolith

2025 October (based on the Git commit date and GPT chat date)

## Status

Accepted

## Context

This project is developed as a portfolio project to explore backend engineering through a realistic e-commerce system.

Large-scale systems today, such as e-commerce platforms, commonly use a microservices architecture. This project was initially intended to be developed using a microservices architecture, as it is commonly used for large-scale systems. However, I had never worked with microservices before, which created some uncertainty about where to start and how to manage the additional complexity.

## Decision

The project will start as a modular monolith and will later be migrated to a microservices architecture. Each business domain will be designed as an independent module with clear boundaries, responsibilities, and minimal coupling. Clean Architecture will be used to keep dependencies within each module well-defined. These boundaries and well-defined dependencies will make the eventual migration to microservices easier.

## Consequences

### Positive

- Lower initial development and operational complexity.
- Allows deeper exploration of business domains without being distracted by the operational complexity of microservices.

### Negative

- Potential duplication of work, as the system will first be developed as a monolith and later migrated to microservices.
- The monolith may require additional refactoring before individual modules can be extracted into independent services.
