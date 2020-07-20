import { GET_PRODUCTS } from './types';
import axios from 'axios';

const uri = 'https://aashas.herokuapp.com/api/v1';

//getProducts
export const getProducts = () => async (dispatch) => {
  try {
    const res = await axios.get(`${uri}/products`);

    dispatch({
      type: GET_PRODUCTS,
      payload: res.data,
    });
  } catch (err) {
    console.log(err);
  }
};
