import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ session, logout }) => {
  let greeting;
  if (session.currentUser) {
    greeting = (
      <section>
        <p>Come take a seat, {session.currentUser.username}! It will be our treat.</p>
        <button onClick={logout} className ="btn btn-default">Log out</button>
      </section>
    );
  } else {
    greeting = (
      <section>
        <Link to="/signup">Sign Up</Link>
        <br />
        <Link to="/login">Log In</Link>
      </section>
    );
  }
  return greeting;
};

export default Greeting;
