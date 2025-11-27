import json
import os
from openai import OpenAI
from dotenv import load_dotenv
from schemas import PlanRequest, PlanResponse

load_dotenv()

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

SYSTEM_PROMPT = """
You are an AI planning assistant. The user will give you a learning or career goal and some constraints. You must respond with STRICT JSON that matches this schema:
{
  "goal": string,
  "horizon_weeks": integer,
  "overall_strategy": string,
  "plan": [
    {
      "week": integer,
      "focus": string,
      "summary": string,
      "tasks": [string, ...],
      "resources": [
        {
          "title": string,
          "url": string,
          "type": string
        }
      ]
    }
  ]
}
Do not include any text outside of the JSON.
"""

def generate_plan(request: PlanRequest) -> PlanResponse:
    user_content = f"Goal: {request.goal}\n"
    if request.time_horizon_weeks:
        user_content += f"Time Horizon: {request.time_horizon_weeks} weeks\n"
    if request.time_per_week_hours:
        user_content += f"Time per week: {request.time_per_week_hours} hours\n"
    if request.skill_level:
        user_content += f"Skill Level: {request.skill_level}\n"

    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo", # Or gpt-4-turbo if available/preferred
            messages=[
                {"role": "system", "content": SYSTEM_PROMPT},
                {"role": "user", "content": user_content}
            ],
            response_format={"type": "json_object"}
        )
        
        content = response.choices[0].message.content
        if not content:
            raise ValueError("Empty response from OpenAI")
            
        data = json.loads(content)
        return PlanResponse(**data)
        
    except Exception as e:
        print(f"Error generating plan: {e}")
        # In a real app, you might want to retry or handle specific errors better
        raise e
