import React from 'react';

const BenchIndexItem = ({bench}) => (
    <tr>
      <td>{bench.description}</td>
      <td>{bench.lat}</td>
      <td>{bench.lon}</td>
    </tr>
);

export default BenchIndexItem;
