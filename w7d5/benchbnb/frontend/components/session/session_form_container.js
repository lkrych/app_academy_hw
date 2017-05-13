import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login, signup } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => ({
  loggedIn: Boolean(state.session.currentUser),
  errors: state.session.errors,
  formType: ownProps.location.pathname === '/login' ? 'login' : 'signup'
});

const mapDispatchToProps = (dispatch) => ({
  processForm: (user, path) => path === 'login' ? dispatch(login(user)) : dispatch(signup(user))
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
