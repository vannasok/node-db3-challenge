const db = require('../data/dbConfig');

module.exports = {
   find,
   findById,
   findSteps,
   add,
   update,
   remove
};

function find() {
   return db('schemes');
}

function findById(id) {
   return db('schemes').where({ id: id });
}

function findSteps(id) {
   return db('steps as st')
      .join('schemes as sc', 'sc.id', '=', 'st.scheme_id')
      .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
      .where({ scheme_id: id });
}

function add(scheme) {
   return db('schemes').insert(scheme);
}

function update(changes, id) {
   return db('schemes')
      .update(changes)
      .where({ id: id });
}

function remove(id) {
   return db('schemes')
      .del()
      .where({ id: id });
}
