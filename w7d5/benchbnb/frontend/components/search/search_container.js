import { connect } from 'react-redux';

import { fetchBenches } from '../../actions/bench_actions';
import Search from './search';
import { selectAllBenches } from '../../reducers/selectors';

const mapStateToProps = state => (
  {
    benches: selectAllBenches(state.benches)
  }
);

const mapDispatchToProps = dispatch => (
  {
    fetchBenches: () => dispatch(fetchBenches())
  }
);

export default connect(mapStateToProps,mapDispatchToProps)(Search);
