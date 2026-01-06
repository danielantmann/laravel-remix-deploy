# Distribution.ai - Laravel Take-Home

This is a starter repository for the Distribution.ai Junior Developer take-home technical assignment.

## Prerequisites

To run this project, you need:

-   **PHP 8.2 or 8.3**
-   **Composer** (PHP dependency manager)
-   **Node.js & NPM** (latest LTS recommended)
-   **No database required** (this take-home does not use auth or persistence)

---

## Environment Setup

Choose the instructions for your Operating System:

###  Mac (Recommended: Laravel Herd)

The fastest way to get started on a Mac is using [Laravel Herd](https://herd.laravel.com/).

1. Download and install **Herd**.
2. Herd automatically manages PHP and Nginx for you.

### ⊞ Windows (Recommended: WSL2 or Herd for Windows)

-   **Option A: Herd for Windows**: Download [Herd for Windows](https://herd.laravel.com/windows) for a one-click setup.
-   **Option B: WSL2**: Follow the [official Laravel guide for Windows](https://laravel.com/docs/10.x/installation#laravel-and-wsl2).

### 🐧 Linux

Use your package manager to install PHP, Composer, and Node.js.

-   [Ubuntu/Debian setup guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-laravel-with-nginx-on-ubuntu-22-04)

---

## Installation

> [!TIP] > **Struggling with the environment?** If you cannot get this repository running within 30 minutes, feel free to set up a clean Laravel project from scratch and implement the requirements there. See [TAKEHOME.md](TAKEHOME.md) for details.

### 1. Fork this Repository

Click the **Fork** button at the top right of this page to create your own copy of this repository.

### 2. Clone your Fork

```bash
git clone https://github.com/YOUR_USERNAME/laravel-take-home.git
cd laravel-take-home
```

### 3. Install Dependencies

```bash
composer install
npm install
```

### 4. Setup Environment

```bash
cp .env.example .env
php artisan key:generate
```

### 5. Run the Application

You will need **two terminal windows** running simultaneously:

**Terminal 1: Vite (Frontend Assets)**

```bash
npm run dev
```

_Note: This runs on port 5173. You do **not** need to visit this URL in your browser; it simply serves the JS/CSS assets._

**Terminal 2: Laravel (The Application)**

```bash
php artisan serve
```

_Note: This usually runs on port 8000._

### 6. Visit the App

Open your browser and go to:
**[http://localhost:8000/tools/remix](http://localhost:8000/tools/remix)**

---

## The Assignment

Please read [TAKEHOME.md](TAKEHOME.md) for full instructions on what to build.

## Running Tests

Run the tests. Some will fail initially until you complete the TODOs, which is expected:

```bash
php artisan test
```

## Submission

When you're finished:

1. Ensure all your changes are committed to your **personal fork** (keep it public so we can see it).
2. Fill out [TAKEHOME_NOTES.md](TAKEHOME_NOTES.md).
3. **Send us the link to your fork via email.**

> [!IMPORTANT] > **Do NOT open a Pull Request against this repository.** Submissions should only be made via your individual fork.
