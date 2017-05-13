import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import * as SessionActions from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  ReactDOM.render( <Root store={store} />,document.getElementById('root'));
});
