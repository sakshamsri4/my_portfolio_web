import streamlit as st
import requests
import json

# Constants
API_URL = "http://localhost:8000/plan"

st.set_page_config(page_title="AI Goal Planner", page_icon="🎯")

st.title("🎯 AI Goal Planner Agent")
st.markdown("Enter your goal below and get a structured weekly plan!")

# Input Form
with st.form("plan_form"):
    goal = st.text_area("What is your goal?", placeholder="e.g. Learn LangChain in 7 days")
    
    col1, col2, col3 = st.columns(3)
    
    with col1:
        time_horizon = st.number_input("Time Horizon (Weeks)", min_value=1, max_value=52, value=4)
    
    with col2:
        hours_per_week = st.number_input("Hours per Week", min_value=1, max_value=168, value=10)
        
    with col3:
        skill_level = st.selectbox("Current Skill Level", ["Beginner", "Intermediate", "Advanced"])
        
    submitted = st.form_submit_button("Generate Plan")

if submitted:
    if not goal:
        st.error("Please enter a goal.")
    else:
        with st.spinner("Generating your personalized plan... This may take a few seconds."):
            payload = {
                "goal": goal,
                "time_horizon_weeks": time_horizon,
                "time_per_week_hours": hours_per_week,
                "skill_level": skill_level.lower()
            }
            
            try:
                response = requests.post(API_URL, json=payload)
                
                if response.status_code == 200:
                    plan_data = response.json()
                    
                    st.success("Plan generated successfully!")
                    
                    st.subheader("Overall Strategy")
                    st.info(plan_data.get("overall_strategy"))
                    
                    st.markdown("---")
                    st.subheader("Weekly Schedule")
                    
                    for week in plan_data.get("plan", []):
                        with st.expander(f"Week {week['week']}: {week['focus']}", expanded=True):
                            st.markdown(f"**Summary:** {week['summary']}")
                            
                            st.markdown("#### Tasks")
                            for task in week.get("tasks", []):
                                st.markdown(f"- {task}")
                                
                            if week.get("resources"):
                                st.markdown("#### Resources")
                                for res in week["resources"]:
                                    st.markdown(f"- [{res['title']}]({res['url']}) ({res.get('type', 'link')})")
                else:
                    st.error(f"Error: {response.status_code} - {response.text}")
            except requests.exceptions.ConnectionError:
                st.error("Could not connect to the backend. Is it running? (Make sure to run `uvicorn main:app` in the background)")
            except Exception as e:
                st.error(f"An unexpected error occurred: {e}")
