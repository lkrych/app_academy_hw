import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';

import {fetchPokemon} from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemonDetail: state.pokemonDetail
});

const mapDispatchToProps = dispatch => ({
  fetchPokemon: (id) => dispatch(fetchPokemon(id))
});

export default connect(mapStateToProps,mapDispatchToProps)(PokemonDetail);
