from typing import List, Optional
from pydantic import BaseModel

class PlanRequest(BaseModel):
    goal: str
    time_horizon_weeks: Optional[int] = None
    time_per_week_hours: Optional[int] = None
    skill_level: Optional[str] = None

class Resource(BaseModel):
    title: str
    url: str
    type: Optional[str] = None

class WeekPlan(BaseModel):
    week: int
    focus: str
    summary: str
    tasks: List[str]
    resources: List[Resource]

class PlanResponse(BaseModel):
    goal: str
    horizon_weeks: int
    overall_strategy: str
    plan: List[WeekPlan]
