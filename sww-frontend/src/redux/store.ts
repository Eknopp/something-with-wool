import { configureStore } from '@reduxjs/toolkit';
import { thunk } from 'redux-thunk';
import authUser from './components/authUser/authUser.slice';

export const store = configureStore({
  reducer: {
    authUser,
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(thunk),
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
