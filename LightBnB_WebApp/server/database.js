const properties = require('./json/properties.json');
const users = require('./json/users.json');

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {

  return pool.query(`
  SELECT * FROM users
  where email = $1
  `, [email])
    .then((res) => {
      if (typeof res.rows[0] === 'undefined') { console.log('returned null!'); return null; }
      console.log('returned: ', res.rows[0]); return res.rows[0];
    }
    );
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return pool.query(`
  SELECT * FROM users
  where id = $1
  `, [id])
    .then((res) => {
      if (typeof res.rows[0] === 'undefined') { console.log('returned null!'); return null; }
      console.log('returned: ', res.rows[0]); return res.rows[0];
    }
    );
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {

  return pool.query(`
  insert into users (name, email, password) values ($1, $2, $3) returning *
  `, [user.name, user.email, user.password])
    .then((res) => {
      if (typeof res.rows[0] === 'undefined') { console.log('returned null!'); return null; }
      console.log('returned: ', res.rows[0]); return res.rows[0];
    }
    );


}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {

  return pool.query(`
    SELECT reservations.*, properties.*, avg(rating) as average_rating
    FROM reservations
      JOIN properties ON properties.id = reservations.property_id
      JOIN property_reviews ON property_reviews.property_id = reservations.property_id
    WHERE reservations.guest_id = $1
    GROUP BY reservations.id, properties.id, properties.title, cost_per_night
    ORDER BY start_date DESC
    LIMIT $2;
  `, [guest_id, limit])
    .then((res) => {
      if (typeof res.rows[0] === 'undefined') { console.log('returned null!'); return null; }
      console.log('returned: ', res.rows[0]); return res.rows;
    }
    );

}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function (options, limit = 20) {
  // 1
  const queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  // 3
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `;
  }
  if (options.minimum_price_per_night) {
    queryParams.push(options.minimum_price_per_night * 100);
    if (queryParams.length === 1) {
      queryString += `WHERE cost_per_night > $${queryParams.length} `;
    } else {
      queryString += `AND cost_per_night > $${queryParams.length} `;
    }
  }
  if (options.maximum_price_per_night) {
    queryParams.push(options.maximum_price_per_night * 100);
    if (queryParams.length === 1) {
      queryString += `WHERE cost_per_night < $${queryParams.length} `;
    } else {
      queryString += `AND cost_per_night < $${queryParams.length} `;
    }
  }

  queryString += `GROUP BY properties.id `;

  if (options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    if (queryParams.length === 1) {
      queryString += `having avg(property_reviews.rating) >= $${queryParams.length} `;
    } else {
      queryString += `having avg(property_reviews.rating) >= $${queryParams.length} `;
    }
  }

  // 4
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;
  console.log(queryString, queryParams);
  // 6
  return pool.query(queryString, queryParams)
    .then(res => res.rows);
}

exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  /*   const propertyId = Object.keys(properties).length + 1;
    property.id = propertyId;
    properties[propertyId] = property;
    return Promise.resolve(property); */
  return pool.query(`
  insert into properties (owner_id,
    title,
    description,
    thumbnail_photo_url,
    cover_photo_url,
    cost_per_night,
    street,
    city,
    province,
    post_code,
    country,
    parking_spaces,
    number_of_bathrooms,
    number_of_bedrooms) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) returning *
  `, [property.owner_id, property.title, property.description, property.thumbnail_photo_url, property.cover_photo_url, property.cost_per_night, property.street, property.city, property.province, property.post_code, property.country, property.parking_spaces, property.number_of_bathrooms, property.number_of_bedrooms])
    .then((res) => {
      if (typeof res.rows[0] === 'undefined') { console.log('returned null!'); return null; }
      console.log('returned: ', res.rows[0]); return res.rows[0];
    }
    );
}
exports.addProperty = addProperty;
