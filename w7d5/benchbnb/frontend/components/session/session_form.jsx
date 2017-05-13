import React from 'react';
import { Link, withRouter, Redirect } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onInput = this.onInput.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.processForm(this.state, this.props.formType);
  }

  onInput(property){
    return (e) => {
      this.setState( { [property]: e.target.value } );
    };
  }

  render(){
    const otherRoute = this.props.formType === 'login' ? 'signup' : 'login';
    const thisRouteText = this.props.formType === 'login' ? 'Log In' : 'Sign Up';
    const errors = this.props.errors.map((error, idx) => <li key={idx}>{error}</li>);
    if (this.props.loggedIn){
      return( <Redirect to='/' />);
    }
    return(
      <form onSubmit={this.handleSubmit}>
        <h2>{thisRouteText}</h2>
        <p>Please {this.props.formType} or {
            <Link to={`/${otherRoute}`}>
              { otherRoute } instead
            </Link>
          }
        </p>
        <ul>
          {errors}
        </ul>
        <label> Username:
          <input type='text'
            onChange={this.onInput('username')}
            value={this.state.username}>
          </input>
        </label>

        <label> Password:
          <input type='password'
            onChange={this.onInput('password')}
            value={this.state.password}>
          </input>
        </label>

        <button>{thisRouteText}</button>
      </form>
    );
  }
}

export default withRouter(SessionForm);
