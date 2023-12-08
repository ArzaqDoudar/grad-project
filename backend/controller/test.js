// const STORE = require('../model/store.model')

module.exports = {

    foodAPI: async (req, res) => { // done
        const axios = require('axios');

const options = {
  method: 'GET',
  url: 'https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser',
  params: {
    'nutrition-type': 'cooking',
    'category[0]': 'generic-foods',
    'health[0]': 'alcohol-free'
  },
  headers: {
    'X-RapidAPI-Key': 'f8595f4b9cmshb3cbeffd9569464p1d2ceejsndb63b8350f6b',
    'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com'
  }
};

try {
	const response = await axios.request(options);
	console.log(response.data);
} catch (error) {
	console.error(error);
}
    },
}