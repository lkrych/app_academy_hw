import React from 'react';

import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.fetchBenches();
  }

  render(){
    const benches = this.props.benches.map(bench => (
      <BenchIndexItem bench={bench} />
    ));
    return(
      <table className="table">
        <thead>
          <tr>
            <th>Description</th>
            <th>Latitude</th>
            <th>Longitude</th>
          </tr>
        </thead>
        <tbody>
          {benches}
        </tbody>
      </table>
    );
  }
}
