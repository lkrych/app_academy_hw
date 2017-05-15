import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
import * as APIUtil from './util/bench_api_util';

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

window.APIUtil = APIUtil;
