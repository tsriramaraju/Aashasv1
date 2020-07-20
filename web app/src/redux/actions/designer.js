import { GET_PRODUCTS, GET_USERS } from './types';
import axios from 'axios';

const uri = 'https://aashas.herokuapp.com/api/v1';

export const getDesignerData = () => async (dispatch) => {
  try {
    const res = await axios.get(`${uri}/designer`);

    dispatch({
      type: GET_USERS,
      payload: res.data,
    });
  } catch (err) {
    console.log(err);
  }
};
