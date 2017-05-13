import { merge } from 'lodash';
import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER }
  from '../actions/session_actions';

const _nullUser = {
  currentUser: null,
  errors: []
};

const sessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, _nullUser, { currentUser: action.currentUser });
    case RECEIVE_ERRORS:
      return merge({}, _nullUser, { errors: action.errors });
    default:
      return state;
  }
};

export default sessionReducer;
