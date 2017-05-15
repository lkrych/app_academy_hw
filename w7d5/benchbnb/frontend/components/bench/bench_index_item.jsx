import React from 'react';

const BenchIndexItem = ({bench}) => (
    <tr>
      <td>{bench.description}</td>
      <td>{bench.latitude}</td>
      <td>{bench.longitude}</td>
    </tr>
);

export default BenchIndexItem;
