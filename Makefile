# CloudOps Insight - Development Makefile
# Author: Niharika (mysorena@mail.uc.edu)
# Academic Project: University of Cincinnati
# Advisor: Bramha

.PHONY: help setup start stop restart build clean test dev-backend dev-frontend logs status academic-info

# Default target
help: ## Show this help message
	@echo "🎓 CloudOps Insight - UC Capstone Project"
	@echo "👩‍🎓 Author: Niharika (mysorena@mail.uc.edu)"
	@echo "👨‍🏫 Advisor: Bramha"
	@echo ""
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Academic project information
academic-info: ## Show academic project information
	@echo "🎓 CloudOps Insight - Natural Language Interface for Cloud Operations"
	@echo "📍 University of Cincinnati - Capstone Project"
	@echo "👩‍🎓 Author: Niharika"
	@echo "📧 Email: mysorena@mail.uc.edu"
	@echo "👨‍🏫 Advisor: Bramha"
	@echo "🔬 Research Focus: NLP for Infrastructure Management"
	@echo "📚 Phase: Development & Research"
	@echo "🔗 Repository: https://github.com/niharikamg/CloudOps-Insight-Cloud-Monitoring-Deployment-Dashboard"
	@echo ""

# Setup and Installation
setup: ## Initial setup for development environment
	@echo "🚀 Setting up CloudOps Insight development environment..."
	@echo "📧 Contact: mysorena@mail.uc.edu for support"
	@if [ ! -f .env ]; then \
		echo "📝 Creating .env file from template..."; \
		cp .env.example .env; \
		echo "⚠️  Please update .env with your actual configuration!"; \
	fi
	@echo "🐳 Setting up Docker containers..."
	@docker-compose build
	@echo "✅ Setup complete! Ready for UC Capstone development!"

install-backend: ## Install backend Python dependencies locally
	@echo "🐍 Installing backend dependencies..."
	@cd backend && python -m venv venv
	@cd backend && source venv/bin/activate && pip install -r requirements.txt
	@echo "✅ Backend dependencies installed!"

install-frontend: ## Install frontend Node.js dependencies locally
	@echo "⚛️ Installing frontend dependencies..."
	@cd frontend && npm install
	@echo "✅ Frontend dependencies installed!"

install: install-backend install-frontend ## Install all dependencies locally

# Docker Operations
build: ## Build all Docker containers
	@echo "🔨 Building CloudOps Insight containers..."
	@docker-compose build
	@echo "✅ Build complete!"

start: ## Start all services with Docker Compose
	@echo "🚀 Starting CloudOps Insight services..."
	@echo "🎓 UC Capstone Project by Niharika"
	@docker-compose up -d
	@echo "✅ Services started!"
	@echo "🌐 Frontend: http://localhost:3000"
	@echo "🔧 Backend API: http://localhost:8000"
	@echo "📊 API Docs: http://localhost:8000/docs"
	@echo "📈 Grafana: http://localhost:3001 (admin/admin123)"
	@echo "📊 Prometheus: http://localhost:9090"

stop: ## Stop all services
	@echo "🛑 Stopping CloudOps Insight services..."
	@docker-compose down
	@echo "✅ Services stopped!"

restart: ## Restart all services
	@echo "🔄 Restarting CloudOps Insight services..."
	@docker-compose restart
	@echo "✅ Services restarted!"

clean: ## Clean up Docker containers and volumes
	@echo "🧹 Cleaning up CloudOps Insight environment..."
	@docker-compose down -v --remove-orphans
	@docker system prune -f
	@echo "✅ Cleanup complete!"

# Development Commands
dev-backend: ## Run backend in development mode (local Python)
	@echo "🐍 Starting backend development server..."
	@echo "📧 Academic contact: mysorena@mail.uc.edu"
	@cd backend && source venv/bin/activate && python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

dev-frontend: ## Run frontend in development mode (local Node.js)
	@echo "⚛️ Starting frontend development server..."
	@echo "🎓 UC Capstone Project"
	@cd frontend && npm start

dev: ## Run both backend and frontend in development mode
	@echo "🚀 Starting full development environment..."
	@echo "🎓 CloudOps Insight - UC Academic Project"
	@make -j2 dev-backend dev-frontend

# Monitoring and Logs
logs: ## Show logs from all services
	@echo "📋 CloudOps Insight service logs:"
	@docker-compose logs -f

logs-backend: ## Show backend logs only
	@docker-compose logs -f backend

logs-frontend: ## Show frontend logs only
	@docker-compose logs -f frontend

status: ## Show status of all services
	@echo "📊 CloudOps Insight service status:"
	@docker-compose ps
	@echo ""
	@echo "🌐 Service URLs:"
	@echo "  Frontend:   http://localhost:3000"
	@echo "  Backend:    http://localhost:8000"
	@echo "  API Docs:   http://localhost:8000/docs"
	@echo "  Grafana:    http://localhost:3001"
	@echo "  Prometheus: http://localhost:9090"

health: ## Check health of all services
	@echo "🏥 Checking CloudOps Insight service health..."
	@echo "📧 Academic project: mysorena@mail.uc.edu"
	@curl -s http://localhost:8000/api/v1/health || echo "❌ Backend health check failed"
	@curl -s http://localhost:3000/nginx-health || echo "❌ Frontend health check failed"
	@echo "✅ Health checks complete!"

# Testing
test: ## Run all tests
	@echo "🧪 Running CloudOps Insight tests..."
	@echo "🎓 Academic evaluation ready!"
	@make test-backend test-frontend

test-backend: ## Run backend tests
	@echo "🐍 Running backend tests..."
	@cd backend && source venv/bin/activate && python -m pytest tests/ -v

test-frontend: ## Run frontend tests
	@echo "⚛️ Running frontend tests..."
	@cd frontend && npm test -- --coverage --watchAll=false

# Academic and Research Commands
academic-demo: ## Start services for academic demonstration
	@echo "🎓 Starting CloudOps Insight for UC Capstone demonstration..."
	@echo "👩‍🎓 Presenter: Niharika (mysorena@mail.uc.edu)"
	@echo "👨‍🏫 Advisor: Bramha"
	@make start
	@echo ""
	@echo "🌟 Academic Demo Ready!"
	@echo "💻 Demo URL: http://localhost:3000"
	@echo "📊 Metrics: http://localhost:3001"
	@echo "🔧 API: http://localhost:8000/docs"
	@echo ""
	@echo "🎯 Demo Commands to try:"
	@echo "  'check health'"
	@echo "  'deploy backend to staging'"
	@echo "  'show memory usage'"

research-data: ## Generate sample data for academic research
	@echo "🔬 Generating research data for academic analysis..."
	@curl -X POST http://localhost:8000/api/v1/chat/message -H "Content-Type: application/json" -d '{"message": "check health"}' || echo "Backend not running"
	@curl -X POST http://localhost:8000/api/v1/chat/message -H "Content-Type: application/json" -d '{"message": "deploy test to staging"}' || echo "Backend not running"
	@echo "✅ Research data generated!"

# Deployment
deploy-prod: ## Deploy for production (academic use)
	@echo "🚀 Deploying CloudOps Insight for academic presentation..."
	@echo "⚠️  Production deployment - UC Capstone Project"
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
	@echo "✅ Production deployment complete!"

# Utility Commands
update: ## Update all dependencies
	@echo "🔄 Updating CloudOps Insight dependencies..."
	@cd backend && source venv/bin/activate && pip install -r requirements.txt --upgrade
	@cd frontend && npm update
	@docker-compose build --no-cache
	@echo "✅ Dependencies updated!"

backup: ## Backup academic project data
	@echo "💾 Backing up CloudOps Insight data..."
	@mkdir -p backups
	@docker-compose exec db pg_dump -U postgres cloudops > backups/cloudops-$(shell date +%Y%m%d-%H%M%S).sql
	@echo "✅ Database backed up!"

shell-backend: ## Access backend container shell
	@docker-compose exec backend bash

shell-frontend: ## Access frontend container shell
	@docker-compose exec frontend sh

# Academic Documentation
docs: ## Generate academic documentation
	@echo "📚 Generating CloudOps Insight documentation..."
	@echo "🎓 Academic project documentation for UC evaluation"
	@mkdir -p docs/generated
	@echo "# CloudOps Insight - Academic Documentation" > docs/generated/README.md
	@echo "Author: Niharika (mysorena@mail.uc.edu)" >> docs/generated/README.md
	@echo "Institution: University of Cincinnati" >> docs/generated/README.md
	@echo "Advisor: Bramha" >> docs/generated/README.md
	@echo "✅ Documentation generated in docs/generated/"

# Quick Start for New Users
quick-start: ## Quick start guide for academic reviewers
	@echo "🎓 CloudOps Insight - Quick Start for Academic Review"
	@echo "📧 Author: Niharika (mysorena@mail.uc.edu)"
	@echo ""
	@echo "🚀 To start the project:"
	@echo "  1. make setup    # Initial setup"
	@echo "  2. make start    # Start all services"
	@echo "  3. Visit http://localhost:3000"
	@echo ""
	@echo "🧪 To test features:"
	@echo "  make academic-demo  # Start demo mode"
	@echo "  make test          # Run all tests"
	@echo ""
	@echo "📊 For evaluation:"
	@echo "  make research-data  # Generate sample data"
	@echo "  make logs          # View system logs"
