import { GET_USERS } from '../actions/types';

const initialState = {
  profile: null,
  loading: true,
};

export default function designer(state = initialState, action) {
  const { type, payload } = action;

  switch (type) {
    case GET_USERS:
      return { ...state, profile: payload, loading: false };

    default:
      return state;
  }
}
