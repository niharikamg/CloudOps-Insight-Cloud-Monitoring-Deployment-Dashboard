"""
CloudOps Insight - Main FastAPI Application
Author: Niharika (mysorena@mail.uc.edu)
Academic Project: University of Cincinnati
Advisor: Bramha
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.middleware.trustedhost import TrustedHostMiddleware
import uvicorn
import logging
from contextlib import asynccontextmanager
from datetime import datetime

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Application startup and shutdown events"""
    # Startup
    logger.info("🚀 CloudOps Insight starting up...")
    logger.info("📧 Academic Contact: mysorena@mail.uc.edu")
    logger.info("🎓 University of Cincinnati - Capstone Project")
    logger.info("👨‍🏫 Advisor: Bramha")
    
    yield
    
    # Shutdown
    logger.info("🛑 CloudOps Insight shutting down...")

# Create FastAPI app
app = FastAPI(
    title="CloudOps Insight",
    description="A cloud-native monitoring and DevOps automation platform with natural language interface",
    version="0.1.0",
    contact={
        "name": "Niharika",
        "email": "mysorena@mail.uc.edu",
        "url": "https://github.com/niharikamg/CloudOps-Insight-Cloud-Monitoring-Deployment-Dashboard"
    },
    license_info={
        "name": "Academic Research License",
        "url": "https://github.com/niharikamg/CloudOps-Insight-Cloud-Monitoring-Deployment-Dashboard#license"
    },
    lifespan=lifespan
)

# CORS Configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://127.0.0.1:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Root endpoint
@app.get("/")
async def root():
    """Root endpoint with project information"""
    return {
        "message": "Welcome to CloudOps Insight! 🚀",
        "description": "Natural Language Interface for Cloud Operations",
        "academic_project": "University of Cincinnati Capstone",
        "author": "Niharika",
        "contact": "mysorena@mail.uc.edu",
        "advisor": "Bramha",
        "version": "0.1.0-alpha",
        "docs": "/docs",
        "health": "/api/v1/health",
        "timestamp": datetime.now().isoformat()
    }

@app.get("/api/v1/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "service": "CloudOps Insight Backend",
        "version": "0.1.0",
        "timestamp": datetime.now().isoformat(),
        "academic_info": {
            "institution": "University of Cincinnati",
            "author": "Niharika",
            "advisor": "Bramha",
            "email": "mysorena@mail.uc.edu"
        }
    }

@app.get("/api/v1/info")
async def api_info():
    """API information endpoint"""
    return {
        "api_version": "v1",
        "service": "CloudOps Insight",
        "features": [
            "Natural Language Processing",
            "AWS Integration",
            "Kubernetes Management",
            "Prometheus Monitoring",
            "Deployment Automation"
        ],
        "research_focus": [
            "NLP for Infrastructure Management",
            "Human-Computer Interaction in DevOps",
            "Security in AI-Powered Systems"
        ],
        "academic_status": "Active Development - UC Capstone Project"
    }

# Simple chat endpoint (will be enhanced later)
@app.post("/api/v1/chat/message")
async def chat_message(message: dict):
    """Basic chat endpoint - will be enhanced with NLP later"""
    user_message = message.get("message", "").strip()
    
    if not user_message:
        raise HTTPException(status_code=400, detail="Message cannot be empty")
    
    # Simple responses for initial testing
    if "health" in user_message.lower():
        return {
            "success": True,
            "message": "✅ System is healthy! All services are running normally.",
            "data": {
                "status": "healthy",
                "services": ["backend", "database", "redis"],
                "timestamp": datetime.now().isoformat()
            }
        }
    
    elif "deploy" in user_message.lower():
        return {
            "success": True,
            "message": "🚀 Deployment simulation initiated! (This is a demo response)",
            "data": {
                "deployment_id": "demo-123",
                "status": "simulated",
                "timestamp": datetime.now().isoformat()
            }
        }
    
    else:
        return {
            "success": True,
            "message": f"👋 Hello from CloudOps Insight! You said: '{user_message}'\n\n" +
                      "I'm still learning! Try saying:\n" +
                      "• 'check health'\n" +
                      "• 'deploy something'\n\n" +
                      "🎓 UC Capstone Project by Niharika",
            "data": {
                "query": user_message,
                "timestamp": datetime.now().isoformat(),
                "author": "mysorena@mail.uc.edu"
            }
        }

if __name__ == "__main__":
    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )
