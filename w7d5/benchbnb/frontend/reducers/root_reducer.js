import { combineReducers } from 'redux';
import sessionReducer from './session_reducer';
import benchReducer from './bench_reducer';

const rootReducer = combineReducers({
  session: sessionReducer,
  benches: benchReducer
});

export default rootReducer;
