const rootURL = "http://api.giphy.com/v1/gifs/search?";

export const fetchSearchGiphys = (searchTerm) => (
  $.ajax({
    method: 'GET',
    url: rootURL + `q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`
  })
);
