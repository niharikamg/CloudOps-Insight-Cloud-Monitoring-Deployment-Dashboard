/**
 * CloudOps Insight - React Entry Point
 * Author: Niharika (mysorena@mail.uc.edu)
 * Academic Project: University of Cincinnati
 * Advisor: Bramha
 */

import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

// Academic project logging
console.log('🎓 CloudOps Insight - University of Cincinnati');
console.log('👩‍🎓 Author: Niharika (mysorena@mail.uc.edu)');
console.log('👨‍🏫 Advisor: Bramha');
console.log('🔬 Research: Natural Language Interfaces for Infrastructure Management');
console.log('🚀 Starting CloudOps Insight Frontend...');

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// Performance monitoring for academic research
if (process.env.NODE_ENV === 'development') {
  console.log('📊 Development mode - Performance monitoring enabled');
}
