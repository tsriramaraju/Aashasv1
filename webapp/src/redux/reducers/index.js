import { combineReducers } from 'redux';

import designer from './designer';
import products from './products';

export default combineReducers({
  designer,
  products,
});
