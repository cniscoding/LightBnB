
const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');
const { query } = require('express');

const pool = new Pool({
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

const getUserWithEmail = (email) => {
  const queryString = `
  SELECT * 
  FROM users
  WHERE email = $1`;

    return pool
    .query(queryString, [email])
    .then((result) => {
      // console.log('getUserWithEmail', result.rows[0])
      return result.rows[0]
    })
    .catch((err) => {
      // console.log(err.message);
      return null
    });
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */

 const getUserWithId = (id) => {
  const queryString = `
  SELECT * 
  FROM users
  WHERE id = $1`;

    return pool
    .query(queryString, [id])
    .then((result) => {
      // console.log('getUserwithId', result.rows[0])
      return result.rows[0]
    })
    .catch((err) => {
      // console.log(err.message);
      return null
    });
};
exports.getUserWithId = getUserWithId;


// /**
//  * Add a new user to the database.
//  * @param {{name: string, password: string, email: string}} user
//  * @return {Promise<{}>} A promise to the user.
//  */

const addUser = (user) => {
  const queryString = `
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `
    return pool
    .query(queryString, [user.name,user.email,user.password])
    .then((result) => {
      // console.log('addUser', result.rows[0])
      return result.rows[0]
    })
    .catch((err) => {
      // console.log(err.message);
      return null
    });
};
exports.addUser = addUser;


/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  // return getAllProperties(null, 2);
  const queryString =`
  SELECT properties.*, reservations.*, avg(rating) as average_rating
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON properties.id = property_reviews.property_id
  WHERE reservations.guest_id = $1
  GROUP BY properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2;`

  return pool
  .query(queryString, [guest_id, limit])
  .then((result) => {
    // console.log('addUser', result.rows)
    return result.rows
  })
  .catch((err) => {
    // console.log(err.message);
    return null
  });

}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */


 const getAllProperties = (options, limit = 10) => {
  // 1
  let queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;
  // 3
  if(options.city || options.owner_id || options.minimum_price_per_night || options.maximum_price_per_night){
    queryString += 'WHERE '
  }

  if (options.city){
    queryParams.push(`%${options.city}%`);
    queryString += `city LIKE $${queryParams.length} `;
  }

  if (options.owner_id){
    queryParams.push(`${options.owner_id}`);
    queryString += `options.owner_id = $${queryParams.length} `;
  }

  if (options.minimum_price_per_night){
    if (options.city|| options.owner_id ){
      queryString += ` AND `
    }
    queryParams.push(`${options.minimum_price_per_night * 100}`);
    queryString += `cost_per_night >= $${queryParams.length} `;
  }

  if (options.maximum_price_per_night){
    if(options.city || options.owner_id || options.minimum_price_per_night ) {
      queryString +=  ` AND `
    }
      queryParams.push(`${options.maximum_price_per_night * 100}`);
      queryString += `cost_per_night <= $${queryParams.length} `;
  }

  queryString += `GROUP BY properties.id `; 
  if (options.minimum_rating) {
    queryParams.push(`${options.minimum_rating}`);
    queryString += `HAVING avg(property_reviews.rating) >= $${queryParams.length} `;
  }
  // 4
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `
  // 5
  console.log('queryString', queryString,'queryParams', queryParams);

  // 6
  return pool.query(queryString, queryParams)
  .then((res) => res.rows);
  // .catch(err => {
  //     console.log(err.message);
  // });
  // return pool
  //   .query(queryString, queryParams)
  //   .then(result => result.rows)
  //   .catch(err => {
  //     console.log(err.message);
  //   });
  
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
// const addProperty = function(property) {
//   const propertyId = Object.keys(properties).length + 1;
//   property.id = propertyId;
//   properties[propertyId] = property;
//   return Promise.resolve(property);
// }

const addProperty = function (property) {
  const queryParams = [
    property.owner_id,
    property.title,
    property.description,
    property.thumbnail_photo_url,
    property.cover_photo_url,
    property.cost_per_night,
    property.street,
    property.city,
    property.province,
    property.post_code,
    property.country,
    property.parking_spaces,
    property.number_of_bathrooms,
    property.number_of_bedrooms,
  ];

  const queryString = `
  INSERT INTO properties (owner_id,title,description,thumbnail_photo_url,cover_photo_url,cost_per_night,street,city,province,post_code,country,parking_spaces,number_of_bathrooms,number_of_bedrooms)
  VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)
  RETURNING *;`;

  return pool
    .query(queryString, queryParams)
    .then(result => result.rows)
    .catch(err => {
      console.log(err.message);
    });
};
exports.addProperty = addProperty;
