import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";
// import Root from './components/root'
import App from './components/app'


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store ;
  const root = document.getElementById('main');
  ReactDOM.render(<App/>, root);
});

