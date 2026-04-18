# Clear Cash

Cash flow management for freelancers.

Clear Cash is a focused fintech MVP built for Micathon'26 by Microsoft Club GIKI under the theme **Money Moves**. It helps freelancers answer one practical question:

> How much money is actually safe to spend right now?

The app is not a bank, lender, investment advisor, payment processor, or stock/crypto product. It is a planning tool that helps freelancers understand short-term cash flow using their own income, expenses, invoices, and payment status.

## Problem

Freelancers often receive irregular project payments while rent, subscriptions, software tools, and personal expenses arrive on fixed dates. A bank balance can look healthy even when much of that money is already reserved for upcoming obligations.

## Target User

A Pakistani freelancer who gets paid by clients at irregular times and needs to decide whether today's available cash is safe to spend after upcoming bills and unpaid invoices.

## Core Moment

Right after receiving a client payment or sending an invoice, the freelancer opens Clear Cash to check the safe-to-spend amount before making a spending decision.

## Solution

Clear Cash combines:

- Current income and expenses
- Upcoming bills
- Unpaid invoices
- Recorded payment status
- A simple cash-flow summary

The result is a clear dashboard that shows what is safe to spend and which money is still tied up in invoices or upcoming obligations.

## Main Features

- User registration and login
- JWT-protected backend routes
- Dashboard with safe-to-spend cash-flow view
- Add, edit, and delete income/expense transfers
- Create invoices
- Record invoice payment status
- CSV export for transfers
- User-scoped records so one user cannot see another user's data
- Responsive UI with dashboard, transfers, reports, auth pages, and landing page

## Tech Stack

### Frontend

- React
- Vite
- Tailwind CSS
- React Router
- Axios
- Lucide React icons

### Backend

- Node.js
- Express.js
- MongoDB
- Mongoose
- JWT authentication
- bcrypt password hashing

### Database

- MongoDB
- Collections for users, transactions, and invoices

## Why No AI?

AI is not used in this MVP because the core problem is better solved with deterministic cash-flow logic. This keeps the product faster, cheaper, more reliable, and easier to defend during judging.

## Data Handling

Clear Cash only stores the information needed for the core cash-flow workflow:

- Email
- Hashed password
- User profile information
- Transaction records
- Invoice records
- Calculated cash-flow data

Clear Cash does not collect:

- Bank passwords
- Card numbers
- CNIC or identity documents
- Crypto wallets
- Securities or investment data

Passwords are hashed with bcrypt. API access is protected with JWT. Sensitive configuration values should be stored in `.env`, not hardcoded in source code.

## Project Structure

```text
project/
  cash-flow-backend/
    middleware/
    models/
    routes/
    server.js
    package.json
  cash-flow-frontend/
    src/
    public/
    package.json
  README.md
```

## Local Setup

### Prerequisites

Install:

- Node.js
- npm
- MongoDB local server or MongoDB Atlas connection string

## Environment Variables

Create or update this file:

```text
cash-flow-backend/.env
```

Example:

```env
PORT=5000
MONGODB_URI=mongodb://127.0.0.1:27017/clear-cash
JWT_SECRET=replace_this_with_a_strong_secret
```

Do not commit real secrets or production database credentials.

## Run Backend

Open Terminal 1:

```bash
cd cash-flow-backend
npm install
npm run dev
```

Backend health check:

```text
http://localhost:5000/health
```

Expected response:

```json
{
  "ok": true,
  "service": "clear-cash-api"
}
```

## Run Frontend

Open Terminal 2:

```bash
cd cash-flow-frontend
npm install
npm run dev
```

Open the app:

```text
http://localhost:5173
```

## Demo Video Flow

Use this flow for the 1-minute Micathon demo:

1. Open `http://localhost:5173`
2. Click **Get started**
3. Register or log in
4. Open **Dashboard**
5. Show the large **Safe to spend** number
6. Go to **Transfers**
7. Add an income or expense transfer
8. Go to **Reports**
9. Add an invoice or record payment
10. Return to **Dashboard** and show the updated cash-flow view

Suggested demo line:

> Clear Cash helps freelancers with irregular income know what is actually safe to spend. I log in, check the safe-to-spend number, record money movement, track invoices, and update payment status. The app is a planning tool, not a bank or investment advisor.

## Build For Production

Build frontend:

```bash
cd cash-flow-frontend
npm run build
```

Start backend:

```bash
cd cash-flow-backend
npm start
```

The backend can serve the built frontend from `cash-flow-frontend/dist`.

## API Overview

Main backend areas:

- `/auth` - register and login
- `/transactions` - income and expense records
- `/invoices` - invoice records
- `/payInvoice` - record invoice payment status
- `/cashflow` - dashboard cash-flow summary
- `/health` - backend health check

## Hackathon Positioning

Clear Cash is intentionally narrow. It does not try to become a full neobank or investment platform. It solves one high-frequency freelancer problem: knowing what money is safe to spend before making a financial decision.

This matches the Micathon'26 brief because it is practical fintech for real people, gives value within minutes, avoids unsafe financial claims, and has a working end-to-end MVP.

## Limitations

- MVP prototype, not production fintech infrastructure
- Does not process real bank or card payments
- Does not provide investment or legal financial advice
- Does not connect to live bank accounts
- Production deployment should add HTTPS, stricter rate limiting, logging, monitoring, and stronger validation

## Submission Checklist

- PPT pitch deck
- 1-minute working product video
- Working project zip or deployed application link
- This README as the Idea & Concept document

