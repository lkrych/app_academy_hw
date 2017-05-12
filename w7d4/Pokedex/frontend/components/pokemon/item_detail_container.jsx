import {connect} from 'react-redux';
import ItemDetail from './item_detail';
import { selectPokemonItem } from '../../reducers/selectors.js';

const mapStateToProps = (state, ownProps) => {
  const selectedItem = selectPokemonItem(state, parseInt(ownProps.match.params.itemId));
  return { item: selectedItem };
};

export default connect(mapStateToProps)(ItemDetail);
