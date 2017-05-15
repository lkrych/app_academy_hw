export const fetchBenches = () => (
  $.ajax({
    method: 'GET',
    url: 'api/benches'
  })
);

export const createBench = (bench) => (
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: { bench }
  })
);
