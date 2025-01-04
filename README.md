## Introduction

Relativity Platform 2.0 is a scalable and robust platform designed to provide end-to-end real-time.

## Prerequisites

Ensure you have the following versions installed:

- Ruby: `v3.3.3`
- Rails: `v8.0.1`
- PostgreSQL: `14 or higher`

## Setup

Follow these steps to set up the development environment:

1. **Clone the repository:**

   ```bash
   $ git clone https://github.com/tagntrac-infra/fulcrum.git
   $ cd fulcrum
   ```

2. **Install dependencies:**

   ```bash
   $ bundle install
   ```

3. **Set up the database:**

   ```bash
   $ rails db:create db:migrate
   ```

4. **Run the test suite to ensure everything is set up correctly:**

   ```bash
   $ bundle exec rspec
   ```

5. **Start the Rails server:**
   ```bash
   $ rails server
   ```

You should now be able to access the application at `http://localhost:3000`.
