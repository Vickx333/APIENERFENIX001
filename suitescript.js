/**
 * Creates a new customer record in NetSuite.
 * @param {object} data - Customer data in JSON format.
 * @returns {string} - Newly created customer's internal ID.
 */
function createCustomer(data) {
  var customerRecord = nlapiCreateRecord('customer');
  customerRecord.setFieldValue('companyname', data.nombre);
  customerRecord.setFieldValue('address1', data.direccion);
  customerRecord.setFieldValue('phone', data.telefono);
  // Add additional fields as needed
  var customerId = nlapiSubmitRecord(customerRecord);
  return customerId;
}

/**
 * Modifies an existing customer record in NetSuite.
 * @param {string} customerId - Internal ID of the customer to update.
