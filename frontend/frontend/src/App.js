/**
 * CloudOps Insight - Main React Application
 * Author: Niharika (mysorena@mail.uc.edu)
 * Academic Project: University of Cincinnati
 * Advisor: Bramha
 */

import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [systemStatus, setSystemStatus] = useState('checking');

  // Academic project information
  const academicInfo = {
    project: "CloudOps Insight",
    author: "Niharika",
    email: "mysorena@mail.uc.edu",
    institution: "University of Cincinnati",
    advisor: "Bramha",
    phase: "Development & Research"
  };

  useEffect(() => {
    // Check backend health on startup
    const checkBackendHealth = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/v1/health');
        if (response.ok) {
          setSystemStatus('online');
          // Add welcome message
          setMessages([{
            id: 1,
            type: 'bot',
            content: `🎓 Welcome to CloudOps Insight!\n\nAcademic Research Project\nUniversity of Cincinnati\nAuthor: ${academicInfo.author}\nAdvisor: ${academicInfo.advisor}\n\nTry saying:\n• "check health"\n• "deploy something"\n• "hello"`,
            timestamp: new Date()
          }]);
        } else {
          setSystemStatus('offline');
        }
      } catch (error) {
        setSystemStatus('offline');
        setMessages([{
          id: 1,
          type: 'bot',
          content: `⚠️ Backend server is not running.\n\nTo start the backend:\n1. cd backend\n2. pip install -r requirements.txt\n3. python -m uvicorn app.main:app --reload\n\nOr use Docker: docker-compose up -d`,
          timestamp: new Date()
        }]);
      }
    };

    checkBackendHealth();
  }, [academicInfo.author, academicInfo.advisor]);

  const handleSendMessage = async () => {
    if (!input.trim() || isLoading) return;

    const userMessage = {
      id: Date.now(),
      type: 'user',
      content: input,
      timestamp: new Date()
    };

    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setIsLoading(true);

    try {
      const response = await fetch('http://localhost:8000/api/v1/chat/message', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ message: input }),
      });

      if (response.ok) {
        const data = await response.json();
        const botMessage = {
          id: Date.now() + 1,
          type: 'bot',
          content: data.message,
          success: data.success,
          data: data.data,
          timestamp: new Date()
        };
        setMessages(prev => [...prev, botMessage]);
      } else {
        throw new Error('Failed to get response');
      }
    } catch (error) {
      const errorMessage = {
        id: Date.now() + 1,
        type: 'bot',
        content: '❌ Sorry, I encountered an error. Make sure the backend server is running on http://localhost:8000',
        success: false,
        timestamp: new Date()
      };
      setMessages(prev => [...prev, errorMessage]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSendMessage();
    }
  };

  return (
    <div className="App">
      {/* Header */}
      <header className="app-header">
        <div className="header-content">
          <h1>CloudOps Insight 🚀</h1>
          <div className="system-status">
            <span className={`status-indicator ${systemStatus}`}></span>
            <span>Backend: {systemStatus}</span>
          </div>
        </div>
        <div className="academic-info">
          <p>🎓 {academicInfo.institution} - {academicInfo.phase}</p>
          <p>Author: {academicInfo.author} | Advisor: {academicInfo.advisor}</p>
        </div>
      </header>

      {/* Chat Interface */}
      <main className="chat-container">
        <div className="messages-container">
          {messages.map((message) => (
            <div key={message.id} className={`message ${message.type}`}>
              <div className="message-content">
                <p>{message.content}</p>
                {message.data && (
                  <div className="message-data">
                    <pre>{JSON.stringify(message.data, null, 2)}</pre>
                  </div>
                )}
                <span className="timestamp">
                  {message.timestamp.toLocaleTimeString()}
                </span>
              </div>
            </div>
          ))}
          
          {isLoading && (
            <div className="message bot loading">
              <div className="message-content">
                <p>🤔 Thinking...</p>
              </div>
            </div>
          )}
        </div>

        {/* Input Area */}
        <div className="input-container">
          <div className="input-wrapper">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyPress={handleKeyPress}
              placeholder="Ask me to deploy, check health, or show metrics..."
              disabled={isLoading}
              className="message-input"
            />
            <button
              onClick={handleSendMessage}
              disabled={!input.trim() || isLoading}
              className="send-button"
            >
              Send 📤
            </button>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="app-footer">
        <p>
          Natural Language Interface for Cloud Operations Research
        </p>
        <p>
          <a href={`mailto:${academicInfo.email}`}>
            {academicInfo.email}
          </a>
        </p>
      </footer>
    </div>
  );
}

export default App;
