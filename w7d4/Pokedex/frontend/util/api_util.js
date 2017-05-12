export const fetchPokemon = function () {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};

export const fetchAPokemon = function(id) {
  return $.ajax({
    url: `/api/pokemon/${id}`,
    method: 'GET'
  });
};
