import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";

export const receiveAllPokemon = (pokes) => ({
  type: RECEIVE_ALL_POKEMON,
  pokes
});

export const receivePokemon = (poke) => ({
  type: RECEIVE_POKEMON,
  poke
});

export const fetchAllPokemon = () => dispatch => {
  return APIUtil.fetchPokemon().then(pokes =>
    dispatch(receiveAllPokemon(pokes)));
};

export const fetchPokemon = (id) => dispatch => {
  return APIUtil.fetchAPokemon(id).then( poke =>
    dispatch(receivePokemon(poke)));
};
