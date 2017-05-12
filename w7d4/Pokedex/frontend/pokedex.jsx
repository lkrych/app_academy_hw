import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

import { fetchPokemon } from './actions/pokemon_actions';
import { selectPokemonItem } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  let root = document.getElementById('root');
  let store = configureStore();
  ReactDOM.render(<Root store={store}/>, root);
  window.store = store;
  window.selectPokemonItem = selectPokemonItem;
  window.fetchPokemon = fetchPokemon;
});
