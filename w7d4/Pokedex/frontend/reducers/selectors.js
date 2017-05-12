import { values } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => values(pokemon);

export const selectPokemonItem = (state, itemId) => (
  state.pokemonDetail.items.find((el) => el.id === itemId)
);
