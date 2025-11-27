# AI Goal Planner Agent

A complete, minimal MVP for an AI-powered goal planning agent. This tool takes a user's goal and constraints and generates a structured weekly plan using OpenAI's API.

## Features

- **AI-Powered Planning**: Uses OpenAI to break down goals into actionable weekly tasks.
- **Customizable**: Set your time horizon, weekly availability, and skill level.
- **Clean UI**: Simple and effective interface built with Streamlit.
- **Robust Backend**: Fast and validated API using FastAPI and Pydantic.

## Prerequisites

- Python 3.10+
- OpenAI API Key

## Setup Instructions

1.  **Clone the repository** (if you haven't already).

2.  **Navigate to the project directory**:
    ```bash
    cd ai_goal_planner
    ```

3.  **Create and activate a virtual environment** (recommended):
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: venv\Scripts\activate
    ```

4.  **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

5.  **Configure Environment Variables**:
    - Copy `.env.example` to `.env`:
        ```bash
        cp .env.example .env
        ```
    - Open `.env` and replace `your_api_key_here` with your actual OpenAI API Key.

## How to Run

You need to run both the backend and the frontend. It's best to use two terminal windows.

### 1. Start the Backend
In the first terminal:
```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```
You should see output indicating the server is running at `http://0.0.0.0:8000`.

### 2. Start the Frontend
In the second terminal (make sure the venv is activated):
```bash
streamlit run streamlit_app.py
```
This will automatically open the app in your default web browser (usually at `http://localhost:8501`).

## Example Usage

Try entering one of these goals:

- "Get a remote AI+Flutter developer job in 4 months"
- "Learn LangChain and build 2 AI side projects in 6 weeks"
- "Train for a marathon in 12 weeks as a beginner"

## Project Structure

- `main.py`: FastAPI backend entry point.
- `ai_planner.py`: Logic for interacting with OpenAI.
- `schemas.py`: Data models for request/response validation.
- `streamlit_app.py`: Frontend user interface.
- `requirements.txt`: Project dependencies.
