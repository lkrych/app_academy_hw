import React from 'react';
import { Route } from 'react-router-dom';
import { AuthRoute } from '../util/route_util';

import GreetingContainer from './greeting/greeting_container';
import SessionFormContainer from './session/session_form_container';
import BenchIndexContainer from './bench/bench_index_container';

const App = () => (
  <div className="container">
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>
    <AuthRoute path='/login' component={SessionFormContainer} />
    <AuthRoute path='/signup' component={SessionFormContainer} />
    <Route exact path="/" component={ BenchIndexContainer } />
  </div>
);

export default App;
