import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = (props) => {
  const poke = props.pokemon;
  return (
    <Link to={`/pokemon/${poke.id}`}>
      <li className="poke-list-item">
          <img src={poke.image_url}></img>
          <span>{poke.name}</span>
      </li>
    </Link>
  );

};

export default PokemonIndexItem;
