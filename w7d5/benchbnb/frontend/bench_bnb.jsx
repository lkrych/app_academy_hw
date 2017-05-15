import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import * as SessionActions from './actions/session_actions';

let store;
document.addEventListener('DOMContentLoaded', () => {
  if(window.currentUser){
    let preloadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else{
    store = configureStore();
  }
  ReactDOM.render( <Root store={store} />,document.getElementById('root'));
});
