"""
CloudOps Insight - Backend Application Package
Author: Niharika (mysorena@mail.uc.edu)
Academic Project: University of Cincinnati
Advisor: Bramha

This __init__.py file makes the 'app' directory a proper Python package,
enabling proper imports and module structure for the FastAPI application.

Research Focus: Natural Language Interfaces for Infrastructure Management
"""

__version__ = "0.1.0-alpha"
__author__ = "Niharika"
__email__ = "mysorena@mail.uc.edu"
__institution__ = "University of Cincinnati"
__advisor__ = "Bramha"
__project__ = "CloudOps Insight"
__description__ = "Natural Language Interface for Cloud Operations"

# Academic project metadata
ACADEMIC_INFO = {
    "project_name": "CloudOps Insight",
    "author": "Niharika",
    "email": "mysorena@mail.uc.edu",
    "institution": "University of Cincinnati", 
    "advisor": "Bramha",
    "version": __version__,
    "research_phase": "Development & Evaluation",
    "focus_areas": [
        "Natural Language Processing for Infrastructure Management",
        "Human-Computer Interaction in DevOps Workflows", 
        "Security and Access Control in AI-Powered Systems",
        "Comparative Analysis of CLI vs. NLI for Cloud Operations"
    ],
    "technologies": [
        "FastAPI",
        "React.js", 
        "Docker",
        "AWS",
        "Kubernetes",
        "Prometheus",
        "Claude API",
        "PostgreSQL"
    ]
}

def get_academic_info():
    """
    Returns academic project information for research documentation
    and system identification purposes.
    
    Returns:
        dict: Academic project metadata
    """
    return ACADEMIC_INFO

def get_version():
    """
    Returns the current version of the CloudOps Insight application.
    
    Returns:
        str: Version string
    """
    return __version__

# Initialize logging for the application package
import logging

# Configure academic project logging
logger = logging.getLogger(__name__)
logger.info(f"🎓 {__project__} v{__version__} - {__institution__}")
logger.info(f"👩‍🎓 Author: {__author__} ({__email__})")
logger.info(f"👨‍🏫 Advisor: {__advisor__}")
logger.info("🔬 Research: Natural Language Interfaces for Infrastructure Management")

# Make important classes/functions available at package level
# (These will be implemented as the project grows)
__all__ = [
    "get_academic_info",
    "get_version", 
    "ACADEMIC_INFO",
    "__version__",
    "__author__",
    "__email__",
    "__institution__",
    "__advisor__"
]
