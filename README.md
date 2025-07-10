# CloudOps Insight Cloud Monitoring Deployment Dashboard

cloudops-insight/
├── .github/
│   ├── workflows/              # GitHub Actions CI/CD
│   │   ├── backend-tests.yml
│   │   ├── frontend-tests.yml
│   │   ├── deploy-staging.yml
│   │   └── deploy-production.yml
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   │   └── academic_milestone.md
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── CODEOWNERS
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py
│   │   ├── api/
│   │   ├── core/
│   │   ├── models/
│   │   └── utils/
│   ├── tests/
│   ├── requirements.txt
│   ├── Dockerfile
│   └── README.md
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── services/
│   │   ├── hooks/
│   │   └── utils/
│   ├── package.json
│   ├── Dockerfile
│   └── README.md
├── infrastructure/
│   ├── terraform/
│   ├── kubernetes/
│   ├── docker-compose.yml
│   └── README.md
├── docs/
│   ├── architecture/
│   ├── api/
│   ├── deployment/
│   ├── academic/
│   └── user-guide/
├── scripts/
│   ├── setup.sh
│   ├── test.sh
│   └── deploy.sh
├── monitoring/
│   ├── grafana/
│   ├── prometheus/
│   └── alerting/
├── .gitignore
├── .env.example
├── docker-compose.yml
├── README.md
├── CONTRIBUTING.md
├── LICENSE
└── CHANGELOG.md
