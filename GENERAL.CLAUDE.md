# Project Overview

This folder is a root-level directory containing repositories for the data management, and client and backend applications and 

## Technology Stack

- **NGINX** - Proxy server
- **Docker & docker-compose** - Containerization
- **Next.js** - Frontend applications
- **Tailwind CSS** - CSS framework
- **Django with Django REST Framework** - Backend API
- **PostgreSQL** - Databases

## Project Structure

> **Note:** Each subfolder contains a specific `CLAUDE.md` file with detailed documentation. Please refer to those when working on specific projects.

### Core Repositories

#### `/main`
Main orchestration repository for running applications locally.

**Contains:**
- Makefile with helper commands
- Shell scripts
- NGINX configurations
- docker-compose definition

### Backend Applications

#### `/backend` ⭐ **STANDARD**
Django-based backend application.

**🐳 Docker container name:** `backend`
**Status:** Main API for a client application


### Frontend Applications

#### `/keep-rocking` ⭐ **STANDARD**
Next.js-based frontend application.

**Dependencies:**
- `/backend` (API)

**🐳 Docker container name:** `keep-rocking`
**Status:** Current working standard - follow this repository's structure and practices for new frontend projects


### Data Management Repositories

#### `/erebus` ⭐ **STANDARD**
Python-based data management application.

**Dependencies:**
- `/backend` (API)

**🐳 Docker container name:** `erebus`
**Status:** Current working standard - follow this repository's structure and practices for new data management projects


## Development Patterns

### Infrastructure
- **Docker & docker-compose** for local application execution
- **NGINX** as proxy server

### Version Control & CI/CD
- **GitHub** for version control
- **GitHub Actions** for CI/CD integration
- **GitLab** for Docker container storage


### Running the applications locally

The docker-compose definition for each application can be found in `/main/docker-compose.yaml`.
You should **never** run the applications directly from the repository root.

We are using the following command to start all containers:

`docker-compose up -d`

or we start only one container that also starts its dependencies:

`docker-compose up backend`


### Debugging

Always check the logs of a specific container for debugging purposes.


## Best Practices and Rules

1. **Frontend applications:** Always check the mobile view of the page for responsiveness.
2. **New frontend Projects:** Follow `/keep-rocking` repository structure and practices.
4. **Backend API:** Use `/backend` as the standard.
5. **Documentation:** Always refer to specific `CLAUDE.md` in each repository, e.g. `/{project-name}/CLAUDE.md` for detailed development instructions, API documentation, and project-specific patterns.
6. Use tabs for indentation.
7. Follow PEP-8 rules for python projects.
8. Use `black` for formatting.
9. Use `isort` for sorting imports.