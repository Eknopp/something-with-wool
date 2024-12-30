import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { LoginResponse } from '../../../api/endpoints/sessions/session.api.types';
import { AuthUserThunks } from '../authUser/authUser.thunks';
import {
  InitialAuthUserStateType,
  sessionStatus,
} from './authUser.redux.types';

const initialState: InitialAuthUserStateType = {
  data: {
    username: null,
    email: null,
    id: null,
  },
  status: sessionStatus.idle,
  error: null,
};

const authUser = createSlice({
  name: 'user',
  initialState,
  reducers: {
    setAuthUser(
      state: InitialAuthUserStateType,
      action: PayloadAction<InitialAuthUserStateType>
    ) {
      state.data = {
        username: action.payload.data.username,
        email: action.payload.data.email,
        id: action.payload.data.id,
      };
      state.status = action.payload.status;
      state.error = action.payload.error;
    },
    removeAuthUser(state: InitialAuthUserStateType) {
      state.data = {
        username: null,
        email: null,
        id: null,
      };
      state.status = sessionStatus.idle;
      state.error = null;
    },
  },
  extraReducers: (builder) => {
    // TODO: Add pending and rejected reducers
    builder
      .addCase(AuthUserThunks.login.pending, (state) => {
        state.status = sessionStatus.pending;
      })
      .addCase(
        AuthUserThunks.login.fulfilled,
        (state, action: PayloadAction<LoginResponse>) => {
          state.data.username = action.payload.username;
          state.data.email = action.payload.email;
          state.data.id = action.payload.id;
          state.status = sessionStatus.succeeded;
          state.error = null;
        }
      )
      .addCase(AuthUserThunks.login.rejected, (state, action) => {
        state.status = sessionStatus.failed;
        state.error = action.error;
      });
  },
});

export const { setAuthUser, removeAuthUser } = authUser.actions;

export default authUser.reducer;
