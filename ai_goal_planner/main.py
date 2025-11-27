from fastapi import FastAPI, HTTPException
from schemas import PlanRequest, PlanResponse
from ai_planner import generate_plan

app = FastAPI(title="AI Goal Planner API")

@app.get("/")
def read_root():
    return {"status": "ok", "message": "AI Goal Planner API"}

@app.post("/plan", response_model=PlanResponse)
def create_plan(request: PlanRequest):
    try:
        plan = generate_plan(request)
        return plan
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
