import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchPokemon();
  }

  render() {
    const pokes = this.props.pokemon;
    const pokemonItems = pokes.map( poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));
    return (
      <div className="contain">
        <aside className="pokemon">

          <ol> { pokemonItems } </ol>
        </aside>
        <Route path="/pokemon/:pokemonId" component={ PokemonDetailContainer }/>
      </div>
    );
  }
}

export default PokemonIndex;
