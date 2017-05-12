import React from 'react';
import {Link, Route} from 'react-router-dom';
import ItemDetailContainer from  './item_detail_container';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonIndexContainer from './pokemon_index_container';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    // Fetch pokemon ID from URL
    const pId = this.props.match.params.pokemonId;
    this.props.fetchPokemon(pId);
  }

  componentWillReceiveProps(newProps){
    const pId = newProps.match.params.pokemonId;
    if(this.props.match.params.pokemonId !== pId){
      this.props.fetchPokemon(pId);
    }
  }

  render() {
    const poke = this.props.pokemonDetail;
    if(!poke.moves){
      return (<h1>THIS SHOULD BE INVISIBLE</h1>);
    }
    const items = poke.items.map((el) => (
      <Link key={el.id} to={`/pokemon/${poke.id}/item/${el.id}`}>
        <img src={el.image_url}></img>
      </Link>));

    return (
      <div className="pokemonDetail">
        <img src={poke.image_url} alt={poke.name} className="pokeImage"></img>
        <h2>{poke.name}</h2>
        <ul>
          <li>Type: {poke.poke_type}</li>
          <li>Attack: {poke.attack}</li>
          <li>Defense: {poke.defense}</li>
          <li>Moves: {poke.moves.join(", ")}</li>
        </ul>
        <div className="bordered">
          <h3> Items </h3>
          <div className="pokemonItem">
            { items }
          </div>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={PokemonIndexContainer, PokemonDetailContainer, ItemDetailContainer} />
        </div>
      </div>
    );
  }
}

export default PokemonDetail;
